//
// RestDataSourceFeatures.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RestDataSourceFeatures: Sendable, Codable, JSONEncodable, Hashable {

    public var encrypted: Bool?
    public var versioned: Bool?

    public init(encrypted: Bool? = nil, versioned: Bool? = nil) {
        self.encrypted = encrypted
        self.versioned = versioned
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case encrypted = "Encrypted"
        case versioned = "Versioned"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(encrypted, forKey: .encrypted)
        try container.encodeIfPresent(versioned, forKey: .versioned)
    }
}

