//
//  SplashPresenter.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import Foundation

protocol SplashScenePresentingLogic: AnyObject {
    func aproveMovingToMainModule()
}

final class SplashPresenter: SplashScenePresentingLogic {
    weak var controller: SplashSceneDisplayLogic?

    func aproveMovingToMainModule() {
        controller?.sendToMainModule()
    }
}

