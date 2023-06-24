//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Davit Nahapetyan on 2023-05-31.
//

import Foundation

extension String {
    func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
