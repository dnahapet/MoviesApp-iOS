//
//  RatingView.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-31.
//

import SwiftUI

struct Rating: View {

    @Binding var rating: Int?

    private func starType(index: Int) -> String {

        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        }
        else {
            return "star"
        }
    }

    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                }
            }
        }
    }
}
