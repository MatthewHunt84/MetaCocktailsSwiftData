//
//  CocktailCollection.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/15/24.
//

import Foundation

enum CocktailCollection: Int, Codable {
    case williamsAndGraham
    case originals 
    case milkAndHoney
    case custom
    
    var collectionName: String {
        switch self {
        case .williamsAndGraham:
            "Williams & Graham"
        case .originals:
            "Origional Cocktails"
        case .milkAndHoney:
            "Milk & Honey"
        case .custom:
            "Custom"
        }
    }
}
