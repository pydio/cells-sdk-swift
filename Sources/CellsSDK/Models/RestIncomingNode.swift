//
// RestIncomingNode.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RestIncomingNode: Sendable, Codable, JSONEncodable, Hashable {

    public var contentType: String?
    public var draftMode: Bool?
    public var knownSize: String?
    public var locator: RestNodeLocator
    public var metadata: [RestUserMeta]?
    public var resourceUuid: String?
    public var templateUuid: String?
    public var type: TreeNodeType
    public var versionId: String?

    public init(contentType: String? = nil, draftMode: Bool? = nil, knownSize: String? = nil, locator: RestNodeLocator, metadata: [RestUserMeta]? = nil, resourceUuid: String? = nil, templateUuid: String? = nil, type: TreeNodeType, versionId: String? = nil) {
        self.contentType = contentType
        self.draftMode = draftMode
        self.knownSize = knownSize
        self.locator = locator
        self.metadata = metadata
        self.resourceUuid = resourceUuid
        self.templateUuid = templateUuid
        self.type = type
        self.versionId = versionId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case contentType = "ContentType"
        case draftMode = "DraftMode"
        case knownSize = "KnownSize"
        case locator = "Locator"
        case metadata = "Metadata"
        case resourceUuid = "ResourceUuid"
        case templateUuid = "TemplateUuid"
        case type = "Type"
        case versionId = "VersionId"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(contentType, forKey: .contentType)
        try container.encodeIfPresent(draftMode, forKey: .draftMode)
        try container.encodeIfPresent(knownSize, forKey: .knownSize)
        try container.encode(locator, forKey: .locator)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(resourceUuid, forKey: .resourceUuid)
        try container.encodeIfPresent(templateUuid, forKey: .templateUuid)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(versionId, forKey: .versionId)
    }
}

