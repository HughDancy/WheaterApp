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

    static func convertDecimal(_ decimal: Decimal?) -> String? {
        guard let decimal = decimal else { return nil }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 6

        if let stringValue = formatter.string(from: decimal as NSDecimalNumber) {
           return stringValue
        } else {
            return nil
        }
    }
}
