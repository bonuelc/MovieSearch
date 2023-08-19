//
//  MovieListService.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/18/23.
//

import Alamofire
import SwiftUI

protocol MovieListServiceable {
    func getMovies(queryString: String) async throws -> [Movie]
}

class MovieListService: MovieListServiceable {
    private var request: DataRequest?
    
    func getMovies(queryString: String) async throws -> [Movie] {
        request?.cancel()
        
        let parameters = ["query" : queryString]
        
        let headers: HTTPHeaders = [
            .init(
                name: "Authorization",
                value: "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYTMwMmMxNWM0NTRjZTZhNTJmOWY1NjY3OWJkYzI2NiIsInN1YiI6IjU4MWEzMGU5YzNhMzY4NTNhYTAwMTQwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lNsUgFxSZaQLQHYmkjgM1gr93EFDMRXmtHk1JnpVb1o"
            ),
            .init(
                name: "include_adult",
                value: "false"
            )
        ]

        return try await withCheckedThrowingContinuation { continuation in
            request = AF.request(
                "https://api.themoviedb.org/3/search/movie",
                parameters: parameters,
                headers: headers
            )
            
            request?.responseDecodable(of: MovieResponse.self) { response in
                switch(response.result) {
                case let .success(movieResponse):
                    continuation.resume(returning: movieResponse.movies)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    static func imageURL(posterPath: String) -> URL? {
        URL(string: "https://image.tmdb.org/t/p/original\(posterPath)")
    }
}

