//
//  RepeatNoteContentView.swift
//  Notificator
//
//  Created by Lewis on 01.02.2024.
//

import SwiftUI

struct RepeatNoteContentView: View {
    
    // MARK: - StateObject Properties
    
    @StateObject var previewColorsHelper = PreviewColorsHelper(isPreview: Constants.isPreview)
    
    // MARK: - Binding Properties
    
    @Binding var selectedRepeatText: String
    @Binding var repeatObjects: [NoteRepeating]
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List(repeatObjects, id: \.type) { repeatObject in
                    Button {
                        repeatObjectTapped(type: repeatObject.type)
                    } label: {
                        HStack {
                            Text(repeatObject.name)
                                .padding(8)
                            Spacer()
                            if repeatObject.isSelected {
                                Image(.checkmark)
                                    .foregroundStyle(previewColorsHelper.getAccentColor())
                            }
                        }
                    }
                    .foregroundStyle(.primary)
                }
                .navigationTitle("Repeat")
            }
        }
    }
}

// MARK: - Private Methods

private extension RepeatNoteContentView {
    
    func repeatObjectTapped(type: NoteRepeatType) {
        guard let lastSelectedIndex = repeatObjects.firstIndex(where: { $0.isSelected == true }),
              let selectedIndex = repeatObjects.firstIndex(where: { $0.type == type })
        else { return }
        repeatObjects[lastSelectedIndex].isSelected = false
        repeatObjects[selectedIndex].isSelected = true
        selectedRepeatText = repeatObjects[selectedIndex].name
    }
}

#Preview {
    RepeatNoteContentView(selectedRepeatText: .init(get: { "" }, set: { _ in }), repeatObjects: .init(get: { NoteRepeatType.allCases.map({ $0.make() }) }, set: { _ in }))
}
