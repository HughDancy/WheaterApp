//
//  SplashViewController.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import UIKit

final class SplashViewController: UIViewController {

    private var splashView: SplashView? {
        guard isViewLoaded else { return nil }
        return view as? SplashView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SplashView()
    }
}
