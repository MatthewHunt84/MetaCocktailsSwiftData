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
    @Published var dilutionPercentage = ""
    
    ///CBCMainView variables
    @Published var cocktailNameText = ""
    @Published var notesText = ""
    @Published var numberOfCocktailsText = ""
    @Published var totalCocktailABVPercentage = ""
    @Published var editedIngredientVolumeTextField = ""
    @Published var ingredients: [BatchIngredient] = []
    @Published var didUpdateDilution: Bool = false
    @Published var isShowingSwipeTip: Bool = true
    
    ///Main batch view variables
    @Published var totalDilutionVolume = 0.0
    @Published var totalBatchVolume = 0.0
    @Published var batchedCellDataArray: [BatchedCellData] = []
    
    
   
    
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
    
    func do1LBatchMath() {
        var numberOfCocktailsDouble = Double(numberOfCocktailsText) ?? 0.0
        var quantityIngredients = convertIngredientsToBatchCellData()
//        for ingredient in quantityIngredients {
//            let oneLQuantities = oneLiterMath(ingredientVolume: ingredient.mlAmount)
//            ingredient.wholeBottles = oneLQuantities.oneLiterCount
//            ingredient.remainingMls = oneLQuantities.remainingLiterMls
//        }
        
        
        
    }
    func convertIngredientsToBatchCellData() -> [BatchedCellData] {
        var quantifiableIngredients = [BatchedCellData]()
        for ingredient in ingredients {
            quantifiableIngredients.append(BatchedCellData(ingredientName: ingredient.name,
                                                           wholeBottles: 0,
                                                           remainingMls: 0,
                                                           mlAmount: Int(ingredient.amount) ?? 0))
        }
        return quantifiableIngredients
        
    }
    
    func oneLiterMath(ingredientVolume: Int ) -> (oneLiterCount: Int, remainingLiterMls: Int) {
        var oneLiterCount = 0
        var remainingLiterMls = ingredientVolume
        
        while remainingLiterMls > 999 {
            oneLiterCount += 1
            remainingLiterMls -= 1000
        }
        return (oneLiterCount, remainingLiterMls)
    }
    
    func sevenFiftymLMath(ingredientVolume: Int ) -> (whole750sCount: Int, remaining750Mls: Int) {
        var whole750sCount = 0
        var remaining750Mls = ingredientVolume
        
        while remaining750Mls > 749 {
            whole750sCount += 1
            remaining750Mls -= 750
        }
        return (whole750sCount, remaining750Mls)
    }
    
    
}

struct BatchedCellData {
    
    var ingredientName = ""
    var wholeBottles = 0
    var remainingMls = 0
    var mlAmount =  0
}



