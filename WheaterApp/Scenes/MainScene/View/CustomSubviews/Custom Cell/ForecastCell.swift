//
//  ForecastCell.swift
//  WheaterApp
//
//  Created by Борис Киселев on 20.05.2025.
//

import UIKit

final class ForecastCell: UITableViewCell {

    static let reuseIdentifier = String(describing: ForecastCell.self)

    // MARK: - Subview's
    private lazy var containerView: UIView = {
        let view = UIView()
        
        return view
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var conditionIcon: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    private lazy var conditionLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private lazy var windIcon: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    private lazy var windSpeedLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private lazy var avgIcon: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    private lazy var avgLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    // MARK: - Blur effect
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private method for setup cell
    private func setupCell() {
        backgroundColor = .clear
        selectionStyle = .none
        blurView.frame = containerView.bounds
        setupHierarchy()
        setupLayout()
    }
    // MARK: - Setup Hierarchy
    private func setupHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(temperatureLabel)
        containerView.addSubview(conditionIcon)
        containerView.addSubview(conditionLabel)
        containerView.addSubview(windIcon)
        containerView.addSubview(windSpeedLabel)
        containerView.addSubview(avgIcon)
        containerView.addSubview(avgLabel)
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(5)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview().offset(15)
        }

        temperatureLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(dateLabel.snp.trailing).offset(15)
        }

        conditionIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(temperatureLabel.snp.trailing).offset(5)
            make.width.height.equalTo(10)
        }

        conditionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(conditionIcon.snp.trailing).offset(5)
        }

        avgLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-15)
        }

        avgIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalTo(avgLabel.snp.leading).offset(-5)
            make.width.height.equalTo(10)
        }

        windSpeedLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalTo(avgIcon.snp.leading).offset(-10)
        }

        windIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalTo(windSpeedLabel.snp.leading).offset(5)
            make.width.height.equalTo(10)
        }

    }
    // MARK: - Setup Cell Public method
    func setupCell(date: String, temp: String, icon: UIImage, windSpeed: String, avg: String) {

    }



}
