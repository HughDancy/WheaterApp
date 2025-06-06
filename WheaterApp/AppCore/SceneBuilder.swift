//
//  ModuleBuilder.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import UIKit

protocol SceneBuilderProtocol: AnyObject {
    func createSplashScene() -> UIViewController
    func createMainScene() -> UINavigationController
}

final class SceneBuilder: SceneBuilderProtocol {
    // MARK: - Private properties
    private let splashConfigurator = SplashSceneConfigurator()
    private let mainSceneConfigurator = MainSceneConfigurator()

    // MARK: - Protocol mehtods
    func createSplashScene() -> UIViewController {
        let splashModule = splashConfigurator.createSplashScene(SplashViewController())
//        let navigationSplash = UINavigationController(rootViewController: splashModule)
        return splashModule
    }

    func createMainScene() -> UINavigationController {
        let mainScene = mainSceneConfigurator.createMainScene(MainSceneViewController())
        let navigationMainSceneController = UINavigationController(rootViewController: mainScene)
        return navigationMainSceneController
    }
}
