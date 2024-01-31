//
//  AddNoteViewModel.swift
//  Notificator
//
//  Created by Lewis on 29.01.2024.
//

import SwiftUI

final class AddNoteViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var noteText: String = ""
    @Published var isDatePickerVisible = false
    @Published var isTimePickerVisible = false
    @Published var selectedDate = Date()
    @Published var selectedTime = Date()
    @Published var dateText = ""
    @Published var timeText = ""
    
    // MARK: - State Properties
    
    @State var placeholderText = "Notification"
    @State var defaultDateTimeButtonText = "Select"
    
    // MARK: - Private Properties
    
    private lazy var dateFormatter = DateFormatter()
    
    // MARK: - Public Methods
    
    func updateDateText(selectedDate: Date) {
        dateText = getDateString(from: selectedDate)
    }
    
    func updateTimeText(selectedTime: Date) {
        timeText = getTimeString(from: selectedTime)
    }
}

// MARK: - Private Methods

private extension AddNoteViewModel {
    
    func getDateString(from date: Date) -> String {
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func getTimeString(from date: Date) -> String {
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: date)
        return timeString
    }
}
