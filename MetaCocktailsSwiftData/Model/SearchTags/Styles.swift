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
    case collins       = "Collins"
    case fizz          = "Fizz"
    case flip          = "Flip"
    case julep         = "Julep"
    case manhattan     = "Manhattan"
    case oldFashioned  = "Old Fashioned"
    case martini       = "Martini"
    case negroni       = "Negroni"
    case nonAlcoholic  = "Non-Alcoholic"
    case sour          = "Sour"
    case daisy         = "Daisy"
    case punch         = "Punch"
    case spritz        = "Spritz"
    case swizzle       = "Swizzle"
    case tiki          = "Tiki"
    case toddy         = "Toddy"

}
