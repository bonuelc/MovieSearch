//
//  MovieImage.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/19/23.
//

import Kingfisher
import SwiftUI

struct MovieImage: View {
    init(
        url: URL,
        maxHeight: CGFloat? = 200
    ) {
        self.url = url
        self.maxHeight = maxHeight
    }
    
    private let url: URL
    private let maxHeight: CGFloat?
    
    var body: some View {
        KFImage(url)
            .placeholder {
                ProgressView()
            }
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: maxHeight)
    }
}

// MARK: - PreviewProvider

struct MovieImage_Previews: PreviewProvider {
    static var previews: some View {
        MovieImage(url: URL(string: "https://image.tmdb.org/t/p/original/4FAA18ZIja70d1Tu5hr5cj2q1sB.jpg")!)
    }
}

