//
//  MoviesListScreen.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-31.
//

import SwiftUI

struct MoviesListScreen: View {
    @ObservedObject var moviesVM: MoviesViewModel
    @State var searchText = ""
    
    init() {
        self.moviesVM = MoviesViewModel()
    }

    var body: some View {
        VStack {
            TextField("Search", text: $searchText) { _ in } onCommit: {
                self.moviesVM.getMoviesFor(self.searchText)
            }.textFieldStyle(RoundedBorderTextFieldStyle())

            Spacer()

            if self.moviesVM.loadingState == .success {
                MovieListView(movies: self.moviesVM.movies)
            }
            else if self.moviesVM.loadingState == .failure {
                FailedView()
            }
            else if self.moviesVM.loadingState == .loading {
                LoadingView()
            }

        }
        .navigationTitle("Movies")
        .embedNavigationView()
        .padding()
    }
}

struct MoviesListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListScreen()
    }
}
