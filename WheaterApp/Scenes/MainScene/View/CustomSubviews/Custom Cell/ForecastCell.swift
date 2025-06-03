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

    private lazy var dateLabel = BaseLabel(text: "", color: nil, weight: .semibold, size: 15, aligment: .center)
//        let label = BaseLabel(text: "", color: nil, weight: .semibold, size: 15, aligment: .center)
//        
//        label.font = UIFont.getPoppinsFonr(type: .semibold, size: 15)
//        label.textAlignment = .center
//        return label
//    }()

    private lazy var temperatureLabel = BaseLabel(text: "", color: nil, weight: .semibold, size: 15, aligment: .center)
//    : UILabel = {
//        let label = UILabel()
//        label.font = UIFont.getPoppinsFonr(type: .semibold, size: 15)
//        return label
//    }()

    private lazy var conditionIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()

    private lazy var conditionLabel = BaseLabel(text: "", color: nil, weight: .semibold, size: 15, aligment: .center)
//    : UILabel = {
//        let label = UILabel()
//      
//        return label
//    }()

    private lazy var windIcon = BaseIconView(systemName: "wind", tintColor: nil)
//    : UIImageView = {
//        let imageView = UIImageView()
//        
//        return imageView
//    }()

    private lazy var windSpeedLabel = BaseLabel(text: "", color: nil, weight: .semibold, size: 15, aligment: .center)
//    : UILabel = {
//        let label = UILabel()
//
//        return label
//    }()

    private lazy var avgIcon = BaseIconView(systemName: "drop.degreesign.fill", tintColor: nil)
//    : UIImageView = {
//        let imageView = UIImageView()
//
//        return imageView
//    }()

    private lazy var avgLabel = BaseLabel(text: "", color: nil, weight: .semibold, size: 15, aligment: .center)
//    : UILabel = {
//        let label = UILabel()
//
//        return label
//    }()

    // MARK: - Blur effect
    private lazy var blurContainerView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .extraLight)
        let effectView = UIVisualEffectView(effect: effect)
    
        return effectView
    }()

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
        blurContainerView.layer.masksToBounds = true
        blurContainerView.layer.cornerRadius = 12
        setupHierarchy()
        setupLayout()
     
    }
    // MARK: - Setup Hierarchy
    private func setupHierarchy() {
        contentView.addSubview(blurContainerView)
        blurContainerView.contentView.addSubview(dateLabel)
        blurContainerView.contentView.addSubview(temperatureLabel)
        blurContainerView.contentView.addSubview(conditionIcon)
        blurContainerView.contentView.addSubview(conditionLabel)
        blurContainerView.contentView.addSubview(windIcon)
        blurContainerView.contentView.addSubview(windSpeedLabel)
        blurContainerView.contentView.addSubview(avgIcon)
        blurContainerView.contentView.addSubview(avgLabel)
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        blurContainerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(5)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().offset(15)
        }

        temperatureLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(dateLabel.snp.trailing).offset(15)
        }

        conditionIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(temperatureLabel.snp.trailing).offset(5)
            make.width.height.equalTo(20)
        }

        conditionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(conditionIcon.snp.trailing).offset(5)
        }

        avgLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }

        avgIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalTo(avgLabel.snp.leading).offset(-5)
            make.width.height.equalTo(20)
        }

        windSpeedLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalTo(avgIcon.snp.leading).offset(-10)
        }

        windIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalTo(windSpeedLabel.snp.leading).offset(5)
            make.width.height.equalTo(20)
        }

    }
    // MARK: - Setup Cell Public method
    func setupCell(date: String, temp: String, icon: UIImage?, condition: String, windSpeed: String, avg: String, textColor: UIColor) {
        dateLabel.text = date
        temperatureLabel.text = temp
        conditionIcon.image = icon
        conditionLabel.text = condition
        conditionLabel.textColor = textColor
        windSpeedLabel.text = windSpeed
        avgLabel.text = avg
        dateLabel.textColor = textColor
        temperatureLabel.textColor = textColor
        conditionIcon.tintColor = textColor
        conditionLabel.textColor = textColor
        windIcon.tintColor = textColor
        windSpeedLabel.textColor = textColor
        avgLabel.textColor = textColor
        
    }

}
