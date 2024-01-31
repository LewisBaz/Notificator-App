//
//  TabBarItemStyle.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import SwiftUI
import TabBar

struct AppTabBarItemStyle: TabItemStyle {
    
    // MARK: - ObservedObject Properties
    
    @ObservedObject var colorSchemeManager: ColorSchemeManager
    
    // MARK: - Init
    
    init(_ colorSchemeManager: ColorSchemeManager) {
        self.colorSchemeManager = colorSchemeManager
    }
    
    // MARK: - TabItemStyle
    
    func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        ZStack {
            if isSelected {
                Circle()
                    .foregroundColor(colorSchemeManager.accent)
                    .frame(width: 40.0, height: 40.0)
            }
            
            Image(systemName: icon)
                .foregroundColor(isSelected ? .white : .gray)
                .frame(width: 32.0, height: 32.0)
        }
        .padding(.vertical, 8.0)
    }
    
}
