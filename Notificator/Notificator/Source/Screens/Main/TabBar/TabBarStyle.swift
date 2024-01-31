//
//  TabBarStyle.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import SwiftUI
import TabBar

struct AppTabBarStyle: TabBarStyle {
    
    // MARK: - ObservedObject Properties
    
    @ObservedObject var colorSchemeManager: ColorSchemeManager
    
    // MARK: - Init
    
    init(_ colorSchemeManager: ColorSchemeManager) {
        self.colorSchemeManager = colorSchemeManager
    }
    
    // MARK: - TabItemStyle
    
    func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        itemsContainer()
            .background(colorSchemeManager.main)
            .cornerRadius(20.0)
            .frame(height: 50.0)
            .padding(.horizontal, 32)
            .padding(.bottom, 16.0 + geometry.safeAreaInsets.bottom)
    }
}
