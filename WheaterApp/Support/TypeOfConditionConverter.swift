//
//  TypeOfConditionConverter.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import Foundation

enum TypeOfCondition {
    case sunny
    case cloudy
    case rain
    case snow

    func getType(condition: String) -> Self {
        return .cloudy
    }
}


