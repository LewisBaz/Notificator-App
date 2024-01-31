//
//  SettingsContentView.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import SwiftUI
import SwiftData

struct SettingsContentView: View {
    
    // MARK: - EnvironmentObject Properties
    
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    
    // MARK: - Public Properties
    
    var viewModel: SettingsViewModel
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Button("blue") {
                colorSchemeManager.updateColorScheme(to: .blue)
                saveScheme()
                print(viewModel.settings?.colorSchemeId as Any)
            }
            Button("pink") {
                colorSchemeManager.updateColorScheme(to: .pink)
                saveScheme()
                print(viewModel.settings?.colorSchemeId as Any)
            }
        }
    }
}

// MARK: - Private Methods

private extension SettingsContentView {
    
    func saveScheme() {
        if viewModel.settings != nil {
            viewModel.settings?.colorSchemeId = colorSchemeManager.colorSheme.rawValue
        } else {
            let settingsModel: SettingsDataModel = .init(
                colorSchemeId: Constants.defaultColor.rawValue
            )
            viewModel.insertSettings(settingsModel)
        }
        viewModel.save()
    }
}

// MARK: - Preview

#Preview {
    SettingsContentView(viewModel: SettingsViewModel())
}
