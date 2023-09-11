//
//  Extensions.swift
//  MetaCocktails
//
//  Created by James on 8/15/23.
//

import SwiftUI

extension Color {
    
    static let oldBrandPrimaryBlue = Color("BrandPrimaryBlue")
    static let oldBrandPrimaryRed = Color("BrandPrimaryRed")
    static let oldBrandPrimaryPurple = Color("BrandPrimaryPurple")
    static let oldBrandPrimaryYellow = Color("BrandPrimaryYellow")
    static let oldBrandPrimaryOrange = Color("BrandPrimaryOrange")
    
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
