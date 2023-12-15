//
//  HideKeyboard.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 28.02.23.
//

import Foundation
import SwiftUI


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif





