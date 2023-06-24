//
//  URL+Extensions.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-06-23.
//

import Foundation

extension URL {
    static func forMoviesWithName(_ search: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=\(Constants.OMDBAPI_KEY)")
    }

    static func forMovieDetailWithImdbId(_ imdbId: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.OMDBAPI_KEY)")
    }
}
