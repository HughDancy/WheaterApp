//
//  MainModel.swift
//  WheaterApp
//
//  Created by Борис Киселев on 20.05.2025.
//

import Foundation
import UIKit.UIImage

   // MARK: - Support Structs
struct WeatherInfo {
    var temperature: String
    var windSpeed: String
    var avghumidity: String
}

struct ConditionInfo {
    var condition: String
    var icon: UIImage?
}

struct ForecastInfo {
    var weaterInfo: [WeatherInfo]
    var conditionInfo: [ConditionInfo]
}
  // MARK: - Main Model
enum MainModel {
    struct Request {
        var cityName: String
    }

    struct Response {
        var weatherData: WeatherResponse?
        var images: [UIImage?]
    }

    struct ViewModel {
        var forecast: ForecastInfo?
    }
}
