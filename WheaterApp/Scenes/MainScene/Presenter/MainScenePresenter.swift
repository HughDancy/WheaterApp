//
//  MainScenePresenter.swift
//  WheaterApp
//
//  Created by Борис Киселев on 21.05.2025.
//

import Foundation

protocol MainScenePresentingLogic: AnyObject {
    func makeViewModel(_ response: MainModel.Response)
}

final class MainScenePresenter: MainScenePresentingLogic {
    weak var controller: MainSceneDisplayLogic?
    
    func makeViewModel(_ response: MainModel.Response) {
        var weatherInfo = [WeatherInfo]()
        var conditionIfo = [ConditionInfo]()
        guard let forecast = response.weatherData?.forecast?.forecastDay else { return }
        for (index, item) in forecast.enumerated() {
            let temperature = String.convertDecimal(item.day.temperature)
            let windSpeed = String.convertDecimal(item.day.maxWindSpeed)
            let weatherData = WeatherInfo(temperature: temperature ?? "", windSpeed: windSpeed ?? "", avghumidity: String(item.day.avghumidity ?? 0))
            weatherInfo.append(weatherData)

            let conditionLabel = item.day.condition?.conditionDescription
            let condition = ConditionInfo(condition: conditionLabel ?? "", icon: response.images[index])
            conditionIfo.append(condition)
        }
        controller?.getViewModel(MainModel.ViewModel(forecast: ForecastInfo(weaterInfo: weatherInfo, conditionInfo: conditionIfo)))
    }
}
