//
//  SplashSceneRoutingLogic.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import Foundation
import UIKit

protocol SplashSceneRoutingLogic: AnyObject {
    func goToMainModule()
}

final class SplashRouter: SplashSceneRoutingLogic {

    weak var source: SplashViewController?

    func goToMainModule() {
        let sceneBuilder = SceneBuilder()
        let mainScene = sceneBuilder.createMainScene()
        guard let windowScene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        NewUserCheckerManager.shared.makeUserIsNotNew()
        windowScene.setRootViewController(mainScene)
    }
}
