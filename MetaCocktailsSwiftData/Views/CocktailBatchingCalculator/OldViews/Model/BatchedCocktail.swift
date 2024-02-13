//
//  BatchedCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/10/24.
//


import Foundation
import SwiftData


@Model
final class BatchedCocktail  {
    var batchCocktailName: String = ""
    var dilutionPercentage: Double = 0.0
    var dilutionType: String = ""
    var notes: String = ""
    
    var batchCocktailIngredients: [BatchIngredient] = []
    
    init(batchCocktailName: String, dilutionPercentage: Double, dilutionType: String, notes: String, batchCocktailIngredients: [BatchIngredient]) {
        self.batchCocktailName = batchCocktailName
        self.dilutionPercentage = dilutionPercentage
        self.dilutionType = dilutionType
        self.notes = notes
        self.batchCocktailIngredients = batchCocktailIngredients
    }
}


struct BatchIngredient: Codable, Hashable {
   
    
    var name: String
    var amount: Double
    var aBV: Double

}
