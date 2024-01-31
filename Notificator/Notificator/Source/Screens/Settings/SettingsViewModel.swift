//
//  SettingsViewModel.swift
//  Notificator
//
//  Created by Lewis on 28.01.2024.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    // MARK: - ObservationIgnored Properties
    
    @ObservationIgnored private let settingsDataSource: SettingsDataSource
    
    // MARK: - Public Properties
    
    var settings: SettingsDataModel?
    
    // MARK: - Init
    
    @MainActor
    init() {
        self.settingsDataSource = SettingsDataSource()
        settings = settingsDataSource.getSettings()
    }
    
    // MARK: - Public Methods
    
    func save() {
        settingsDataSource.save()
    }
    
    func insertSettings(_ settings: SettingsDataModel) {
        settingsDataSource.insertSettings(settings)
    }
}
