//
//  MovieDetailViewModel.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/18/23.
//

import Foundation

struct MovieDetailViewModel {
    init(movie: Movie) {
        self.movie = movie
    }
    
    private let movie: Movie
    
    var imageURL: URL? {
        MovieListService.imageURL(posterPath: movie.posterPath)
    }
    
    var titleString: String {
        movie.title
    }
    
    var releaseDateString: String {
        // TODO: DRY
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = formatter.date(from: movie.releaseDate) else {
            return "Release Date: Unknown"
        }
        
        return date.formatted(date: .long, time: .omitted)
    }
    
    var ratingTitleString: String {
        "Viewer Rating"
    }
    
    var ratingDescriptionString: String {
        let rating = String(format: "%.1f", movie.rating)
        return "\(rating)/\(Int(ratingScale))"
    }
    
    var rating: Double {
        movie.rating
    }
    
    var ratingScale: Double {
        10
    }
    
    var overviewTitle: String {
        "OVERVIEW"
    }
    
    var overviewDescription: String {
        movie.overview
    }
}


