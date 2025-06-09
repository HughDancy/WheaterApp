//
//  MainSceneInteractor.swift
//  WheaterApp
//
//  Created by Борис Киселев on 21.05.2025.
//

import Foundation
import UIKit.UIImage

protocol MainSceneBussinessLogic: AnyObject {
    func makeWeatherRequest(_ request: MainModel.Request)
}

final class MainSceneInteractor: MainSceneBussinessLogic {

    var presenter: MainScenePresentingLogic?
    var worker: WeatherNetworkWorkerLogic?

    func makeWeatherRequest(_ request: MainModel.Request) {
        Task {
            var images = [UIImage?]()
            let wheaherResponse = await worker?.fetchWeatherInfo()
            guard let wheaterData = wheaherResponse?.forecast?.forecastDay else { return }
            for dayWeather in wheaterData {
                let pictureReference = dayWeather.day.condition?.conditionIconReference
                let image = await worker?.getConditionImage(url: pictureReference)
                images.append(image)
            }
            self.presenter?.makeViewModel(MainModel.Response(weatherData: wheaherResponse, images: images))
        }
    }
}
