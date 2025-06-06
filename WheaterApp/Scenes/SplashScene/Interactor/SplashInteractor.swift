//
//  SplashInteractor.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import Foundation

protocol SplashSceneBussinessLogic: AnyObject {
    func getCurrentCityName()
}

final class SplashInteractor: SplashSceneBussinessLogic {
    private let locationManager = LocationManager()

    var presenter: SplashScenePresentingLogic?
    var worker: SplashSceneWorkerProtocol?

    init() {
        locationManager.delegate = self
    }

    func getCurrentCityName() {
        worker?.fetchCurrentCity()
    }
}

extension SplashInteractor: LocationManagerDelegate {
    func getCityName(city: String?) {
        UserDefaults.standard.set(city, forKey: "CityName")
        presenter?.aproveMovingToMainModule()
    }
}
