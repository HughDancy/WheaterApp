//
//  MainSceneWorker.swift
//  WheaterApp
//
//  Created by Борис Киселев on 21.05.2025.
//

import Foundation

protocol WeatherNetworkWorkerLogic: AnyObject {
    func fetchWeatherInfo(cityName: String, _ compelition: @escaping (MainModel.Response) -> Void) async
}

final class WeatherNetworkWorker: WeatherNetworkWorkerLogic {
    func fetchWeatherInfo(cityName: String, _ compelition: @escaping (MainModel.Response) -> Void) async {
        let networkManager = WheaterNetworkManager()
        await networkManager.testMethod(city: cityName) { response in
            compelition(MainModel.Response(weatherData: response))
        }
    }
}
