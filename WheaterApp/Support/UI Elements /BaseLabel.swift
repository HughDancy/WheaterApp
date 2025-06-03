//
//  BaseLabel.swift
//  WheaterApp
//
//  Created by Борис Киселев on 21.05.2025.
//

import UIKit

class BaseLabel: UILabel {

    init(text: String, color: UIColor?, weight: UIFont.Weight, size: CGFloat, aligment: NSTextAlignment) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = color
        self.font = UIFont.getPoppinsFonr(type: weight, size: size)
        self.textAlignment = aligment
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
