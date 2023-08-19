//
//  MovieListView.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/18/23.
//

import DebouncedOnChange
import Kingfisher
import SwiftUI

struct MovieListView: View {
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject
    private var viewModel: MovieListViewModel
    
    var body: some View {
        _body
            .searchable(
                text: $viewModel.queryString,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .autocorrectionDisabled(true)
            .onChange(
                of: viewModel.queryString,
                debounceTime: .seconds(0.5)
            ) { _ in
                viewModel.getMovies()
            }
            .listStyle(.inset)
            .navigationTitle(viewModel.navigationTitle)
    }
}

private extension MovieListView {
    @ViewBuilder
    var _body: some View {
        switch viewModel.displayState {
        case .idle, .failure:
            noResultsText
        case .loading:
            ProgressView()
        case let .success(movieRowViewModels):
            List {
                ForEach(movieRowViewModels) {
                    navigationLink(viewModel: $0)
                }
            }
        }
    }
    
    var noResultsText: some View {
        Text(viewModel.noResultsString)
            .foregroundColor(.gray)
    }
        
    func navigationLink(viewModel: MovieRowViewModel) -> some View {
        NavigationLink(
            destination: { MovieDetailView(viewModel: viewModel.detailViewModel) },
            label: { MovieRowView(viewModel: viewModel) }
        )
    }
}

// MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: .init())
    }
}
