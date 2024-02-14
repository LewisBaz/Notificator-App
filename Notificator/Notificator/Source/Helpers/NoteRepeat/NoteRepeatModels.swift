//
//  NoteRepeatModels.swift
//  Notificator
//
//  Created by Lewis on 01.02.2024.
//

import Foundation

protocol NoteRepeating {
    var type: NoteRepeatType {get}
    var name: String {get}
    var isSelected: Bool {get set}
}

protocol NoteRepeatMaker {
    func make() -> NoteRepeating
}

struct NeverRepeatNote: NoteRepeating {
    var type: NoteRepeatType = .never
    var name: String = "Never"
    var isSelected: Bool = true
}

struct ByHourRepeatNote: NoteRepeating {
    var type: NoteRepeatType = .byHour
    var name: String = "By hour"
    var isSelected: Bool = false
}

struct ByDayRepeatNote: NoteRepeating {
    var type: NoteRepeatType = .byDay
    var name: String = "By day"
    var isSelected: Bool = false
}

struct ByWeekRepeatNote: NoteRepeating {
    var type: NoteRepeatType = .byWeek
    var name: String = "By week"
    var isSelected: Bool = false
}

struct ByCoupleWeeksRepeatNote: NoteRepeating {
    var type: NoteRepeatType = .byCoupleWeeks
    var name: String = "By couple weeks"
    var isSelected: Bool = false
}

struct ByMonthRepeatNote: NoteRepeating {
    var type: NoteRepeatType = .byMonth
    var name: String = "By month"
    var isSelected: Bool = false
}

struct ByThreeMonthsRepeatNote: NoteRepeating {
    var type: NoteRepeatType = .byThreeMonths
    var name: String = "By 3 months"
    var isSelected: Bool = false
}

struct BySixMonthsRepeatNote: NoteRepeating {
    var type: NoteRepeatType = .bySixMonths
    var name: String = "By 6 months"
    var isSelected: Bool = false
}

struct ByYearRepeatNote: NoteRepeating {
    var type: NoteRepeatType = .byYear
    var name: String = "By year"
    var isSelected: Bool = false
}
