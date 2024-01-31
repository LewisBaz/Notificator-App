//
//  TabBarItem.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import TabBar

enum TabBarItem: Int, Tabbable {
    case list
    case add
    case settings
    
    var icon: String {
        switch self {
        case .list:
            return "list.bullet"
        case .add:
            return "plus"
        case .settings:
            return "gear"
        }
    }
    
    var title: String {
        switch self {
        case .list:
            return "List"
        case .add:
            return "Add"
        case .settings:
            return "Settings"
        }
    }
}
