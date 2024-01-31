//
//  EnvironmentValuesExtensions.swift
//  Notificator
//
//  Created by Lewis on 30.01.2024.
//

import SwiftUI

private struct IsPreviewKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    var isPreview: Bool {
        get { self[IsPreviewKey.self] }
        set { self[IsPreviewKey.self] = newValue }
    }
}
