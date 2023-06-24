//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-06-23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {

    private var movieDetail: MovieDetail? = nil
    @Published var loadingState: LoadingState = .loading
    private let httpClient = HTTPClient()

    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }

    func getMovieDetailFor(_ imdbId: String) {
        httpClient.getMovieDetailWith(imdbId: imdbId) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failure
                }
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = movieDetail
                    self.loadingState = .success
                }
            }
        }
    }

    var title: String {
        self.movieDetail?.title ?? ""
    }

    var poster: String {
        self.movieDetail?.poster ?? ""
    }

    var plot: String {
        self.movieDetail?.plot ?? ""
    }

    var director: String {
        self.movieDetail?.director ?? ""
    }

    var actors: String {
        self.movieDetail?.actors ?? ""
    }

    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.rating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
}
