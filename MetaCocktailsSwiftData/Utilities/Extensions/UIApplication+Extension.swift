//
//  UIApplication+Extension.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/27/24.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
