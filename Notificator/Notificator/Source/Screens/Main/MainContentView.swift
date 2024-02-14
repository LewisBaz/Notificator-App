//
//  MainContentView.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import SwiftUI
import SwiftData
import TabBar

struct MainContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [ItemL]
    
    // MARK: - ObservedObject Properties
    
    @ObservedObject var viewModel = MainViewModel()
    
    // MARK: - StateObject Properties
    
    @StateObject var colorSchemeManager = ColorSchemeManager.shared
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            TabBar(selection: $viewModel.selection, visibility: $viewModel.visibility) {
                NotesListContentView()
                    .tabItem(for: TabBarItem.list)
                
                Text("")
                    .sheet(isPresented: $viewModel.showingSheet, content: {
                        NavigationStack {
                            AddNoteContentView(closeView: $viewModel.showingSheet)
                                .environmentObject(colorSchemeManager)
                        }
                    })
                    .tabItem(for: TabBarItem.add)
                
                SettingsContentView(viewModel: viewModel.settingsViewModel)
                    .environmentObject(colorSchemeManager)
                    .tabItem(for: TabBarItem.settings)
            }
            .tabBar(style: AppTabBarStyle(colorSchemeManager))
            .tabItem(style: AppTabBarItemStyle(colorSchemeManager))
            .onAppear {
                setAppTheme()
            }
            .onChange(of: viewModel.selection) { oldValue, newValue in
                viewModel.showingSheet = newValue == .add
            }
            .onChange(of: viewModel.showingSheet) { oldValue, newValue in
                guard newValue == false else { return }
                viewModel.selection = .list
            }
        }
    }
}

// MARK: - Private Methods

private extension MainContentView {
    
    func setAppTheme() {
        guard let colorShemeId = viewModel.settingsViewModel.settings?.colorSchemeId else { return }
        print(colorShemeId)
        colorSchemeManager.updateColorScheme(to: .init(rawValue: colorShemeId) ?? .blue)
    }
    
    func addItem() {
        withAnimation {
            let newItem = ItemL(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

// MARK: - Preview

#Preview {
    MainContentView()
        .modelContainer(for: ItemL.self, inMemory: true)
}
