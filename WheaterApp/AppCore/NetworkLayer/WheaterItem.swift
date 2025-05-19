//
//  WheaterItem.swift
//  WheaterApp
//
//  Created by Борис Киселев on 19.05.2025.
//

import Foundation

struct WheaterResponse: Decodable {
    let location: WheaterLocation
    let currentWheater: CurrentWheater
    let forecast: Forecast
}

struct WheaterLocation: Decodable {
    let name: String

}

struct CurrentWheater: Decodable {
    let temp: Double?
    let condition: WheaterCondition

    enum CodingKeys: String, CodingKey {
        case temp = "temp_c"
        case condition
    }
}

struct WheaterCondition: Decodable {
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
