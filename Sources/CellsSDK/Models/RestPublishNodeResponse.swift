//
// RestPublishNodeResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RestPublishNodeResponse: Sendable, Codable, JSONEncodable, Hashable {

    public var cascadeResults: [RestPublishCascadeResult]?
    public var node: RestNode?

    public init(cascadeResults: [RestPublishCascadeResult]? = nil, node: RestNode? = nil) {
        self.cascadeResults = cascadeResults
        self.node = node
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case cascadeResults = "CascadeResults"
        case node = "Node"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(cascadeResults, forKey: .cascadeResults)
        try container.encodeIfPresent(node, forKey: .node)
    }
}

