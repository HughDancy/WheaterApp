//
//  WheaterItem.swift
//  WheaterApp
//
//  Created by Борис Киселев on 19.05.2025.
//

import Foundation

struct WeatherResponse: Decodable {
    let location: WeaterLocation
    let currentWheater: CurrentWeather
    let forecast: Forecast
}

struct WeaterLocation: Decodable {
    let name: String

}

struct CurrentWeather: Decodable {
    let temp: Double?
    let condition: WeatherCondition

    enum CodingKeys: String, CodingKey {
        case temp = "temp_c"
        case condition
    }
}

struct WeatherCondition: Decodable {
    let conditionDescription: String
    let conditionIconReference: String

    enum CodingKeys: String, CodingKey {
        case conditionDescription = "text"
        case conditionIconReference = "icon"
    }
}

struct Forecast: Decodable {
    let forecastDay: [ForecastDay]
}

struct ForecastDay: Decodable {
    let day: Day
}

struct Day: Decodable {
    let maxWindSpeed: Double
    let avghumidity: Int

    enum CodingKeys: String, CodingKey {
        case maxWindSpeed = "maxwind_kph"
        case avghumidity
    }
}
