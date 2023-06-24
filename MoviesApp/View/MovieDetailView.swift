//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-06-23.
//

import SwiftUI

struct MovieDetailView: View {

    let movieDetailVM: MovieDetailViewModel

    var body: some View {
        ScrollView {

            VStack(alignment: .leading, spacing: 8) {
                URLImage(movieDetailVM.poster)
                    .cornerRadius(10)

                Text(movieDetailVM.title)
                    .font(.title)
                Text(movieDetailVM.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetailVM.director)
                Text("Actors").fontWeight(.semibold)
                Text(movieDetailVM.actors)
                HStack {
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }.padding(.top, 8)

                Spacer()
            }.padding()
            .navigationBarTitle(self.movieDetailVM.title)
        }
    }
}
