//
//  MainModel.swift
//  WheaterApp
//
//  Created by Борис Киселев on 20.05.2025.
//

import Foundation

struct WeatherInfo {
    var temperature: String
    var windSpeed: String
    var avghumidity: String
}

struct ConditionInfo {
    var condition: String
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
        var weatherInfo: WeatherInfo
        var conditionIndo: ConditionInfo
        var forecast: Forecast

    }
}
