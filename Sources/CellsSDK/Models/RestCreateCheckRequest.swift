//
// RestCreateCheckRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/** Request for pre-checking nodes before uploading or creating them. */
public final class RestCreateCheckRequest: Codable, JSONEncodable, Hashable {

    public var findAvailablePath: Bool?
    public var inputs: [RestIncomingNode]

    public init(findAvailablePath: Bool? = nil, inputs: [RestIncomingNode]) {
        self.findAvailablePath = findAvailablePath
        self.inputs = inputs
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case findAvailablePath = "FindAvailablePath"
        case inputs = "Inputs"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(findAvailablePath, forKey: .findAvailablePath)
        try container.encode(inputs, forKey: .inputs)
    }

    public static func == (lhs: RestCreateCheckRequest, rhs: RestCreateCheckRequest) -> Bool {
        lhs.findAvailablePath == rhs.findAvailablePath &&
        lhs.inputs == rhs.inputs
        
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(findAvailablePath?.hashValue)
        hasher.combine(inputs.hashValue)
        
    }
}

