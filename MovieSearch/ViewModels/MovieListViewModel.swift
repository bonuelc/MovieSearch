//
//  MovieListViewModel.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/18/23.
//

import Foundation

class MovieListViewModel: ObservableObject {
    init(service: MovieListServiceable = MovieListService()) {
        self.service = service
    }
    
    private let service: MovieListServiceable
    
    var navigationTitle: String {
        "Movie Search"
    }
    
    var noResultsString: String {
        "No results"
    }
    
    @Published
    var queryString: String = ""
    
    @Published
    var displayState: DisplayState = .idle
    
    func getMovies() {
        guard !queryString.isEmpty else {
            displayState = .idle
            return
        }
        
        displayState = .loading
        print("🪵 ----- getting movies ----- ")
        Task { @MainActor in
            do {
                let movies = try await service.getMovies(queryString: queryString)
                let movieRowViewModels = movies.map { MovieRowViewModel(movie: $0) }
                print("🪵 `\(queryString)` got \(movieRowViewModels.count) movies")
                
                if movieRowViewModels.count > 0 {
                    displayState = .success(movieRowViewModels: movieRowViewModels)
                } else {
                    displayState = .failure(error: Error.noResults)
                }
            } catch {
                print("🪵 failed to get movies - error: \(error)")
                displayState = .failure(error: error)
            }
        }
    }
}

extension MovieListViewModel {
    enum DisplayState {
        case idle
        case loading
        case success(movieRowViewModels: [MovieRowViewModel])
        case failure(error: Swift.Error)
    }
    
    enum Error: Swift.Error {
        case noResults
    }
}
