//
//  MainModel.swift
//  WheaterApp
//
//  Created by Борис Киселев on 20.05.2025.
//

import Foundation
import UIKit.UIImage

struct WeatherInfo {
    var temperature: String
    var windSpeed: String
    var avghumidity: String
}

struct ConditionInfo {
    var condition: UIImage?
    var icon: String
}

struct ForecastInfo {
    var weaterInfo: [WeatherInfo]
    var conditionInfo: [ConditionInfo]
}

enum MainModel {
    struct Request {
        var cityName: String
    }

    struct Response {
        var weatherData: WeatherResponse?
    }

    struct ViewModel {
        var weatherInfo: WeatherInfo?
        var conditionIndo: ConditionInfo?
        var forecast: ForecastInfo?

    }
}
