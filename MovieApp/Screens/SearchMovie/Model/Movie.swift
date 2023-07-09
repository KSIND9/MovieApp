//
//  Movie.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/5/23.
//

import Foundation

struct Movie: Codable {
    let code: Int
    let reason: String
    let response: [Response]
    let total: Int
    let totalFound: Int
    
    enum CodingKeys: String, CodingKey {
        case code
        case reason
        case response
        case total
        case totalFound = "total_found"
    }
}

struct Response: Codable {
    let _id: String?
    let genres: [String]?
    let keywords: [String]?
    let tags: [String]?
    let isFeatured: Bool?
    let isEnabled: Bool?
    let deletedAt: String?
    let deleted: Bool?
    let producedDate: String?
    let audioOnly: Bool?
    let isEpisode: Bool?
    let episodeNumber: String?
    let seriesNumber: String?
    let restrictToCountries: [String]?
    let title: String?
    let slug: String?
    let description: String?
    let metaDescription: String?
    let length: Int?
    let createdAt: String?
    let updatedAt: String?
    let originalId: Int?
    let vendorkaId: Int?
    let vendorId: Int?
    let poster: Poster?
    let artwork: [Artwork]?
    let crew: String?
    let cast: String?
    let publicURL: String?
    let contentHost: String?
    let highQualityFileId: String?
    let lowQualityFileId: String?
    let imdbId: String?
    let v: Int?
    let rand: Double?
    var id: String?
    let typeId: Int?
    
    enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case genres
        case keywords
        case tags
        case isFeatured = "is_featured"
        case isEnabled = "is_enabled"
        case deletedAt = "deletedAt"
        case deleted
        case producedDate = "produced_date"
        case audioOnly = "audioOnly"
        case isEpisode = "is_episode"
        case episodeNumber = "episode_number"
        case seriesNumber = "series_number"
        case restrictToCountries = "restrict_to_countries"
        case title
        case slug
        case description
        case metaDescription = "meta_description"
        case length
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case originalId = "original_id"
        case vendorkaId = "vendorka_id"
        case vendorId = "vendor_id"
        case poster
        case artwork
        case crew
        case cast
        case publicURL = "public_url"
        case contentHost = "content_host"
        case highQualityFileId = "high_quality_file_id"
        case lowQualityFileId = "low_quality_file_id"
        case imdbId = "imdb_id"
        case v = "__v"
        case rand
        case id
        case typeId = "type_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        genres = try values.decodeIfPresent([String].self, forKey: .genres)
        keywords = try values.decodeIfPresent([String].self, forKey: .keywords)
        tags = try values.decodeIfPresent([String].self, forKey: .tags)
        isFeatured = try values.decodeIfPresent(Bool.self, forKey: .isFeatured)
        isEnabled = try values.decodeIfPresent(Bool.self, forKey: .isEnabled)
        deletedAt = try values.decodeIfPresent(String.self, forKey: .deletedAt)
        deleted = try values.decodeIfPresent(Bool.self, forKey: .deleted)
        producedDate = try values.decodeIfPresent(String.self, forKey: .producedDate)
        audioOnly = try values.decodeIfPresent(Bool.self, forKey: .audioOnly)
        isEpisode = try values.decodeIfPresent(Bool.self, forKey: .isEpisode)
        episodeNumber = try values.decodeIfPresent(String.self, forKey: .episodeNumber)
        seriesNumber = try values.decodeIfPresent(String.self, forKey: .seriesNumber)
        restrictToCountries = try values.decodeIfPresent([String].self, forKey: .restrictToCountries)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        metaDescription = try values.decodeIfPresent(String.self, forKey: .metaDescription)
        length = try values.decodeIfPresent(Int.self, forKey: .length)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        originalId = try values.decodeIfPresent(Int.self, forKey: .originalId)
        vendorkaId = try values.decodeIfPresent(Int.self, forKey: .vendorkaId)
        vendorId = try values.decodeIfPresent(Int.self, forKey: .vendorId)
        poster = try values.decodeIfPresent(Poster.self, forKey: .poster)
        
        if let artworkContainer = try values.decodeIfPresent([Artwork?].self, forKey: .artwork) {
            artwork = artworkContainer.compactMap { $0 }
        } else {
            artwork = nil
        }

        //artwork = try values.decodeIfPresent([Artwork].self, forKey: .artwork)
        crew = try values.decodeIfPresent(String.self, forKey: .crew)
        cast = try values.decodeIfPresent(String.self, forKey: .cast)
        publicURL = try values.decodeIfPresent(String.self, forKey: .publicURL)
        contentHost = try values.decodeIfPresent(String.self, forKey: .contentHost)
        highQualityFileId = try values.decodeIfPresent(String.self, forKey: .highQualityFileId)
        lowQualityFileId = try values.decodeIfPresent(String.self, forKey: .lowQualityFileId)
        imdbId = try values.decodeIfPresent(String.self, forKey: .imdbId)
        v = try values.decodeIfPresent(Int.self, forKey: .v)
        rand = try values.decodeIfPresent(Double.self, forKey: .rand)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        typeId = try values.decodeIfPresent(Int.self, forKey: .typeId)
    }
}

struct Poster: Codable {
    let id: String?
    let width: Int?
    let height: Int?
    let url: String?
    let alt: String?
    let type: String?
    let copyright: String?
    let thumbs: [String: Thumbnail]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case width
        case height
        case url
        case alt
        case type
        case copyright
        case thumbs
    }
}

struct Artwork: Codable {
    let id: String?
    let width: Int?
    let height: Int?
    let url: String?
    let alt: String?
    let type: String?
    let copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case width
        case height
        case url
        case alt
        case type
        case copyright
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        alt = try values.decodeIfPresent(String.self, forKey: .alt)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        if let copyrightValue = try values.decodeIfPresent(String.self, forKey: .copyright), copyrightValue != "null" {
            copyright = copyrightValue
        } else {
            copyright = nil
        }
    }
}

struct Thumbnail: Codable {
    let id: String?
    let width: Int?
    let height: Int?
    let url: String?
    let alt: String?
    let type: String?
    let copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case width
        case height
        case url
        case alt
        case type
        case copyright
    }
}

