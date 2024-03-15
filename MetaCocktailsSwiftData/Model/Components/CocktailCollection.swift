//
//  CocktailCollection.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/15/24.
//

import Foundation

enum CocktailCollection: Int, Codable, Identifiable, CaseIterable {
    
    case all
    case deathAndCo
    case williamsAndGraham
    case originals 
    case milkAndHoney
    case custom
    
    var id: Int {
        rawValue
    }
    
    var collectionName: String {
        switch self {
        case .williamsAndGraham:
            "Williams & Graham"
        case .originals:
            "Original Cocktails"
        case .milkAndHoney:
            "Milk & Honey"
        case .custom:
            "Custom"
        case .all:
            "All"
        case .deathAndCo:
            "Death & Co."
        }
    }
}
