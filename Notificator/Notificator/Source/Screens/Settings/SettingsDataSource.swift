//
//  SettingsDataSource.swift
//  Notificator
//
//  Created by Lewis on 28.01.2024.
//

import SwiftData

final class SettingsDataSource {
    
    // MARK: - Private Properties
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    // MARK: - Init
    
    @MainActor 
    init() {
        self.modelContainer = try! ModelContainer(for: SettingsDataModel.self)
        self.modelContext = modelContainer.mainContext
    }
    
    // MARK: - Public Methods
    
    func getSettings() -> SettingsDataModel? {
        do {
            let settings = try modelContext.fetch(FetchDescriptor<SettingsDataModel>())
            return settings.first
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func save() {
        do {
            try modelContext.save()
        }
        catch {
            print(error)
        }
    }
    
    func insertSettings(_ settings: SettingsDataModel) {
        modelContext.insert(settings)
    }
}
