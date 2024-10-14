//
//  HistoricSpec.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/13/24.
//

import Foundation

enum HistoricSpec: Codable {
    
    case algonquin
    
    var recommendedSpec: String {
        switch self {
        case .algonquin:
            "Algonquin (W&G Version)"
        }
    }
}
