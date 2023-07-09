//
//  MovieDetails.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/7/23.
//

import Foundation

struct MovieDetails: Codable {
    let code: Int?
    let status: String?
    let movieDetailsresponse: MovieDetailsResponse?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case status = "status"
        case movieDetailsresponse = "response"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        movieDetailsresponse = try values.decodeIfPresent(MovieDetailsResponse.self, forKey: .movieDetailsresponse)
    }

}
