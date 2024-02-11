//
//  CBCViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI
import SwiftData


final class CBCViewModel: ObservableObject {
 
    ///AddIngredientView variables
    @Published var ingredientNameText = ""
    @Published var ingredientAbvPercentage = ""
    @Published var ingredientAmount = ""
    @Published var dilutionName = ""
    @Published var dilutionPercentage = "0"
    
    ///CBCMainView variables
    @Published var cocktailNameText = ""
    @Published var notesText = ""
    @Published var numberOfCocktailsText = "1"
    @Published var totalCocktailABVPercentage = ""
    @Published var editedIngredientVolumeTextField = ""
    @Published var ingredients: [BatchIngredient] = []
    @Published var didUpdateDilution: Bool = false
    @Published var isShowingSwipeTip: Bool = true
    @Published var editingSavedCocktail: Bool = false
    
    ///Main batch view variables
    @Published var totalDilutionVolume = 0.0
    @Published var totalBatchVolume = 0.0
    @Published var quantifiedBatchedIngredients: [BatchedCellData] = []
    
    
   
    
    func delete(at offsets: IndexSet){
        ingredients.remove(atOffsets: offsets)
        calculateABV()
    }
    func moveIngredients(from source: IndexSet, to destination: Int) {
        ingredients.move(fromOffsets: source, toOffset: destination)
    }
    func clearPageData() {
       ingredients = []
       notesText = ""
       cocktailNameText = ""
       numberOfCocktailsText = ""
       dilutionName = ""
       dilutionPercentage = ""
        calculateABV()
    }
    func calculateABV() {
        var totalVolumePreDilution = 0.0
        var pureAlcoholVolume = 0.0
        var dilutionPerCent = 0.0
        /// The goal here is to divide the total amount of pure alcohol by the total volume and then multiply that by 100 to get the ABV.
        ///  we fist check to see if there's any dilution. If there is, we convert it into a usable double for later.
        if dilutionPercentage != "" { dilutionPerCent = (Double(dilutionPercentage) ?? 0.0) / 100 }
        ///We start by converting multiplying all of the ingredient amounts by the ABV% to get the amount of pure alcohol.
        ///Because we're working from text fields, we also have to convert those strings into doubles first.
        for ingredient in self.ingredients {
            totalVolumePreDilution += Double(ingredient.amount) ?? 0.0
            ///While the loop is happening, we're tallying up the total volume one ingredient at a time.
            let abvPerCent = (Double(ingredient.aBV) ?? 0.0) / 100
            /// we convert the ABV string into a usable double. We then multiply the ingredient volume by the ABV% to get the amount of pure alcohol and add that to the pureAlcohol var total.
            pureAlcoholVolume += (Double(ingredient.amount) ?? 0.0) * abvPerCent
        }
        /// Multiply the dilution percentage by the totalVolumePREdilution by the dilution percent. Add that to the totalVolumePREdilution to get the Total Volume.
        let abvPC = (pureAlcoholVolume / (totalVolumePreDilution + (totalVolumePreDilution * dilutionPerCent))) * 100
        /// we divide the pure alcohol by the total volume and then multiply that by 100 to get the final ABV.
        if abvPC > 0.0  {
            totalCocktailABVPercentage = String(format: "%.2f", abvPC)
        } else {
            totalCocktailABVPercentage = "0"
        }
        ///Check to make sure there's a number there, if not, add a 0 so the prompt doesn't read "nan".
    }
    func convertIngredientOzAmountIntoMls(for ingredient: BatchIngredient) -> String {
        return String(Int(ceil((Double(ingredient.amount) ?? 0.0) * 29.5735)))
    }
    func convertMlToOz(for ingredient: String) -> String {
        return String((Double(ingredient) ?? 0.0) / 29.5735)
    }
    
    
    func convertIngredientsToBatchCellData()  {
        var quantifiableIngredients = [BatchedCellData]()
        var totalVolume = 0.0
        let numberOfCocktailsDouble = Double(numberOfCocktailsText) ?? 0.0
        for ingredient in ingredients {
            let ingredientVolume = (Double(convertIngredientOzAmountIntoMls(for: ingredient)) ?? 0.0) * numberOfCocktailsDouble
            totalVolume += ingredientVolume
            quantifiableIngredients.append(BatchedCellData(ingredientName: ingredient.name,
                                                           whole1LBottles: String(Int((ingredientVolume / 1000).rounded(.down))),
                                                           remaining1LMls: String(Int(ingredientVolume.truncatingRemainder(dividingBy: 1000))),
                                                           whole750mlBottles: String(Int((ingredientVolume / 750).rounded(.down))),
                                                           remaining750mLs: String(Int(ingredientVolume.truncatingRemainder(dividingBy: 750))),
                                                           mlAmount: ingredient.amount))
        }
        totalDilutionVolume = totalVolume * ((Double(dilutionPercentage) ?? 0.0) / 100.0)
        totalBatchVolume = totalVolume + totalDilutionVolume
        quantifiedBatchedIngredients = quantifiableIngredients
        
    }
    
}

struct BatchedCellData: Hashable, Equatable {
    static func == (lhs: BatchedCellData, rhs: BatchedCellData) -> Bool {
        return lhs.ingredientName == rhs.ingredientName
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredientName)
    }
    
    var ingredientName: String
    var whole1LBottles: String
    var remaining1LMls: String
    var whole750mlBottles: String
    var remaining750mLs: String
    var mlAmount: String
}



