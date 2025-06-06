//
//  NewUserChecker.swift
//  WheaterApp
//
//  Created by Борис Киселев on 06.06.2025.
//

import Foundation

final class NewUserCheckerManager {
    static let shared = NewUserCheckerManager()

    // MARK: - Check is user newbe
    func checkIsNewUser() -> Bool {
        return !(UserDefaults.standard.value(forKey: "isNewUser") != nil)
    }

    func makeUserIsNotNew() {
        UserDefaults.standard.setValue(false, forKey: "isNewUser")
    }
}
