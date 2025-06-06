//
//  MainSceneViewController.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import UIKit

protocol MainSceneDisplayLogic: AnyObject {
    func getViewModel(_ viewModel: MainModel.ViewModel)
}

final class MainSceneViewController: UIViewController {
    
    // MARK: -
    var interactor: MainSceneBussinessLogic?
    
    // MARK: - Private properties
    private var viewModel: MainModel.ViewModel?
    private let locationManager = LocationManager()

    private var mainView: MainSceneView? {
        guard isViewLoaded else { return nil }
        return view as? MainSceneView
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        // MARK: - Fix this to custom choosing
        interactor?.makeWeatherRequest(MainModel.Request(cityName: "Antalia"))
//        let condition = ConditionInfo(condition: "Sunny", icon: "sun.max.fill")
         view = MainSceneView(forecast: viewModel?.forecast)
    }

}

extension MainSceneViewController: MainSceneDisplayLogic {
    func getViewModel(_ viewModel: MainModel.ViewModel) {
        self.viewModel = viewModel
    }
}

extension MainSceneViewController: LocationManagerDelegate {
    func getCityName(city: String?) {
        print("IN VIEw CONTORLLER CITY IS - \(city)")
    }
    
    
}
