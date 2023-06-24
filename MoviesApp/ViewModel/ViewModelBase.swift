//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-31.
//

import Foundation

enum LoadingState {
    case none, loading, success, failure
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
