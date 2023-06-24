//
//  Movie.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-24.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let imdbId: String
    let poster: String

    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
