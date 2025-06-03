//
//  TodayWheaterView.swift
//  WheaterApp
//
//  Created by Борис Киселев on 17.05.2025.
//

import UIKit
import SnapKit

final class TodayWheaterView: UIView {
    private var weatherInfo: WeatherInfo?
    private var conditionInfo: ConditionInfo? {
        didSet {
            let type = TypeOfCondition.snow.getType(condition: conditionInfo?.condition)
            let colorManager = ConditionColor(type: type)
            colorAppearence = colorManager.getMainColor()
        }
    }
    private var colorAppearence: ColorAppearence?

   // MARK: - Subview's
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = colorAppearence?.mainColor
        view.layer.cornerRadius = 25
        return view
    }()

    private var nameOfCity: UILabel = {
        let label = UILabel()
        label.font = UIFont.getPoppinsFonr(type: .medium, size: 30)
        label.textAlignment = .center
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.getPoppinsFonr(type: .medium, size: 20)
        label.textAlignment = .center
        
        return label
    }()

    private lazy var temperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()

    private lazy var conditionIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.getPoppinsFonr(type: .medium, size: 30)
        label.textAlignment = .center
        label.text = "%@ ℃"
        return label
    }()

    private var conditionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.getPoppinsFonr(type: .semibold, size: 20)
        label.textAlignment = .center
        return label
    }()

    private lazy var windIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.image = UIImage(systemName: "wind")
        return imageView
    }()

    private lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.getPoppinsFonr(type: .medium, size: 20)
        label.textAlignment = .center
        return label
    }()

    private lazy var avghumidityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "drop.degreesign.fill")
        return imageView
    }()

    private lazy var avghumidityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.getPoppinsFonr(type: .medium, size: 20)
        label.textAlignment = .center
        return label
    }()

   // MARK: - Init
    init(weather: WeatherInfo?, condition: ConditionInfo?) {
        self.weatherInfo = weather
        self.conditionInfo = condition
        super.init(frame: .zero)
        setupBackground(condition)
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
        setupElements()
    }

    // MARK: - Setup Hierarhcy
    private func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubview(nameOfCity)
        containerView.addSubview(dateLabel)
        containerView.addSubview(temperatureStackView)
        temperatureStackView.addArrangedSubview(conditionIcon)
        temperatureStackView.addArrangedSubview(temperatureLabel)
        containerView.addSubview(conditionLabel)
        containerView.addSubview(windIcon)
        containerView.addSubview(windSpeedLabel)
        containerView.addSubview(avghumidityIcon)
        containerView.addSubview(avghumidityLabel)
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(5)
        }

        nameOfCity.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameOfCity.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }

        temperatureStackView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(70)
            make.height.equalTo(100)
        }

        conditionLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureStackView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }

        windIcon.snp.makeConstraints { make in
            make.top.equalTo(conditionLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40)
        }

        windSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(conditionLabel.snp.bottom).offset(20)
            make.leading.equalTo(windIcon.snp.trailing).offset(10)
        }

        avghumidityIcon.snp.makeConstraints { make in
            make.top.equalTo(windIcon.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40)
        }

        avghumidityLabel.snp.makeConstraints { make in
            make.top.equalTo(windSpeedLabel.snp.bottom).offset(15)
            make.leading.equalTo(avghumidityIcon.snp.trailing).offset(10)
        }
    }
    
    // MARK: - Setup background
    private func setupBackground(_ condition: ConditionInfo?) {
        var type = TypeOfCondition.snow.getType(condition: conditionInfo?.condition)
        let colorManager = ConditionColor(type: type)
        colorAppearence = colorManager.getMainColor()
    }

    // MARK: - TODO: - Fix this for view
    private func setupElements() {
        containerView.backgroundColor = colorAppearence?.mainColor
        conditionIcon.image = UIImage(systemName: "sun.max.fill")
        conditionIcon.tintColor = colorAppearence?.textColor
        nameOfCity.text = "London"
        nameOfCity.textColor = colorAppearence?.textColor
        dateLabel.text = "20 May 2025"
        dateLabel.textColor = colorAppearence?.textColor
        temperatureLabel.text = String(format: "%@ ℃", "19")
        temperatureLabel.textColor = colorAppearence?.textColor
        conditionLabel.text = "Sunny"
        conditionLabel.textColor = colorAppearence?.textColor
        windIcon.tintColor = colorAppearence?.textColor
        windSpeedLabel.text = "10.0"
        windSpeedLabel.textColor = colorAppearence?.textColor
        avghumidityIcon.tintColor = colorAppearence?.textColor
        avghumidityLabel.text = "20"
        avghumidityLabel.textColor = colorAppearence?.textColor
    }
}

