//
// ActivitySubscription.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public final class ActivitySubscription: Codable, JSONEncodable, Hashable {

    public var events: [String]?
    public var objectId: String?
    public var objectType: ActivityOwnerType?
    public var userId: String?

    public init(events: [String]? = nil, objectId: String? = nil, objectType: ActivityOwnerType? = nil, userId: String? = nil) {
        self.events = events
        self.objectId = objectId
        self.objectType = objectType
        self.userId = userId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case events = "Events"
        case objectId = "ObjectId"
        case objectType = "ObjectType"
        case userId = "UserId"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(events, forKey: .events)
        try container.encodeIfPresent(objectId, forKey: .objectId)
        try container.encodeIfPresent(objectType, forKey: .objectType)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public static func == (lhs: ActivitySubscription, rhs: ActivitySubscription) -> Bool {
        lhs.events == rhs.events &&
        lhs.objectId == rhs.objectId &&
        lhs.objectType == rhs.objectType &&
        lhs.userId == rhs.userId
        
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(events?.hashValue)
        hasher.combine(objectId?.hashValue)
        hasher.combine(objectType?.hashValue)
        hasher.combine(userId?.hashValue)
        
    }
}

