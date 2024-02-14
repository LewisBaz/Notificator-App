//
//  NoteRepeatType.swift
//  Notificator
//
//  Created by Lewis on 01.02.2024.
//

import Foundation

enum NoteRepeatType: NoteRepeatMaker, CaseIterable {
    case never
    case byHour
    case byDay
    case byWeek
    case byCoupleWeeks
    case byMonth
    case byThreeMonths
    case bySixMonths
    case byYear
    
    func make() -> NoteRepeating {
        switch self {
        case .never:
            NeverRepeatNote()
        case .byHour:
            ByHourRepeatNote()
        case .byDay:
            ByDayRepeatNote()
        case .byWeek:
            ByWeekRepeatNote()
        case .byCoupleWeeks:
            ByCoupleWeeksRepeatNote()
        case .byMonth:
            ByMonthRepeatNote()
        case .byThreeMonths:
            ByThreeMonthsRepeatNote()
        case .bySixMonths:
            BySixMonthsRepeatNote()
        case .byYear:
            ByYearRepeatNote()
        }
    }
}
