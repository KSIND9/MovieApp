//
//  MovieDetailsResponse.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/7/23.
//

import Foundation

struct MovieDetailsResponse: Codable {
    let id: Int?
    let title: String?
    let slug: String?
    let description: String?
    let type_id: Int?
    let series_number: Int?
    let episode_number: Int?
    let episodes_count: Int?
    let vendor_id: Int?
    let vendorka_id: Int?
    let content_host: String?
    let low_quality_file_id: Int?
    let high_quality_file_id: Int?
    let parent_id: Int?
    let exists_on_edgecast: Bool?
    let is_featured: Bool?
    let length: String?
    let jwplatform_media_id: String?
    let is_enabled: String?
    let deleted_at: String?
    let duration: Int?
    let genres: [Genres]?
    let cast: [String]?
    let crew: Crew?
    let artwork: [String: MovieDetailsPoster]
    let poster: MovieDetailsPoster?
    let georule: Georule?
    let type: String?
    let streams: Streams?
    let content_blocked: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case slug = "slug"
        case description = "description"
        case type_id = "type_id"
        case series_number = "series_number"
        case episode_number = "episode_number"
        case episodes_count = "episodes_count"
        case vendor_id = "vendor_id"
        case vendorka_id = "vendorka_id"
        case content_host = "content_host"
        case low_quality_file_id = "low_quality_file_id"
        case high_quality_file_id = "high_quality_file_id"
        case parent_id = "parent_id"
        case exists_on_edgecast = "exists_on_edgecast"
        case is_featured = "is_featured"
        case length = "length"
        case jwplatform_media_id = "jwplatform_media_id"
        case is_enabled = "is_enabled"
        case deleted_at = "deleted_at"
        case duration = "duration"
        case genres = "genres"
        case cast = "cast"
        case crew = "crew"
        case artwork = "artwork"
        case poster = "poster"
        case georule = "georule"
        case type = "type"
        case streams = "streams"
        case content_blocked = "content_blocked"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        type_id = try values.decodeIfPresent(Int.self, forKey: .type_id)
        series_number = try values.decodeIfPresent(Int.self, forKey: .series_number)
        episode_number = try values.decodeIfPresent(Int.self, forKey: .episode_number)
        episodes_count = try values.decodeIfPresent(Int.self, forKey: .episodes_count)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        vendorka_id = try values.decodeIfPresent(Int.self, forKey: .vendorka_id)
        content_host = try values.decodeIfPresent(String.self, forKey: .content_host)
        low_quality_file_id = try values.decodeIfPresent(Int.self, forKey: .low_quality_file_id)
        high_quality_file_id = try values.decodeIfPresent(Int.self, forKey: .high_quality_file_id)
        parent_id = try values.decodeIfPresent(Int.self, forKey: .parent_id)
        exists_on_edgecast = try values.decodeIfPresent(Bool.self, forKey: .exists_on_edgecast)
        is_featured = try values.decodeIfPresent(Bool.self, forKey: .is_featured)
        length = try values.decodeIfPresent(String.self, forKey: .length)
        jwplatform_media_id = try values.decodeIfPresent(String.self, forKey: .jwplatform_media_id)
        is_enabled = try values.decodeIfPresent(String.self, forKey: .is_enabled)
        deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
        duration = try values.decodeIfPresent(Int.self, forKey: .duration)
        genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
        cast = try values.decodeIfPresent([String].self, forKey: .cast)
        if let crewObject = try? values.decodeIfPresent(Crew.self, forKey: .crew) {
            crew = crewObject
        } else {
            crew = nil
        }
        artwork = try values.decodeIfPresent([String : MovieDetailsPoster].self, forKey: .artwork) ?? [:]
        poster = try values.decodeIfPresent(MovieDetailsPoster.self, forKey: .poster)
        georule = try values.decodeIfPresent(Georule.self, forKey: .georule)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        streams = try values.decodeIfPresent(Streams.self, forKey: .streams)
        content_blocked = try values.decodeIfPresent(Bool.self, forKey: .content_blocked)
    }
}

class MovieDetailsPoster: Codable {
    let imageID: Int?
    let type: String?
    let width: Int?
    let height: Int?
    let couchdbURL: String?
    let alt: String?
    let copyright: String?
    let parentID: Int?
    let isSynchronized: Bool?
    let url: String?
    let thumbs: MovieDetailsThumbs?

    enum CodingKeys: String, CodingKey {
        case imageID = "image_id"
        case type = "type"
        case width = "width"
        case height = "height"
        case couchdbURL = "couchdb_url"
        case alt = "alt"
        case copyright = "copyright"
        case parentID = "parent_id"
        case isSynchronized = "is_synchronized"
        case url = "url"
        case thumbs = "thumbs"
    }

    init(imageID: Int?, type: String?, width: Int?, height: Int?, couchdbURL: String?, alt: String?, copyright: String?, parentID: Int?, isSynchronized: Bool?, url: String?, thumbs: MovieDetailsThumbs?) {
        self.imageID = imageID
        self.type = type
        self.width = width
        self.height = height
        self.couchdbURL = couchdbURL
        self.alt = alt
        self.copyright = copyright
        self.parentID = parentID
        self.isSynchronized = isSynchronized
        self.url = url
        self.thumbs = thumbs
    }
}

struct MovieDetailsThumbs : Codable {
    let thumb120p : MovieDetailsPoster?
    let thumb220p : MovieDetailsPoster?

    enum CodingKeys: String, CodingKey {
        case thumb120p = "thumb_120p"
        case thumb220p = "thumb_220p"
    }
}

struct Genres: Codable {
    let genre_id: Int?
    let name: String?
    let slug: String?
    
    enum CodingKeys: String, CodingKey {
        case genre_id = "genre_id"
        case name = "name"
        case slug = "slug"
    }
}

struct Crew: Codable {
    var actor: [Actor]?
    var director: [Director]?
    
    enum CodingKeys: String, CodingKey {
        case actor = "Actor"
        case director = "Director"
    }
}

// Helper struct for handling dynamic coding keys
struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    init?(intValue: Int) {
        return nil
    }
}

struct Actor: Codable {
    let crew_id: Int?
    let crew_type: String?
    let fullname: String?
    let person_id: Int?

    enum CodingKeys: String, CodingKey {
        case crew_id = "crew_id"
        case crew_type = "crew_type"
        case fullname = "fullname"
        case person_id = "person_id"
    }
}

struct Director: Codable {
    let crew_id: Int?
    let crew_type: String?
    let fullname: String?
    let person_id: Int?
    
    enum CodingKeys: String, CodingKey {
        case crew_id = "crew_id"
        case crew_type = "crew_type"
        case fullname = "fullname"
        case person_id = "person_id"
    }
}

struct Georule: Codable {
    let type: Int?
    let countries: [String]?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case countries = "countries"
    }
}

struct Streams: Codable {
    let low: LowAndHigh?
    let high: LowAndHigh?

    enum CodingKeys: String, CodingKey {
        case low = "low"
        case high = "high"
    }
}

struct LowAndHigh: Codable {
    let is_free: Bool?
    let quality: String?
    let url: String?
    let name: String?
    let watchTimeout: Int?

    enum CodingKeys: String, CodingKey {
        case is_free = "is_free"
        case quality = "quality"
        case url = "url"
        case name = "name"
        case watchTimeout = "watch-timeout"
    }
}
