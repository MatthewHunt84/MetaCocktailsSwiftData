//
//  CBCFavoriteCocktailsVM.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//

import Foundation
import SwiftData


final class BatchedCocktailsViewModel: ObservableObject {
    
    var CBCFavoriteCocktailsArray: [BatchedCocktail] = []
   
    
}

@Model
final class BatchedCocktail  {
    var batchCocktailName: String = ""
    var dilutionPercentage: String = ""
    var dilutionType: String = ""
    var notes: String = ""
    
    @Relationship var batchCocktailIngredients: [BatchIngredient] = []
    
    init(batchCocktailName: String, dilutionPercentage: String, dilutionType: String, notes: String, batchCocktailIngredients: [BatchIngredient]) {
        self.batchCocktailName = batchCocktailName
        self.dilutionPercentage = dilutionPercentage
        self.dilutionType = dilutionType
        self.notes = notes
        self.batchCocktailIngredients = batchCocktailIngredients
    }
}

@Model
final class BatchIngredient {
   
    
    var name: String
    var amount: String
    var aBV: String
 
    
    init(name: String, amount: String, aBV: String) {
        self.name = name
        self.amount = amount
        self.aBV = aBV
    }
    

}
