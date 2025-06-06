//
//  SplashWorker.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import Foundation

protocol SplashSceneWorkerProtocol: AnyObject {
    func fetchCurrentCity()
}

final class SplashWorker: SplashSceneWorkerProtocol {
    private let locationManager = LocationManager()

    func fetchCurrentCity() {
        locationManager.checkAuthorization { }
    }
}

