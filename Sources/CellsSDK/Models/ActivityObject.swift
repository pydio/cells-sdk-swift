//
// ActivityObject.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public final class ActivityObject: Codable, JSONEncodable, Hashable, Sendable {

    public let context: String?
    public let accuracy: Float?
    public let actor: ActivityObject?
    public let altitude: Float?
    public let anyOf: ActivityObject?
    public let attachment: ActivityObject?
    public let attributedTo: ActivityObject?
    public let audience: ActivityObject?
    public let bcc: ActivityObject?
    public let bto: ActivityObject?
    public let cc: ActivityObject?
    public let closed: Date?
    public let content: ActivityObject?
    public let current: ActivityObject?
    public let deleted: Date?
    public let duration: Date?
    public let endTime: Date?
    public let first: ActivityObject?
    public let formerType: ActivityObjectType?
    public let generator: ActivityObject?
    public let height: Int?
    public let href: String?
    public let hreflang: String?
    public let icon: ActivityObject?
    public let id: String?
    public let image: ActivityObject?
    public let inReplyTo: ActivityObject?
    public let instrument: ActivityObject?
    public let items: [ActivityObject]?
    public let last: ActivityObject?
    public let latitude: Float?
    public let location: ActivityObject?
    public let longitude: Float?
    public let markdown: String?
    public let mediaType: String?
    public let name: String?
    public let next: ActivityObject?
    public let object: ActivityObject?
    public let oneOf: ActivityObject?
    public let origin: ActivityObject?
    public let partOf: ActivityObject?
    public let prev: ActivityObject?
    public let preview: ActivityObject?
    public let published: Date?
    public let radius: Float?
    public let rel: String?
    public let relationship: ActivityObject?
    public let replies: ActivityObject?
    public let result: ActivityObject?
    public let startTime: Date?
    public let subject: ActivityObject?
    public let summary: String?
    public let tag: ActivityObject?
    public let target: ActivityObject?
    public let to: ActivityObject?
    public let totalItems: Int?
    public let type: ActivityObjectType?
    public let units: String?
    public let updated: Date?
    public let url: ActivityObject?
    public let width: Int?

    public init(context: String? = nil, accuracy: Float? = nil, actor: ActivityObject? = nil, altitude: Float? = nil, anyOf: ActivityObject? = nil, attachment: ActivityObject? = nil, attributedTo: ActivityObject? = nil, audience: ActivityObject? = nil, bcc: ActivityObject? = nil, bto: ActivityObject? = nil, cc: ActivityObject? = nil, closed: Date? = nil, content: ActivityObject? = nil, current: ActivityObject? = nil, deleted: Date? = nil, duration: Date? = nil, endTime: Date? = nil, first: ActivityObject? = nil, formerType: ActivityObjectType? = nil, generator: ActivityObject? = nil, height: Int? = nil, href: String? = nil, hreflang: String? = nil, icon: ActivityObject? = nil, id: String? = nil, image: ActivityObject? = nil, inReplyTo: ActivityObject? = nil, instrument: ActivityObject? = nil, items: [ActivityObject]? = nil, last: ActivityObject? = nil, latitude: Float? = nil, location: ActivityObject? = nil, longitude: Float? = nil, markdown: String? = nil, mediaType: String? = nil, name: String? = nil, next: ActivityObject? = nil, object: ActivityObject? = nil, oneOf: ActivityObject? = nil, origin: ActivityObject? = nil, partOf: ActivityObject? = nil, prev: ActivityObject? = nil, preview: ActivityObject? = nil, published: Date? = nil, radius: Float? = nil, rel: String? = nil, relationship: ActivityObject? = nil, replies: ActivityObject? = nil, result: ActivityObject? = nil, startTime: Date? = nil, subject: ActivityObject? = nil, summary: String? = nil, tag: ActivityObject? = nil, target: ActivityObject? = nil, to: ActivityObject? = nil, totalItems: Int? = nil, type: ActivityObjectType? = nil, units: String? = nil, updated: Date? = nil, url: ActivityObject? = nil, width: Int? = nil) {
        self.context = context
        self.accuracy = accuracy
        self.actor = actor
        self.altitude = altitude
        self.anyOf = anyOf
        self.attachment = attachment
        self.attributedTo = attributedTo
        self.audience = audience
        self.bcc = bcc
        self.bto = bto
        self.cc = cc
        self.closed = closed
        self.content = content
        self.current = current
        self.deleted = deleted
        self.duration = duration
        self.endTime = endTime
        self.first = first
        self.formerType = formerType
        self.generator = generator
        self.height = height
        self.href = href
        self.hreflang = hreflang
        self.icon = icon
        self.id = id
        self.image = image
        self.inReplyTo = inReplyTo
        self.instrument = instrument
        self.items = items
        self.last = last
        self.latitude = latitude
        self.location = location
        self.longitude = longitude
        self.markdown = markdown
        self.mediaType = mediaType
        self.name = name
        self.next = next
        self.object = object
        self.oneOf = oneOf
        self.origin = origin
        self.partOf = partOf
        self.prev = prev
        self.preview = preview
        self.published = published
        self.radius = radius
        self.rel = rel
        self.relationship = relationship
        self.replies = replies
        self.result = result
        self.startTime = startTime
        self.subject = subject
        self.summary = summary
        self.tag = tag
        self.target = target
        self.to = to
        self.totalItems = totalItems
        self.type = type
        self.units = units
        self.updated = updated
        self.url = url
        self.width = width
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case context = "@context"
        case accuracy
        case actor
        case altitude
        case anyOf
        case attachment
        case attributedTo
        case audience
        case bcc
        case bto
        case cc
        case closed
        case content
        case current
        case deleted
        case duration
        case endTime
        case first
        case formerType
        case generator
        case height
        case href
        case hreflang
        case icon
        case id
        case image
        case inReplyTo
        case instrument
        case items
        case last
        case latitude
        case location
        case longitude
        case markdown
        case mediaType
        case name
        case next
        case object
        case oneOf
        case origin
        case partOf
        case prev
        case preview
        case published
        case radius
        case rel
        case relationship
        case replies
        case result
        case startTime
        case subject
        case summary
        case tag
        case target
        case to
        case totalItems
        case type
        case units
        case updated
        case url
        case width
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(context, forKey: .context)
        try container.encodeIfPresent(accuracy, forKey: .accuracy)
        try container.encodeIfPresent(actor, forKey: .actor)
        try container.encodeIfPresent(altitude, forKey: .altitude)
        try container.encodeIfPresent(anyOf, forKey: .anyOf)
        try container.encodeIfPresent(attachment, forKey: .attachment)
        try container.encodeIfPresent(attributedTo, forKey: .attributedTo)
        try container.encodeIfPresent(audience, forKey: .audience)
        try container.encodeIfPresent(bcc, forKey: .bcc)
        try container.encodeIfPresent(bto, forKey: .bto)
        try container.encodeIfPresent(cc, forKey: .cc)
        try container.encodeIfPresent(closed, forKey: .closed)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(current, forKey: .current)
        try container.encodeIfPresent(deleted, forKey: .deleted)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(endTime, forKey: .endTime)
        try container.encodeIfPresent(first, forKey: .first)
        try container.encodeIfPresent(formerType, forKey: .formerType)
        try container.encodeIfPresent(generator, forKey: .generator)
        try container.encodeIfPresent(height, forKey: .height)
        try container.encodeIfPresent(href, forKey: .href)
        try container.encodeIfPresent(hreflang, forKey: .hreflang)
        try container.encodeIfPresent(icon, forKey: .icon)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(inReplyTo, forKey: .inReplyTo)
        try container.encodeIfPresent(instrument, forKey: .instrument)
        try container.encodeIfPresent(items, forKey: .items)
        try container.encodeIfPresent(last, forKey: .last)
        try container.encodeIfPresent(latitude, forKey: .latitude)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(longitude, forKey: .longitude)
        try container.encodeIfPresent(markdown, forKey: .markdown)
        try container.encodeIfPresent(mediaType, forKey: .mediaType)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(next, forKey: .next)
        try container.encodeIfPresent(object, forKey: .object)
        try container.encodeIfPresent(oneOf, forKey: .oneOf)
        try container.encodeIfPresent(origin, forKey: .origin)
        try container.encodeIfPresent(partOf, forKey: .partOf)
        try container.encodeIfPresent(prev, forKey: .prev)
        try container.encodeIfPresent(preview, forKey: .preview)
        try container.encodeIfPresent(published, forKey: .published)
        try container.encodeIfPresent(radius, forKey: .radius)
        try container.encodeIfPresent(rel, forKey: .rel)
        try container.encodeIfPresent(relationship, forKey: .relationship)
        try container.encodeIfPresent(replies, forKey: .replies)
        try container.encodeIfPresent(result, forKey: .result)
        try container.encodeIfPresent(startTime, forKey: .startTime)
        try container.encodeIfPresent(subject, forKey: .subject)
        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encodeIfPresent(tag, forKey: .tag)
        try container.encodeIfPresent(target, forKey: .target)
        try container.encodeIfPresent(to, forKey: .to)
        try container.encodeIfPresent(totalItems, forKey: .totalItems)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(units, forKey: .units)
        try container.encodeIfPresent(updated, forKey: .updated)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(width, forKey: .width)
    }

    public static func == (lhs: ActivityObject, rhs: ActivityObject) -> Bool {
        lhs.context == rhs.context &&
        lhs.accuracy == rhs.accuracy &&
        lhs.actor == rhs.actor &&
        lhs.altitude == rhs.altitude &&
        lhs.anyOf == rhs.anyOf &&
        lhs.attachment == rhs.attachment &&
        lhs.attributedTo == rhs.attributedTo &&
        lhs.audience == rhs.audience &&
        lhs.bcc == rhs.bcc &&
        lhs.bto == rhs.bto &&
        lhs.cc == rhs.cc &&
        lhs.closed == rhs.closed &&
        lhs.content == rhs.content &&
        lhs.current == rhs.current &&
        lhs.deleted == rhs.deleted &&
        lhs.duration == rhs.duration &&
        lhs.endTime == rhs.endTime &&
        lhs.first == rhs.first &&
        lhs.formerType == rhs.formerType &&
        lhs.generator == rhs.generator &&
        lhs.height == rhs.height &&
        lhs.href == rhs.href &&
        lhs.hreflang == rhs.hreflang &&
        lhs.icon == rhs.icon &&
        lhs.id == rhs.id &&
        lhs.image == rhs.image &&
        lhs.inReplyTo == rhs.inReplyTo &&
        lhs.instrument == rhs.instrument &&
        lhs.items == rhs.items &&
        lhs.last == rhs.last &&
        lhs.latitude == rhs.latitude &&
        lhs.location == rhs.location &&
        lhs.longitude == rhs.longitude &&
        lhs.markdown == rhs.markdown &&
        lhs.mediaType == rhs.mediaType &&
        lhs.name == rhs.name &&
        lhs.next == rhs.next &&
        lhs.object == rhs.object &&
        lhs.oneOf == rhs.oneOf &&
        lhs.origin == rhs.origin &&
        lhs.partOf == rhs.partOf &&
        lhs.prev == rhs.prev &&
        lhs.preview == rhs.preview &&
        lhs.published == rhs.published &&
        lhs.radius == rhs.radius &&
        lhs.rel == rhs.rel &&
        lhs.relationship == rhs.relationship &&
        lhs.replies == rhs.replies &&
        lhs.result == rhs.result &&
        lhs.startTime == rhs.startTime &&
        lhs.subject == rhs.subject &&
        lhs.summary == rhs.summary &&
        lhs.tag == rhs.tag &&
        lhs.target == rhs.target &&
        lhs.to == rhs.to &&
        lhs.totalItems == rhs.totalItems &&
        lhs.type == rhs.type &&
        lhs.units == rhs.units &&
        lhs.updated == rhs.updated &&
        lhs.url == rhs.url &&
        lhs.width == rhs.width
        
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(context?.hashValue)
        hasher.combine(accuracy?.hashValue)
        hasher.combine(actor?.hashValue)
        hasher.combine(altitude?.hashValue)
        hasher.combine(anyOf?.hashValue)
        hasher.combine(attachment?.hashValue)
        hasher.combine(attributedTo?.hashValue)
        hasher.combine(audience?.hashValue)
        hasher.combine(bcc?.hashValue)
        hasher.combine(bto?.hashValue)
        hasher.combine(cc?.hashValue)
        hasher.combine(closed?.hashValue)
        hasher.combine(content?.hashValue)
        hasher.combine(current?.hashValue)
        hasher.combine(deleted?.hashValue)
        hasher.combine(duration?.hashValue)
        hasher.combine(endTime?.hashValue)
        hasher.combine(first?.hashValue)
        hasher.combine(formerType?.hashValue)
        hasher.combine(generator?.hashValue)
        hasher.combine(height?.hashValue)
        hasher.combine(href?.hashValue)
        hasher.combine(hreflang?.hashValue)
        hasher.combine(icon?.hashValue)
        hasher.combine(id?.hashValue)
        hasher.combine(image?.hashValue)
        hasher.combine(inReplyTo?.hashValue)
        hasher.combine(instrument?.hashValue)
        hasher.combine(items?.hashValue)
        hasher.combine(last?.hashValue)
        hasher.combine(latitude?.hashValue)
        hasher.combine(location?.hashValue)
        hasher.combine(longitude?.hashValue)
        hasher.combine(markdown?.hashValue)
        hasher.combine(mediaType?.hashValue)
        hasher.combine(name?.hashValue)
        hasher.combine(next?.hashValue)
        hasher.combine(object?.hashValue)
        hasher.combine(oneOf?.hashValue)
        hasher.combine(origin?.hashValue)
        hasher.combine(partOf?.hashValue)
        hasher.combine(prev?.hashValue)
        hasher.combine(preview?.hashValue)
        hasher.combine(published?.hashValue)
        hasher.combine(radius?.hashValue)
        hasher.combine(rel?.hashValue)
        hasher.combine(relationship?.hashValue)
        hasher.combine(replies?.hashValue)
        hasher.combine(result?.hashValue)
        hasher.combine(startTime?.hashValue)
        hasher.combine(subject?.hashValue)
        hasher.combine(summary?.hashValue)
        hasher.combine(tag?.hashValue)
        hasher.combine(target?.hashValue)
        hasher.combine(to?.hashValue)
        hasher.combine(totalItems?.hashValue)
        hasher.combine(type?.hashValue)
        hasher.combine(units?.hashValue)
        hasher.combine(updated?.hashValue)
        hasher.combine(url?.hashValue)
        hasher.combine(width?.hashValue)
        
    }
}

