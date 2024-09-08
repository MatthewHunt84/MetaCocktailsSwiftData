//
//  Styles.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

enum Style: String, Codable, CaseIterable, Comparable {
    static func < (lhs: Style, rhs: Style) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    
    case shaken        = "Shaken"
    case stirred       = "Stirred"
    
    case blended       = "Blended"
    case built         = "Built"
    case collins       = "Collins Variation"
    case fizz          = "Fizz Variation"
    case flip          = "Flip Variation"
    case julep         = "Julep Variation"
    case manhattan     = "Manhattan Variation"
    case oldFashioned  = "Old Fashioned Variation"
    case martini       = "Martini Variation"
    case negroni       = "Negroni Variation"
    case nonAlcoholic  = "Non-Alcoholic"
    case sour          = "Sour Variation"
    case daisy         = "Daisy Variation"
    case punch         = "Punch"
    case spritz        = "Spritz Variation"
    case swizzle       = "Swizzle Variation"
    case tiki          = "Tiki Variation"
    case toddy         = "Toddy Variation"

}
