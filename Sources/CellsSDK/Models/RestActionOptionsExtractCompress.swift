//
// RestActionOptionsExtractCompress.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RestActionOptionsExtractCompress: Sendable, Codable, JSONEncodable, Hashable {

    public var archiveFormat: String
    public var targetPath: String

    public init(archiveFormat: String, targetPath: String) {
        self.archiveFormat = archiveFormat
        self.targetPath = targetPath
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case archiveFormat = "ArchiveFormat"
        case targetPath = "TargetPath"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(archiveFormat, forKey: .archiveFormat)
        try container.encode(targetPath, forKey: .targetPath)
    }
}

