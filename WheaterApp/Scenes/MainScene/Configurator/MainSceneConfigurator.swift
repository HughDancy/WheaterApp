//
//  MainSceneConfigurator.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import Foundation

protocol MainSceneConfiguratorProtocol: AnyObject {
    func createMainScene(_ contorller: MainSceneViewController) -> MainSceneViewController
}

final class MainSceneConfigurator: MainSceneConfiguratorProtocol {
    func createMainScene(_ contorller: MainSceneViewController) -> MainSceneViewController {
        let interactor = MainSceneInteractor()
        let presenter = MainScenePresenter()
        let worker = WeatherNetworkWorker()
//        let router = MainSceneRo

        contorller.interactor = interactor
//        contorller.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.controller = contorller

        return contorller
    }
}


