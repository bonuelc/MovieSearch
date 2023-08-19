//
//  MovieRowView.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/19/23.
//

import Kingfisher
import SwiftUI

struct MovieRowView: View {
    init(viewModel: MovieRowViewModel) {
        self.viewModel = viewModel
    }
    
    private let viewModel: MovieRowViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            if let url = viewModel.imageURL {
                MovieImage(url: url)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                titleText(viewModel.titleString)
                yearText(viewModel.yearString)
            }
        }
        // TODO: DRY
        .alignmentGuide(.listRowSeparatorLeading) { _ in
            return 0
        }
    }
}

private extension MovieRowView {
    func titleText(_ string: String) -> some View {
        Text(string)
            .bold()
    }
    
    func yearText(_ string: String) -> some View {
        Text(string)
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}

// MARK: - PreviewProvider

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(viewModel: .init(movie: .init(
            title: "The Hunger Games: Mockingjay - Part 1",
            releaseDate: "2014-11-19",
            posterPath: "/4FAA18ZIja70d1Tu5hr5cj2q1sB.jpg",
            rating: 6.798,
            overview: "Katniss Everdeen reluctantly becomes the symbol of a mass rebellion against the autocratic Capitol."
        )))
    }
}
