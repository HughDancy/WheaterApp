//
//  SplashViewController.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import UIKit

protocol SplashSceneDisplayLogic: AnyObject {
    func sendToMainModule()
}

final class SplashViewController: UIViewController {

    // MARK: - Protocol properties
    var interactor: SplashSceneBussinessLogic?
    var router: SplashSceneRoutingLogic? 

    private var splashView: SplashView? {
        guard isViewLoaded else { return nil }
        return view as? SplashView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SplashView()
        interactor?.getCurrentCityName()
    }
}

extension SplashViewController: SplashSceneDisplayLogic {
    func sendToMainModule() {
        router?.goToMainModule()
    }
}
