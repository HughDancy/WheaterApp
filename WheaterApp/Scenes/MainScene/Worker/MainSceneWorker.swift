//
//  MainSceneWorker.swift
//  WheaterApp
//
//  Created by Борис Киселев on 21.05.2025.
//

import Foundation
import UIKit.UIImage

protocol WeatherNetworkWorkerLogic: AnyObject {
    func fetchWeatherInfo() async -> WeatherResponse?
    func getConditionImage(url: String?) async -> UIImage?
}

final class WeatherNetworkWorker: WeatherNetworkWorkerLogic {

    func fetchWeatherInfo() async -> WeatherResponse? {
        let networkManager = WheaterNetworkManager()
        guard let cityName = UserDefaults.standard.string(forKey: "CityName") else { return nil }
        let response = await networkManager.fetchWeatherInfo(city: cityName)
        return response
    }

    func getConditionImage(url: String?) async -> UIImage? {
        let networkManager = WheaterNetworkManager()
        let image = await networkManager.downloadImage(simpleURL: url)
        return image
    }
}
