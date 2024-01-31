//
//  ColorSchemeManager.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import SwiftUI
import SwiftData

enum AppColorScheme: Int {
    case blue
    case pink
}

final class ColorSchemeManager: ObservableObject {
    
    // MARK: - Published Properties
  
    @Published var colorSheme: AppColorScheme = .blue
    
    // MARK: - Private Properties
    
    private let blueColor = ColorSchemeModel(
        id: .blue, 
        main: .init(red: 225, green: 240, blue: 247),
        accent: .init(red: 79, green: 135, blue: 161),
        secondary: .init(red: 225, green: 225, blue: 225)
    )
    private let pinkColor = ColorSchemeModel(
        id: .pink,
        main: .init(red: 233, green: 217, blue: 235),
        accent: .init(red: 187, green: 170, blue: 187),
        secondary: .init(red: 225, green: 225, blue: 225)
    )
    
    // MARK: - Public Properties
    
    var main: Color {
        switch colorSheme {
        case .blue:
            return blueColor.main.getColor()
        case .pink:
            return pinkColor.main.getColor()
        }
    }
    
    var accent: Color {
        switch colorSheme {
        case .blue:
            return blueColor.accent.getColor()
        case .pink:
            return pinkColor.accent.getColor()
        }
    }
    
    // MARK: - Public Methods

    func updateColorScheme(to colorSheme: AppColorScheme) {
        self.colorSheme = colorSheme
    }
}
