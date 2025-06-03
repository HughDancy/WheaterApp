//
//  MainSceneView.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import UIKit

final class MainSceneView: UIView {

   // MARK: - Private properties
//    private var weatherInfo: WeatherInfo?
//    private var conditionInfo: ConditionInfo?
    private var forecast: ForecastInfo?
    private var colorInfo: ColorAppearence?

   // MARK: - Subview's
    private lazy var backgroundImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var currentWeatherView: TodayWheaterView = {
        let currentWeather = TodayWheaterView(weather: forecast?.weaterInfo[0], condition: forecast?.conditionInfo[0])
        return currentWeather
    }()
    
    private lazy var forecastTable: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(ForecastCell.self, forCellReuseIdentifier: ForecastCell.reuseIdentifier)
        tableView.dataSource = self
        return tableView
    }()
    

   // MARK: - Init
    init(forecast: ForecastInfo?) {
        self.forecast = forecast
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   // MARK: - Setup view private methods
    private func setupView() {
        backgroundImage.image = UIImage(named: "cloudy02")
        setupHierarchy()
        setupLayout()
    }

   // MARK: - Setup Hierarchy
    private func setupHierarchy() {
        addSubview(backgroundImage)
        sendSubviewToBack(backgroundImage)
        addSubview(currentWeatherView)
        addSubview(forecastTable)
    }

   // MARK: - Setup Layout
    private func setupLayout() {
        backgroundImage.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    
        currentWeatherView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(34)
            make.height.equalTo(UIScreen.main.bounds.size.height / 2.5)
        }
        
        forecastTable.snp.makeConstraints { make in
            make.top.equalTo(currentWeatherView.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(34)
            make.bottom.equalToSuperview().offset(-40)
        }
    }

   // MARK: - Public setup methods?

}

extension MainSceneView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastCell.reuseIdentifier, for: indexPath) as? ForecastCell else {
            return UITableViewCell()
        }
        let image = UIImage(systemName: "sun.max.fill")
//        cell.contentView.layer.masksToBounds = false
        cell.setupCell(date: "21 May 2025", temp: "26", icon: image, condition: "Sunny", windSpeed: "0.5", avg: "20", textColor: .cloudyText2)
        return cell
    }
}
