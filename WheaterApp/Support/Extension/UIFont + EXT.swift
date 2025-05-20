//
//  UIFont + EXT.swift
//  WheaterApp
//
//  Created by Борис Киселев on 20.05.2025.
//

import Foundation
import UIKit.UIFont

extension UIFont {
    static func getPoppinsFonr(type: UIFont.Weight, size: CGFloat) -> UIFont {
        switch type {
        case .medium:
            return UIFont(name: "Poppins-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: type)
        case .semibold:
            return UIFont(name: "Poppins-Semibold", size: size) ?? UIFont.systemFont(ofSize: size, weight: type)
        default:
            return UIFont.systemFont(ofSize: size, weight: type)
        }
    }
}
