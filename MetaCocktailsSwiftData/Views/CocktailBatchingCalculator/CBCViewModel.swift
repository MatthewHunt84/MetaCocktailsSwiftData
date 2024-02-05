//
//  CBCViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI

final class CBCViewModel: ObservableObject {
    
    @Published var cocktailNameText = ""
    @Published var notesText = ""
    @Published var numberOfCocktailsText = ""
    @Published var abvPercentage = "0"
    @Published var ingredientNameText = ""
    @Published var dilutionName = ""
    @Published var dilutionPercentage =  ""
    @Published var ingredientAmount = ""
    @Published var editedIngredientVolumeTextField = ""
    @Published var ingredients: [CBCIngredient] = []
    @Published var dilutionInfo: Dilution = Dilution(dilutionName: "", dilutionPercentage: "")
    
    func delete(at offsets: IndexSet){
        ingredients.remove(atOffsets: offsets)
    }
    func moveIngredients(from source: IndexSet, to destination: Int) {
        ingredients.move(fromOffsets: source, toOffset: destination)
    }
}

struct Dilution {
    var dilutionName: String
    var dilutionPercentage: String
}
