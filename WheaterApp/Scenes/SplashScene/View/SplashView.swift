//
//  SplashView.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import UIKit

final class SplashView: UIView {
    // MARK: - Subview's
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loadingScreen")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var checkLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.getPoppinsFonr(type: .semibold, size: 18)
        label.numberOfLines = 0
        label.lineBreakStrategy = .hangulWordPriority
        label.textColor = .white
        label.text = "Определяем Ваше местоположение..."
        return label
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.style = .large
        indicatorView.tintColor = .white
        indicatorView.isHidden = false
        return indicatorView
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private method for setup view
    private func setupView() {
        setupHierarchy()
        setupLayout()
        activityIndicator.startAnimating()
    }

    // MARK: - Setup Hierarchy
    private func setupHierarchy() {
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
        addSubview(checkLocationLabel)
        addSubview(activityIndicator)
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }

        checkLocationLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
        }

        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(checkLocationLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
    }
}
