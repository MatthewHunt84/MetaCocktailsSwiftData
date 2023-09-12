//
//  Extensions.swift
//  MetaCocktails
//
//  Created by James on 8/15/23.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
