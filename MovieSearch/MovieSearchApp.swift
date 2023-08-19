//
//  MovieSearchApp.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/18/23.
//

import SwiftUI

@main
struct MovieSearchApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MovieListView(viewModel: .init())
            }
        }
    }
}
