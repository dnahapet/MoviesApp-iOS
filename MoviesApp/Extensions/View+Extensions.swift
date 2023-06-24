//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-31.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView {self}
    }
}
