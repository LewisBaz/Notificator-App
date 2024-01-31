//
//  ColorSchemeModel.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import SwiftUI

struct ColorSchemeModel {
    let id: AppColorScheme
    let main: ColorCode
    let accent: ColorCode
    let secondary: ColorCode
}

struct ColorCode {
    let red: Int
    let green: Int
    let blue: Int
    
    func getColor() -> Color {
        return RGBColor.rgb(red, green, blue)
    }
}
