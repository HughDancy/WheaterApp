//
//  SplashSceneConfigurator.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import Foundation

protocol SplashSceneConfiguratorProtocol: AnyObject {
    func createSplashScene(_ controller: SplashViewController) -> SplashViewController
}

final class SplashSceneConfigurator: SplashSceneConfiguratorProtocol {
    func createSplashScene(_ controller: SplashViewController) -> SplashViewController {
        let interactor = SplashInteractor()
        let worker = SplashWorker()
        let presenter = SplashPresenter()
        let router = SplashRouter()

        controller.interactor = interactor
        controller.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.controller = controller
        router.source = controller
        return controller
    }
}
