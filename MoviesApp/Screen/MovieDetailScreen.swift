//
//  MovieDetailScreen.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-06-23.
//

import SwiftUI

struct MovieDetailScreen: View {

    let imdbId: String
    @ObservedObject var movieDetailVM: MovieDetailViewModel

    init(imdbId: String) {
        self.imdbId = imdbId
        self.movieDetailVM = MovieDetailViewModel()
    }

    var body: some View {
        VStack {
            if self.movieDetailVM.loadingState == .loading {
                LoadingView()
            }
            else if self.movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: self.movieDetailVM)
            }
            else {
                FailedView()
            }
        }
        .onAppear {
            self.movieDetailVM.getMovieDetailFor(self.imdbId)
        }
    }
}
