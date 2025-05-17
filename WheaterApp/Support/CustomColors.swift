//
//  CustomColors.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import UIKit.UIColor

enum CustomColorType {
    case base
    case text
}

enum CustomColors: CaseIterable {
    case cloudy0
    case cloudy1
    case cloudy2
    case day
    case rainyDay
    case night
    case rainy0
    case rainy1
    case snowy0
    case snowy1

    func getColor(type: CustomColorType) -> UIColor {
        switch self {
        case .cloudy0:
            return type == .base ? UIColor.cloudy0 : UIColor.cloudyText0
        case .cloudy1:
            return type == .base ? UIColor.cloudy1 : UIColor.cloudyText1
        case .cloudy2:
            return type == .base ? UIColor.cloudy2 : UIColor.cloudy2
        case .day:
            return type == .base ? UIColor.day : UIColor.dayText
        case .night:
            return type == .base ? UIColor.night : UIColor.nightText
        case .rainy0:
            return type == .base ? UIColor.rainy0 : UIColor.rainyText0
        case .rainy1:
            return type == .base ? UIColor.rainy1 : UIColor.rainyText1
        case .rainyDay:
            return type == .base ? UIColor.rainyDay : UIColor.rainyDayText
        case .snowy0:
            return type == .base ? UIColor.snowy : UIColor.snowyText0
        case .snowy1:
            return type == .base ? UIColor.snowy1 : UIColor.snowyText1
        }
    }
}

