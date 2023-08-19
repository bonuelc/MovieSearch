//
//  Movie.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/18/23.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String
    let posterPath: String
    let rating: Double
    let overview: String
}

extension Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case rating = "vote_average"
        case overview
    }
}
