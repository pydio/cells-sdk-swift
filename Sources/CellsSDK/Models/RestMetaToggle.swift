//
// RestMetaToggle.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RestMetaToggle: Sendable, Codable, JSONEncodable, Hashable {

    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case value = "Value"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

