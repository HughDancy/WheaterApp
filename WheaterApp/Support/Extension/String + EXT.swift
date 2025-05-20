//
//  String + EXT.swift
//  WheaterApp
//
//  Created by Борис Киселев on 20.05.2025.
//

import Foundation

extension String {
    func containsAny(of keywords: [String],
                    options: String.CompareOptions = [.caseInsensitive]) -> Bool {
        return keywords.first { self.range(of: $0, options: options) != nil } != nil
    }
}
