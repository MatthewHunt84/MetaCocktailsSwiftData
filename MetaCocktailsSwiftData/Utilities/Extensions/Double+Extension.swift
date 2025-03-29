//
//  Double+Extension.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/27/24.
//

import SwiftUI

extension Double {
    
    var toMilliliters: Double {
        return self * mlToOzConversionFactor
    }
    
    var toOunces: Double {
        return self / mlToOzConversionFactor
    }
    
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

