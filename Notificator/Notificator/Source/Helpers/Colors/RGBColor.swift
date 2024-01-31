//
//  RGBColor.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import SwiftUI

struct RGBColor {
    
    static func rgb(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int = 1) -> Color {
        return Color(red: Double(red) / 255, green: Double(green) / 255, blue: Double(blue) / 255)
    }
}
