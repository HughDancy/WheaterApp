//
//  TodayWheaterView.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import UIKit

final class TodayWheaterView: UIView {
    private var condition: String
    private var icon: String
    private var temperature: Double
    private var windSpeed: Double
    private var avghumidity: Double

   // MARK: - Subview's
    private lazy var containerView: UIView = {
        let view = UIView()

        return view
    }()

   // MARK: - Init
    init(condition: String, icon: String, temperature: Double, windSpeed: Double, avghumidity: Double) {
        self.condition = condition
        self.icon = icon
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.avghumidity = avghumidity
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup view private method
    private func setupView() {
        backgroundColor = .clear
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup Hierarhcy
    private func setupHierarchy() {

    }

    // MARK: - Setup Layout
    private func setupLayout() {

    }
}
