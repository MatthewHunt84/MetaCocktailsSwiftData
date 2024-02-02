//
//  Styles.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

enum Style: String, Codable, CaseIterable {
    
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
    
    case sour          = "Sour"
    case daisy         = "Daisy"
    case spritz        = "Spritz"
    case swizzle       = "Swizzle"
    case tiki          = "Tiki"
    case toddy         = "Toddy"

}
