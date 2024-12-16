//
// RestContextWorkspace.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public final class RestContextWorkspace: Codable, JSONEncodable, Hashable {

    public var description: String?
    public var isRoot: Bool?
    public var isVirtualRoot: Bool?
    public var label: String?
    public var permissions: String?
    public var quota: String?
    public var quotaUsage: String?
    public var scope: IdmWorkspaceScope?
    public var skipRecycle: Bool?
    public var slug: String?
    public var syncable: Bool?
    public var uuid: String?

    public init(description: String? = nil, isRoot: Bool? = nil, isVirtualRoot: Bool? = nil, label: String? = nil, permissions: String? = nil, quota: String? = nil, quotaUsage: String? = nil, scope: IdmWorkspaceScope? = nil, skipRecycle: Bool? = nil, slug: String? = nil, syncable: Bool? = nil, uuid: String? = nil) {
        self.description = description
        self.isRoot = isRoot
        self.isVirtualRoot = isVirtualRoot
        self.label = label
        self.permissions = permissions
        self.quota = quota
        self.quotaUsage = quotaUsage
        self.scope = scope
        self.skipRecycle = skipRecycle
        self.slug = slug
        self.syncable = syncable
        self.uuid = uuid
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case description = "Description"
        case isRoot = "IsRoot"
        case isVirtualRoot = "IsVirtualRoot"
        case label = "Label"
        case permissions = "Permissions"
        case quota = "Quota"
        case quotaUsage = "QuotaUsage"
        case scope = "Scope"
        case skipRecycle = "SkipRecycle"
        case slug = "Slug"
        case syncable = "Syncable"
        case uuid = "Uuid"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(isRoot, forKey: .isRoot)
        try container.encodeIfPresent(isVirtualRoot, forKey: .isVirtualRoot)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(permissions, forKey: .permissions)
        try container.encodeIfPresent(quota, forKey: .quota)
        try container.encodeIfPresent(quotaUsage, forKey: .quotaUsage)
        try container.encodeIfPresent(scope, forKey: .scope)
        try container.encodeIfPresent(skipRecycle, forKey: .skipRecycle)
        try container.encodeIfPresent(slug, forKey: .slug)
        try container.encodeIfPresent(syncable, forKey: .syncable)
        try container.encodeIfPresent(uuid, forKey: .uuid)
    }

    public static func == (lhs: RestContextWorkspace, rhs: RestContextWorkspace) -> Bool {
        lhs.description == rhs.description &&
        lhs.isRoot == rhs.isRoot &&
        lhs.isVirtualRoot == rhs.isVirtualRoot &&
        lhs.label == rhs.label &&
        lhs.permissions == rhs.permissions &&
        lhs.quota == rhs.quota &&
        lhs.quotaUsage == rhs.quotaUsage &&
        lhs.scope == rhs.scope &&
        lhs.skipRecycle == rhs.skipRecycle &&
        lhs.slug == rhs.slug &&
        lhs.syncable == rhs.syncable &&
        lhs.uuid == rhs.uuid
        
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(description?.hashValue)
        hasher.combine(isRoot?.hashValue)
        hasher.combine(isVirtualRoot?.hashValue)
        hasher.combine(label?.hashValue)
        hasher.combine(permissions?.hashValue)
        hasher.combine(quota?.hashValue)
        hasher.combine(quotaUsage?.hashValue)
        hasher.combine(scope?.hashValue)
        hasher.combine(skipRecycle?.hashValue)
        hasher.combine(slug?.hashValue)
        hasher.combine(syncable?.hashValue)
        hasher.combine(uuid?.hashValue)
        
    }
}

