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
        let currentDayIndex = 0
        let currentItem = response.weatherData?.forecast?.forecastDay[currentDayIndex]
        let currentTemperature = String(describing: response.weatherData?.forecast?.forecastDay[currentDayIndex].day.temperature)
        let currentWindSpeed = String(describing: response.weatherData?.forecast?.forecastDay[currentDayIndex].day.maxWindSpeed)
        let currentAvg = String(response.weatherData?.forecast?.forecastDay[currentDayIndex].day.avghumidity ?? 0)
        let weatherData = WeatherInfo(temperature: currentTemperature, windSpeed: currentWindSpeed, avghumidity: currentAvg)
        
//        let manager = WheaterNetworkManager()
//        manager.downloadImage(simpleURL: response.weatherData?.forecast?.forecastDay[currentDayIndex].day.condition?.conditionDescription)
//     
//        let weatherData = WeatherInfo(temperature: currentItem?.day.temperature, windSpeed: <#T##String#>, avghumidity: String(currentItem?.day.avghumidity ?? 0))
//        let conditionData = ConditionInfo(condition: <#T##String#>, icon: <#T##String#>)
//        let forecastData = ForecastInfo(weaterInfo: <#T##[WeatherInfo]#>, conditionInfo: <#T##[ConditionInfo]#>)

    }
}
