//
//  Styles.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

enum Style: String, Codable, CaseIterable {
    case sour          = "sour"
    case manhattan     = "manhattan"
    case oldFashioned  = "Old Fashioned"
    case spritz        = "Spritz"
    case swizzle       = "Swizzle"
    case negroni       = "Negroni"
    case martini       = "Martini"
    case fizz          = "Fizz"
    case collins       = "Collins"
    case tiki          = "Tiki"
    case julep         = "Julep"
    case flip          = "Flip"
    
    
    case built         = "Built"
    case stirred       = "Stirred"
    case shaken        = "Shaken"

}
