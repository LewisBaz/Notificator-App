//
//  ViewExtensions.swift
//  Notificator
//
//  Created by Lewis on 30.01.2024.
//

import SwiftUI

extension View {
    
    func hideKeyboardWhenTappedAround() -> some View  {
        return self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                  to: nil, from: nil, for: nil)
        }
    }
}
