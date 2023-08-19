//
//  MovieDetailView.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/18/23.
//

import Kingfisher
import SwiftUI

struct MovieDetailView: View {
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }
    
    private let viewModel: MovieDetailViewModel
    
    var body: some View {
        List {
            preview
            overview
        }
        .listStyle(.inset)
        // This fixes a spacing issue when the list view
        // has a .large TitleDisplayMode.
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension MovieDetailView {
    var preview: some View {
        HStack(alignment: .top, spacing: 16) {
            if let url = viewModel.imageURL {
                MovieImage(url: url)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                titleText
                releaseDateText
                ratingTitleText
                ratingDescriptionText
                ratingBar
            }
        }
        // TODO: DRY
        .alignmentGuide(.listRowSeparatorLeading) { _ in
            return 0
        }
    }
    
    var titleText: some View {
        Text(viewModel.titleString)
            .font(.title3)
            .bold()
            .accessibilityIdentifier("titleText")
            .padding(.bottom, 8)
    }
    
    var releaseDateText: some View {
        Text(viewModel.releaseDateString)
            .font(.footnote)
            .bold()
            .foregroundColor(.gray)
            .accessibilityIdentifier("releaseDateText")
            .padding(.bottom, 12)
    }
    
    var ratingTitleText: some View {
        Text(viewModel.ratingTitleString)
            .font(.footnote)
            .bold()
            .foregroundColor(.gray)
            .accessibilityIdentifier("ratingTitleText")
            .padding(.bottom, 8)
    }
    
    var ratingDescriptionText: some View {
        Text(viewModel.ratingDescriptionString)
            .font(.title3)
            .bold()
            .accessibilityIdentifier("ratingTitleText")
            .padding(.bottom, 8)
    }
    
    var ratingBar: some View {
        ProgressView(
            value: viewModel.rating,
            total: viewModel.ratingScale
        )
        .accessibilityIdentifier("ratingBar")
    }
}

private extension MovieDetailView {
    var overview: some View {
        VStack(alignment: .leading, spacing: 8) {
            overviewTitle
            overviewDescription
        }
    }
    
    var overviewTitle: some View {
        Text(viewModel.overviewTitle)
            .foregroundColor(.gray)
            .bold()
            .accessibilityIdentifier("overviewTitle")
    }
    
    var overviewDescription: some View {
        Text(viewModel.overviewDescription)
            .font(.footnote)
            .accessibilityIdentifier("overviewDescription")
    }
}

// MARK: - PreviewProvider

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: .init(movie: .init(
            title: "The Hunger Games: Mockingjay - Part 1",
            releaseDate: "2014-11-19",
            posterPath: "/4FAA18ZIja70d1Tu5hr5cj2q1sB.jpg",
            rating: 6.798,
            overview: "Katniss Everdeen reluctantly becomes the symbol of a mass rebellion against the autocratic Capitol."
        )))
    }
}
