//
//  ImageLoader.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-31.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?

    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }

        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
