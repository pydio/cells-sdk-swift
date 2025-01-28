//
// TreeChangeLog.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct TreeChangeLog: Sendable, Codable, JSONEncodable, Hashable {

    public var data: Data?
    public var description: String?
    public var event: TreeNodeChangeEvent?
    public var location: TreeNode?
    public var mTime: String?
    public var ownerUuid: String?
    public var size: String?
    public var uuid: String?

    public init(data: Data? = nil, description: String? = nil, event: TreeNodeChangeEvent? = nil, location: TreeNode? = nil, mTime: String? = nil, ownerUuid: String? = nil, size: String? = nil, uuid: String? = nil) {
        self.data = data
        self.description = description
        self.event = event
        self.location = location
        self.mTime = mTime
        self.ownerUuid = ownerUuid
        self.size = size
        self.uuid = uuid
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case data = "Data"
        case description = "Description"
        case event = "Event"
        case location = "Location"
        case mTime = "MTime"
        case ownerUuid = "OwnerUuid"
        case size = "Size"
        case uuid = "Uuid"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(data, forKey: .data)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(event, forKey: .event)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(mTime, forKey: .mTime)
        try container.encodeIfPresent(ownerUuid, forKey: .ownerUuid)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(uuid, forKey: .uuid)
    }
}

