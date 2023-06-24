//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-31.
//

import Foundation

class MoviesViewModel: ViewModelBase {
    @Published var movies = [MovieViewModel]()
    private let httpClient = HTTPClient()

    func getMoviesFor(_ search: String) {
        if search.isEmpty {
            return
        }

        self.loadingState = .loading

        httpClient.getMoviesFor(search: search.trimmedAndEscaped()) { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.movies = movies.map(MovieViewModel.init)
                    self.loadingState = .success
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.loadingState = .failure
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie: Movie

    var imdbId: String {
        movie.imdbId
    }

    var title: String {
        movie.title
    }

    var year: String {
        movie.year
    }

    var poster: String {
        movie.poster
    }
}
