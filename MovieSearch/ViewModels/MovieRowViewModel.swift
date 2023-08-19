//
//  MovieRowViewModel.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/19/23.
//

import Foundation

struct MovieRowViewModel: Identifiable {
    init(movie: Movie) {
        self.movie = movie
    }
    
    private let movie: Movie
    let id = UUID()
    
    var imageURL: URL? {
        MovieListService.imageURL(posterPath: movie.posterPath)
    }
    
    var titleString: String {
        movie.title
    }
    
    var yearString: String {
        // TODO: DRY
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = formatter.date(from: movie.releaseDate) else {
            return "Release Date: Unknown"
        }
        
        return date.formatted(.dateTime.year())
    }
    
    var detailViewModel: MovieDetailViewModel {
        .init(movie: movie)
    }
}
