//
//  NotesListContentView.swift
//  Notificator
//
//  Created by Lewis on 01.02.2024.
//

import SwiftUI

struct NotesListContentView: View {
    @State var isVisible: Bool = false
    
    @State var text: String = ""
    var body: some View {
        NavigationLink(destination: EmptyView()) {
            Button {
                isVisible = true
            } label: {
                Text("test")
            }
        }
    }
}

#Preview {
    NotesListContentView()
}
