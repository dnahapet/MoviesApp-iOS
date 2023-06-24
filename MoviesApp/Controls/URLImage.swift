//
//  URLImage.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-31.
//

import SwiftUI

struct URLImage: View {
    let imageUrl: String
    let placeholder: String

    @ObservedObject var imageLoader = ImageLoader()

    init(_ url: String, placeholder: String = "placeholder") {
        self.imageUrl = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.imageUrl)
    }

    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }
        else {
            return Image(self.placeholder).resizable()
        }
    }
}
