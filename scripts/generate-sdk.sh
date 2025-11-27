#!/usr/bin/env bash
set -euo pipefail

# Default values
CELLS_BRANCH="${1:-v5-dev}"
OUTPUT_DIR="${2:-.}"
SPEC_URL=""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
usage() {
    cat << EOF
Usage: $0 [BRANCH_OR_TAG] [OUTPUT_DIR]

Generate Swift SDK from Pydio Cells OpenAPI specification.

Arguments:
  BRANCH_OR_TAG    Pydio Cells branch or tag to use (default: v5-dev)
  OUTPUT_DIR       Output directory for generated files (default: current directory)

Examples:
  $0                          # Generate from v5-dev branch
  $0 v4.4.0                   # Generate from v4.4.0 tag
  $0 v5-dev /tmp/output       # Generate to /tmp/output directory

EOF
    exit 1
}

# Parse arguments
if [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    usage
fi

# Construct spec URL
SPEC_URL="https://raw.githubusercontent.com/pydio/cells/${CELLS_BRANCH}/common/proto/rest/cellsapi-rest-v2.swagger.json"

info "Generating SDK from Pydio Cells ${CELLS_BRANCH}"
info "OpenAPI Spec URL: ${SPEC_URL}"
info "Output directory: ${OUTPUT_DIR}"

# Check if openapi-generator-cli or openapi-generator is available
if command -v openapi-generator-cli &> /dev/null; then
    GENERATOR_CMD="openapi-generator-cli"
elif command -v openapi-generator &> /dev/null; then
    GENERATOR_CMD="openapi-generator"
    # Check version if using openapi-generator
    OAG_VERSION=$(openapi-generator version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' || echo "")
    if [[ -n "$OAG_VERSION" ]] && [[ "$OAG_VERSION" != "7.12.0" ]]; then
        warn "openapi-generator version is $OAG_VERSION (recommended: 7.12.0)"
    fi
else
    error "Neither openapi-generator-cli nor openapi-generator found."
    error "Please install it from https://openapi-generator.tech/docs/installation"
    error "Required version is 7.12.0"
    exit 1
fi

info "Using generator: ${GENERATOR_CMD}"

# Create temporary directory for spec file and configs
TEMP_DIR=$(mktemp -d)
trap "rm -rf ${TEMP_DIR}" EXIT

SPEC_FILE="${TEMP_DIR}/cellsapi-rest-v2.swagger.json"

# Download OpenAPI spec
info "Downloading OpenAPI specification..."
if ! curl -f -s -o "${SPEC_FILE}" "${SPEC_URL}"; then
    error "Failed to download OpenAPI spec from ${SPEC_URL}"
    error "Please verify the branch/tag exists: https://github.com/pydio/cells/tree/${CELLS_BRANCH}"
    exit 1
fi

# Verify the downloaded file is valid JSON
if ! command -v jq &> /dev/null; then
    warn "jq not found, skipping JSON validation"
elif ! jq empty "${SPEC_FILE}" 2>/dev/null; then
    error "Downloaded file is not valid JSON"
    exit 1
fi

info "OpenAPI spec downloaded successfully"

# Files to preserve (backup before generation)
PRESERVE_FILES=(
    "Package.swift"
    ".gitignore"
    "README.md"
    "LICENSE"
    "CellsSDK.podspec"
    "Cartfile"
    ".swiftformat"
    ".openapi-generator-ignore"
    ".github"
    "Tests"
    "scripts"
    ".git"
    "project.yml"
    "Package.resolved"
    "docs"
)

# Create backup directory
BACKUP_DIR="${TEMP_DIR}/backup"
mkdir -p "${BACKUP_DIR}"

info "Backing up files to preserve..."
for file in "${PRESERVE_FILES[@]}"; do
    if [ -e "${OUTPUT_DIR}/${file}" ]; then
        cp -r "${OUTPUT_DIR}/${file}" "${BACKUP_DIR}/" 2>/dev/null || true
    fi
done

# Create temporary config files
SWIFT_CONFIG="${TEMP_DIR}/swagger-swift.json"
SWIFT_CLASSES_CONFIG="${TEMP_DIR}/swagger-swift-classes.json"

cat > "${SWIFT_CONFIG}" << 'EOF'
{
  "projectName": "CellsSDK",
  "useClasses": false
}
EOF

cat > "${SWIFT_CLASSES_CONFIG}" << 'EOF'
{
  "projectName": "CellsSDK",
  "useClasses": true
}
EOF

# Generate Swift SDK with structs (default)
info "Generating Swift SDK with structs..."
GENERATOR_CMD_ARGS=(
    generate
    -i "${SPEC_FILE}"
    -g swift6
    -c "${SWIFT_CONFIG}"
    -o "${OUTPUT_DIR}"
    --skip-validate-spec
)

if ! "${GENERATOR_CMD}" "${GENERATOR_CMD_ARGS[@]}"; then
    error "OpenAPI Generator failed"
    exit 1
fi

# Generate Swift SDK with classes (for ActivityObject patching)
info "Generating Swift SDK with classes (for ActivityObject patching)..."
TEMP_CLASSES_DIR="${TEMP_DIR}/swift-classes"
GENERATOR_CMD_ARGS_CLASSES=(
    generate
    -i "${SPEC_FILE}"
    -g swift6
    -c "${SWIFT_CLASSES_CONFIG}"
    -o "${TEMP_CLASSES_DIR}"
    --skip-validate-spec
)

if ! "${GENERATOR_CMD}" "${GENERATOR_CMD_ARGS_CLASSES[@]}"; then
    warn "Failed to generate classes version, skipping ActivityObject patching"
else
    # Patch ActivityObject.swift: replace struct with Sendable class
    ACTIVITY_OBJECT_CLASSES="${TEMP_CLASSES_DIR}/Sources/CellsSDK/Models/ActivityObject.swift"
    ACTIVITY_OBJECT_OUTPUT="${OUTPUT_DIR}/Sources/CellsSDK/Models/ActivityObject.swift"
    
    if [ -f "${ACTIVITY_OBJECT_CLASSES}" ] && [ -f "${ACTIVITY_OBJECT_OUTPUT}" ]; then
        info "Patching ActivityObject.swift to use Sendable class..."
        # Replace struct with class and add Sendable, change var to let
        if [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS sed
            sed -i.bak \
                -e 's/public struct ActivityObject/public final class ActivityObject/g' \
                -e 's/Hashable/Hashable, Sendable/g' \
                -e 's/public var/public let/g' \
                "${ACTIVITY_OBJECT_CLASSES}"
            rm -f "${ACTIVITY_OBJECT_CLASSES}.bak"
        else
            # Linux sed
            sed -i \
                -e 's/public struct ActivityObject/public final class ActivityObject/g' \
                -e 's/Hashable/Hashable, Sendable/g' \
                -e 's/public var/public let/g' \
                "${ACTIVITY_OBJECT_CLASSES}"
        fi
        cp "${ACTIVITY_OBJECT_CLASSES}" "${ACTIVITY_OBJECT_OUTPUT}"
        info "ActivityObject.swift patched successfully"
    else
        warn "ActivityObject.swift not found in generated files, skipping patch"
    fi
fi

# Restore preserved files
info "Restoring preserved files..."
for file in "${PRESERVE_FILES[@]}"; do
    if [ -e "${BACKUP_DIR}/${file}" ]; then
        rm -rf "${OUTPUT_DIR}/${file}" 2>/dev/null || true
        cp -r "${BACKUP_DIR}/${file}" "${OUTPUT_DIR}/" 2>/dev/null || true
    fi
done

info "SDK generation completed successfully!"
info "Generated files are in: ${OUTPUT_DIR}"
info ""
info "Next steps:"
info "  1. Review the generated files"
info "  2. Run 'swift build' to verify the build"
info "  3. Run tests if available"
