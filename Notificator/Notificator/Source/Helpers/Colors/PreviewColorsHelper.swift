//
//  PreviewColorsHelper.swift
//  Notificator
//
//  Created by Lewis on 13.02.2024.
//

import SwiftUI

final class PreviewColorsHelper: ObservableObject {
    
    // MARK: - Private Properties
    
    private let isPreview: Bool
    
    // MARK: - EnvironmentObject Properties
    
    private let colorSchemeManager = ColorSchemeManager.shared
    
    // MARK: - Init
    
    init(isPreview: Bool) {
        self.isPreview = isPreview
    }
    
    // MARK: - Public Methods
    
    func getAccentColor() -> Color {
        if isPreview {
            return .blue
        } else {
            return colorSchemeManager.accent
        }
    }
    
    func getMainColor() -> Color {
        if isPreview {
            return .blue
        } else {
            return colorSchemeManager.main
        }
    }
}
