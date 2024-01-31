//
//  AppDeps.swift
//  Notificator
//
//  Created by Lewis on 28.01.2024.
//

import SwiftUI

final class AppDeps {
    
    static let shared = AppDeps()
    
    private init() {
        let isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")
        _isFirstLaunch = State(initialValue: isFirstLaunch)
        if !isFirstLaunch {
            UserDefaults.standard.setValue(true, forKey: "isFirstLaunch")
        }
    }
    
    @State var isFirstLaunch: Bool
    
}
