//
//  MainSceneInteractor.swift
//  WheaterApp
//
//  Created by Борис Киселев on 21.05.2025.
//

import Foundation

protocol MainSceneBussinessLogic: AnyObject {
    func makeWeatherRequest(_ request: MainModel.Request)
}

final class MainSceneInteractor: MainSceneBussinessLogic {
    
    var presenter: MainScenePresentingLogic?
    var worker: WeatherNetworkWorkerLogic?
    
    func makeWeatherRequest(_ request: MainModel.Request) {
        Task {
           await worker?.fetchWeatherInfo(cityName: request.cityName, { [weak self] response in
                self?.presenter?.makeViewModel(response)
            })
        }
    }
}
