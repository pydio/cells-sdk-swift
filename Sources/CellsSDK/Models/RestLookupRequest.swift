//
// RestLookupRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RestLookupRequest: Sendable, Codable, JSONEncodable, Hashable {

    public var flags: [RestFlag]?
    public var limit: String?
    public var locators: RestNodeLocators?
    public var offset: String?
    public var query: TreeQuery?
    public var sortDirDesc: Bool?
    public var sortField: String?

    public init(flags: [RestFlag]? = nil, limit: String? = nil, locators: RestNodeLocators? = nil, offset: String? = nil, query: TreeQuery? = nil, sortDirDesc: Bool? = nil, sortField: String? = nil) {
        self.flags = flags
        self.limit = limit
        self.locators = locators
        self.offset = offset
        self.query = query
        self.sortDirDesc = sortDirDesc
        self.sortField = sortField
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case flags = "Flags"
        case limit = "Limit"
        case locators = "Locators"
        case offset = "Offset"
        case query = "Query"
        case sortDirDesc = "SortDirDesc"
        case sortField = "SortField"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(flags, forKey: .flags)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(locators, forKey: .locators)
        try container.encodeIfPresent(offset, forKey: .offset)
        try container.encodeIfPresent(query, forKey: .query)
        try container.encodeIfPresent(sortDirDesc, forKey: .sortDirDesc)
        try container.encodeIfPresent(sortField, forKey: .sortField)
    }
}

