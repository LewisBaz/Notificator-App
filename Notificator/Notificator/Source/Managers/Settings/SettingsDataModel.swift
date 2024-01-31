//
//  SettingsDataModel.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import SwiftData
import SwiftUI

@Model
final class SettingsDataModel {
    var colorSchemeId: Int
    
    init(colorSchemeId: Int) {
        self.colorSchemeId = colorSchemeId
    }
}
