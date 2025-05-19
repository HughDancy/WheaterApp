//
//  ViewController.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColors.day.getColor(type: .text)
        let weatherManager = WheaterNetworkManager()
        weatherManager.testMethod()
        // Do any additional setup after loading the view.
    }


}

