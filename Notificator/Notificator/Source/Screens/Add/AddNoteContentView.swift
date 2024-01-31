//
//  AddNoteContentView.swift
//  Notificator
//
//  Created by Lewis on 29.01.2024.
//

import SwiftUI
import SafeSFSymbols

struct AddNoteContentView: View {
    
    @Environment(\.isPreview) var isPreview
    
    // MARK: - Binding Properties
    
    @Binding var closeView: Bool
    
    // MARK: - EnvironmentObject Properties
    
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    
    // MARK: - StateObject Properties
    
    @StateObject var viewModel = AddNoteViewModel()
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                Button {
                    closeView.toggle()
                } label: {
                    Image(.xmark)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(getAccentColor())
                }
                .padding(20)
            }
            ZStack {
                if viewModel.noteText.isEmpty {
                    HStack {
                        Text(viewModel.placeholderText)
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    .frame(minHeight: 50)
                }
                TextEditor(text: $viewModel.noteText)
                    .font(.title)
                    .foregroundColor(.primary)
                    .opacity(viewModel.noteText.isEmpty ? 0.4 : 1)
                    .padding(.leading, 15)
                    .frame(minHeight: 50)
            }
            VStack(spacing: 20) {
                HStack(alignment: .center, spacing: 16, content: {
                    Image(.calendar)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .font(.title2)
                    Button {
                        viewModel.isDatePickerVisible.toggle()
                    } label: {
                        Text(viewModel.dateText.isEmpty ? viewModel.defaultDateTimeButtonText : viewModel.dateText)
                    }
                    Spacer()
                })
                if viewModel.isDatePickerVisible {
                    DatePicker("", selection: $viewModel.selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .onChange(of: viewModel.selectedDate) { _, newValue in
                            viewModel.updateDateText(selectedDate: newValue)
                        }
                        .onAppear(perform: {
                            viewModel.updateDateText(selectedDate: Date())
                        })
                }
                HStack(alignment: .center, spacing: 16, content: {
                    Image(.clock)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .font(.title2)
                    Button {
                        viewModel.isTimePickerVisible.toggle()
                    } label: {
                        Text(viewModel.timeText.isEmpty ? viewModel.defaultDateTimeButtonText : viewModel.timeText)
                    }
                    Spacer()
                })
                if viewModel.isTimePickerVisible {
                    DatePicker("", selection: $viewModel.selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .onChange(of: viewModel.selectedTime) { _, newValue in
                            viewModel.updateTimeText(selectedTime: newValue)
                        }
                        .onAppear(perform: {
                            viewModel.updateTimeText(selectedTime: Date())
                        })
                }
            }
            .padding(20)
            Button("Save") {
                closeView.toggle()
            }
            .padding(10)
            .font(.title3)
            .foregroundStyle(.white)
            .background(RoundedRectangle(cornerRadius: 12).fill(getMainColor()))
        }
        .onAppear(perform: {
            
        })
        .scrollDismissesKeyboard(.immediately)
        .padding(.bottom, 50)
    }
}

// MARK: - Private Methods

private extension AddNoteContentView {
    
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

#Preview {
    AddNoteContentView(closeView: Binding<Bool>(get: { false }, set: { _ in })).environment(\.isPreview, true)
}
