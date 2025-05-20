//
//  WheaterItem.swift
//  WheaterApp
//
//  Created by Борис Киселев on 19.05.2025.
//

import Foundation

struct WeatherResponse: Decodable {
    var location: WeaterLocation?
    var forecast: Forecast?
}

struct WeaterLocation: Decodable {
    let name: String?
}

struct Forecast: Decodable {
    var forecastDay: [ForecastDay]

    enum CodingKeys: String, CodingKey  {
        case forecastDay = "forecastday"
    }
}

struct ForecastDay: Decodable {
    var date: String
    var day: Day
}

struct Day: Decodable {
    var temperature: Decimal?
    var maxWindSpeed: Decimal?
    var avghumidity: Int?
    var condition: WeatherCondition?

    enum CodingKeys: String, CodingKey {
        case temperature = "avgtemp_c"
        case maxWindSpeed = "maxwind_kph"
        case avghumidity
        case condition
    }
}

struct WeatherCondition: Decodable {
    var conditionDescription: String?
    var conditionIconReference: String?

    enum CodingKeys: String, CodingKey {
        case conditionDescription = "text"
        case conditionIconReference = "icon"
    }
}
