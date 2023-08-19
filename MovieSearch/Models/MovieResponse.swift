//
//  MovieResponse.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/19/23.
//

import Foundation

struct MovieResponse {
    let movies: [Movie]
}

extension MovieResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movies = try container
            .decode([OptionalObject<Movie>].self, forKey: .movies)
            .compactMap { $0.value }
    }
}
