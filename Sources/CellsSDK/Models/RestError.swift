//
// RestError.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RestError: Sendable, Codable, JSONEncodable, Hashable {

    public var code: String?
    public var detail: String?
    public var meta: [String: String]?
    public var source: String?
    public var title: String?

    public init(code: String? = nil, detail: String? = nil, meta: [String: String]? = nil, source: String? = nil, title: String? = nil) {
        self.code = code
        self.detail = detail
        self.meta = meta
        self.source = source
        self.title = title
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case code = "Code"
        case detail = "Detail"
        case meta = "Meta"
        case source = "Source"
        case title = "Title"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(detail, forKey: .detail)
        try container.encodeIfPresent(meta, forKey: .meta)
        try container.encodeIfPresent(source, forKey: .source)
        try container.encodeIfPresent(title, forKey: .title)
    }
}

