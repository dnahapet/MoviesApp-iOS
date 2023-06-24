//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-06-23.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let year: String
    let director: String
    let actors: String
    let plot: String
    let poster: String
    let imdbId: String
    let rating: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case imdbId = "imdbID"
        case rating = "imdbRating"
    }
}
