//
//  TypeOfConditionConverter.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import Foundation
import UIKit.UIColor

enum TypeOfCondition {
    case sunny
    case cloudy
    case rain
    case snow

    func getType(condition: String?) -> Self? {
        guard let text = condition?.lowercased() else { return nil}
        let cloudy = ["cloudy", "overcast", "mist", "fog"]
        let rain = ["rain, drizzle", "thundery"]
        let snow = ["sleet", "snow", "blizzard", "ice"]

        guard !text.contains("sunny") else {
            return .sunny
            }

        guard !text.containsAny(of: cloudy) else {
            return .cloudy
           }

        guard !text.containsAny(of: rain) else {
            return .rain
           }

        guard !text.containsAny(of: snow) else {
            return .snow
           }
        return nil
    }
}

typealias ColorAppearence = (mainColor: UIColor, textColor: UIColor, imageName: String)

struct ConditionColor {
    var type: TypeOfCondition?

    func getMainColor() -> ColorAppearence? {
        guard let type = type else { return nil }
        switch type {
        case .cloudy:
            let cloudyColors: [UIColor] = [.cloudy0, .cloudy1, .cloudy2]
            let textColors: [UIColor] = [.cloudyText0, .cloudyText1, .cloudyText2]
            let imageNames: [String] = ["cloudy01", "cloudy02", "cloudy03"]
            let randomNumber = Int.random(in: 0...2)
            return ColorAppearence(mainColor: cloudyColors[randomNumber], textColor: textColors[randomNumber], imageName: imageNames[randomNumber])
        case .rain:
            let rainyColor: [UIColor] = [.rainy0, .rainy1, ]
            let textColors: [UIColor] = [.rainyText0, .rainyText1]
            let imageNames: [String] = ["rainy01", "rainy01"]
            let randomNumber = Int.random(in: 0...1)
            return ColorAppearence(mainColor: rainyColor[randomNumber], textColor: textColors[randomNumber], imageName: imageNames[randomNumber])
        case .snow:
            let snowColor: [UIColor] = [.snowy, .snowy1, ]
            let textColors: [UIColor] = [.snowyText0, .snowy1]
            let imageNames: [String] = ["snowy01", "snowy02"]
            let randomNumber = Int.random(in: 0...1)
            return ColorAppearence(mainColor: snowColor[randomNumber], textColor: textColors[randomNumber], imageName: imageNames[randomNumber])
        case .sunny:
            return ColorAppearence(mainColor: .day, textColor: .dayText, imageName: "sunnyDay")
        }
    }
}


