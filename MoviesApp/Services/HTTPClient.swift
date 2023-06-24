//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-24.
//

import Foundation

enum NetworkError: Error {
    case BadUrl
    case FailedRequest
    case JsonParse
}

struct HTTPClient {

    func getMovieDetailWith(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        guard let url = URL.forMovieDetailWithImdbId(imdbId) else {
            return completion(.failure(.BadUrl))
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.FailedRequest))
            }

            guard let movieDetailResponse = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.JsonParse))
            }

            completion(.success(movieDetailResponse))
        }.resume()
    }
    
    func getMoviesFor(search: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
        guard let url = URL.forMoviesWithName(search) else {
            return completion(.failure(.BadUrl))
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.FailedRequest))
            }

            guard let moviesResponse = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
                return completion(.failure(.JsonParse))
            }

            completion(.success(moviesResponse.movies))
        }.resume()
    }
}
