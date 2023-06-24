//
//  MoviesResponse.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-24.
//

import Foundation

struct MoviesResponse: Codable {
    let movies: [Movie]

    private enum CodingKeys : String, CodingKey {
        case movies = "Search"
    }
}
