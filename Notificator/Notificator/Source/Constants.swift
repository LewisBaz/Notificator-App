//
//  Constants.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import Foundation

enum Constants {
    
    static var defaultColor = AppColorScheme.blue
    
    static let isPreview: Bool = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}
