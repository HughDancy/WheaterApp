//
//  BaseIconView.swift
//  WheaterApp
//
//  Created by Борис Киселев on 21.05.2025.
//

import UIKit

class BaseIconView: UIImageView {

    init(systemName: String, tintColor: UIColor?) {
        super.init(frame: .zero)
        self.image = UIImage(systemName: systemName)
        self.tintColor = tintColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
