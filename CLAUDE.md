# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Test

```bash
# Build
swift build

# Run all tests (requires a live Cells server)
API_URL=https://your-cells-server API_TOKEN=your-token API_ROOT_PATH=common-files swift test

# Run a single test
API_URL=https://... API_TOKEN=... swift test --filter CellsSDKTests/testLookup

# Format code
swiftformat .
```

## SDK Regeneration

The entire `Sources/CellsSDK/` directory is generated from the Cells REST OpenAPI spec. To regenerate:

```bash
# Requires openapi-generator-cli v7.12.0 (or use the Nix dev shell)
nix develop  # provides openapi-generator-cli, curl, jq, git

./scripts/generate-sdk.sh [BRANCH_OR_TAG] [OUTPUT_DIR]
# e.g.: ./scripts/generate-sdk.sh v5-dev .
```

The script runs the generator twice: first with `useClasses: false` (structs), then a second pass with `useClasses: true` solely to extract `ActivityObject.swift` and patch it into a `public final class` — required because the type is self-referential.

Files protected from regeneration are listed in `.openapi-generator-ignore` (includes `Package.swift`, `Tests/`, `scripts/`, `.github/`, etc.).

## Architecture

**Single library target:** `CellsSDK` (iOS 16+, macOS 10.15+, tvOS 12+, watchOS 4+, Swift 6 language mode). No external runtime dependencies. Tests depend on `aws-sdk-swift` exact `1.3.18` for S3 upload validation.

```
Sources/CellsSDK/
├── APIs/NodeServiceAPI.swift       # All REST endpoints as static methods
├── Infrastructure/                 # Networking plumbing (not regenerated)
└── Models/                        # ~90 generated structs/enums
```

**Key types:**

- `CellsSDKAPIConfiguration` — configures `basePath`, Bearer token via `customHeaders`, `requestBuilderFactory`, `apiResponseQueue`, and an optional `interceptor`.
- `NodeServiceAPI` — every Cells endpoint exposed as two variants: `async throws(ErrorResponse)` and `...WithRequestBuilder` returning `RequestBuilder<T>`.
- `RequestBuilder<T>` / `URLSessionRequestBuilder<T>` — wraps `URLRequest` execution with both completion-handler and async/await support.
- `Response<T>` — typed HTTP response wrapper (statusCode, headers, body).
- `ErrorResponse` — `enum` with a single case `.error(Int, Data?, URLResponse?, Error)`.

**Model naming conventions:**

| Prefix | Domain |
|--------|--------|
| `Rest*` | Core REST request/response types |
| `Tree*` | File-system node types |
| `Idm*` | Identity management |
| `Jobs*` | Background job commands/status |
| `Activity*` | Activity streams |
| `Service*` | Resource policy types |

All models are `struct` implementing `Codable, JSONEncodable, Hashable, Sendable` — except `ActivityObject`, which is `public final class … Sendable` with `let` properties (self-referential type).

## Integration Tests

Tests are integration-only — there are no unit tests. They hit a live Cells server and require three environment variables: `API_URL`, `API_TOKEN`, `API_ROOT_PATH`. The CI workflow has tests commented out; they run locally against a real server.
