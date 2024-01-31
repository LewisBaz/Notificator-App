//
//  MainViewModel.swift
//  Notificator
//
//  Created by Lewis on 29.01.2024.
//

import SwiftUI
import TabBar

@MainActor
final class MainViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var selection: TabBarItem = .list
    @Published var visibility: TabBarVisibility = .visible
    @Published var showingSheet: Bool = false
    
    // MARK: - StateObject Properties
    
    @StateObject var settingsViewModel = SettingsViewModel()
}
