//
// RestNamespaceValuesResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RestNamespaceValuesResponse: Sendable, Codable, JSONEncodable, Hashable {

    public var values: [String]?

    public init(values: [String]? = nil) {
        self.values = values
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case values = "Values"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(values, forKey: .values)
    }
}

