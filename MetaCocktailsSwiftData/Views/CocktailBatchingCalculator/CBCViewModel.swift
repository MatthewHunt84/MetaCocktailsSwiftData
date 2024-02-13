//
//  CBCViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI
import SwiftData
import Combine


final class CBCViewModel: ObservableObject {
 
    ///AddIngredientView variables
//    @Published var ingredientNameText = ""
//    @Published var ingredientAbvPercentage = 0.0
//    @Published var ingredientAmount = 0.0
    @Published var dilutionName = ""
    @Published var dilutionPercentage = 0.0
    @Published var cocktail: Cocktail = aFlightSouthOfTheBorder
    var  formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    ///CBCMainView variables
    @Published var cocktailNameText = ""
    //@Published var notesText = ""
    @Published var numberOfCocktailsText = 100.0
    @Published var totalCocktailABVPercentage = 0.0
    //@Published var editedIngredientVolumeTextField = 0.0
    //@Published var ingredients: [BatchIngredient] = []
    //@Published var didUpdateDilution: Bool = false
    //@Published var isShowingSwipeTip: Bool = true
    //@Published var editingSavedCocktail: Bool = false
  
    ///Main batch view variables
    @Published var totalDilutionVolume = 0.0
    @Published var totalBatchVolume = 0.0
    @Published var quantifiedBatchedIngredients: [BatchedCellData] = []
    
    ///Split Batch View
    @Published var containerSize =  4000
    @Published var numberOfContainers = 2
    @Published var splitBatchData: [SplitBatchCellData] = []
 
    
    
//    func delete(at offsets: IndexSet){
//        ingredients.remove(atOffsets: offsets)
//        calculateABV()
//    }
//    func moveIngredients(from source: IndexSet, to destination: Int) {
//        ingredients.move(fromOffsets: source, toOffset: destination)
//    }
//    func clearPageData() {
//       ingredients = []
//       notesText = ""
//       cocktailNameText = ""
//        numberOfCocktailsText = 0.0
//       dilutionName = ""
//        dilutionPercentage = 0.0
//        calculateABV()
//    }
//    func calculateABV() {
//        var totalVolumePreDilution = 0.0
//        var pureAlcoholVolume = 0.0
//        var dilutionPerCent = 0.0
//        /// The goal here is to divide the total amount of pure alcohol by the total volume and then multiply that by 100 to get the ABV.
//        ///  we fist check to see if there's any dilution. If there is, we convert it into a usable double for later.
//        if dilutionPercentage != 0 { dilutionPerCent = dilutionPercentage / 100 }
//        ///We start by converting multiplying all of the ingredient amounts by the ABV% to get the amount of pure alcohol.
//        ///Because we're working from text fields, we also have to convert those strings into doubles first.
//        for ingredient in self.ingredients {
//            totalVolumePreDilution += ingredient.amount
//            ///While the loop is happening, we're tallying up the total volume one ingredient at a time.
//            let abvPerCent = ingredient.aBV / 100
//            /// we convert the ABV string into a usable double. We then multiply the ingredient volume by the ABV% to get the amount of pure alcohol and add that to the pureAlcohol var total.
//            pureAlcoholVolume += ingredient.amount * abvPerCent
//        }
//        /// Multiply the dilution percentage by the totalVolumePREdilution by the dilution percent. Add that to the totalVolumePREdilution to get the Total Volume.
//        let abvPC = (pureAlcoholVolume / (totalVolumePreDilution + (totalVolumePreDilution * dilutionPerCent))) * 100
//        /// we divide the pure alcohol by the total volume and then multiply that by 100 to get the final ABV.
//        if abvPC > 0.0  {
//            totalCocktailABVPercentage = abvPC
//        } else {
//            totalCocktailABVPercentage = 0.0
//        }
//        ///Check to make sure there's a number there, if not, add a 0 so the prompt doesn't read "nan".
//    }
    func convertIngredientOzAmountIntoMls(for ingredient: Double) -> Int {
        return Int(ceil((ingredient) * 29.5735))
    }
    func convertMlToOz(for ingredient: Int) -> Double {
       return round((Double(ingredient) / 29.5735) * 100) / 100.0
        
    }
    
    
    func convertIngredientsToBatchCellData()  {
        var quantifiableIngredients = [BatchedCellData]()
        var totalVolume = 0.0
        for ingredient in cocktail.spec {
            if ingredient.ingredient.category != "Herbs" && ingredient.ingredient.category != "Fruit" {
                
                
                let ingredientVolume = Double(convertIngredientOzAmountIntoMls(for: ingredient.value)) * numberOfCocktailsText
                totalVolume += ingredientVolume
                quantifiableIngredients.append(BatchedCellData(ingredientName: ingredient.ingredient.name,
                                                               whole1LBottles: (ingredientVolume / 1000).rounded(.down),
                                                               remaining1LMls: Int(ingredientVolume.truncatingRemainder(dividingBy: 1000)),
                                                               whole750mlBottles: (ingredientVolume / 750).rounded(.down),
                                                               remaining750mLs: Int(ingredientVolume.truncatingRemainder(dividingBy: 750)),
                                                               mlAmount: convertIngredientOzAmountIntoMls(for: ingredient.value),
                                                               totalMls: Int(ingredientVolume) ))
            }
            
        }
        totalDilutionVolume = totalVolume * (dilutionPercentage / 100.0)
        totalBatchVolume = totalVolume + totalDilutionVolume
        numberOfContainers = Int(ceil(totalBatchVolume / (Double(containerSize) * 0.9)))
        quantifiedBatchedIngredients = quantifiableIngredients
        
    }
    func doSplitBatchMath() {
        var splitData: [SplitBatchCellData] = []
        for ingredient in quantifiedBatchedIngredients {
            splitData.append(SplitBatchCellData(ingredientName: ingredient.ingredientName, splitIngredientAmount: Int(ingredient.totalMls / numberOfContainers)))
        }
        splitData.append(SplitBatchCellData(ingredientName: dilutionName, splitIngredientAmount: Int(totalDilutionVolume / Double(numberOfContainers))))
        splitBatchData = splitData
    
    }
    func doMathForModified1LBottleCount(initialAmount: Double, newQuantityAmount: Double) {
        numberOfCocktailsText = (newQuantityAmount * 1000) / initialAmount
        convertIngredientsToBatchCellData()
    }
    func doMathForModified750mlBottleCount(initialAmount: Double, newQuantityAmount: Double) {
        numberOfCocktailsText = (newQuantityAmount * 750) / initialAmount
        convertIngredientsToBatchCellData()
    }
    
//    func appendCorrectIngredient(for savedBatch: BatchedCocktail, _ toggle: IngredientOrDilution, _ mlOrOz: MlsOrOunces, _ newDilutionName: String, _ newDilutionAmount: Double) {
//        if editingSavedCocktail == true {
//            if toggle == .ingredient {
//                if mlOrOz == .ounces {
//                    savedBatch.batchCocktailIngredients.append(BatchIngredient(name: ingredientNameText, amount: ingredientAmount, aBV: ingredientAbvPercentage))
//                } else {
//                    savedBatch.batchCocktailIngredients.append(BatchIngredient(name: ingredientNameText, amount: convertMlToOz(for: Int(ingredientAmount)), aBV: ingredientAbvPercentage))
//                }
//            } else {
//                savedBatch.dilutionType = newDilutionName
//                savedBatch.dilutionPercentage = newDilutionAmount
//            }
//        } else {
//            if toggle == .ingredient {
//                if mlOrOz == .ounces {
//                    ingredients.append(BatchIngredient(name: ingredientNameText, amount: ingredientAmount, aBV: ingredientAbvPercentage))
//                } else {
//                    ingredients.append(BatchIngredient(name: ingredientNameText, amount: convertMlToOz(for: Int(truncating: ingredientAmount as NSNumber)) , aBV: ingredientAbvPercentage))
//                }
//            } else {
//                dilutionName = newDilutionName
//                dilutionPercentage = newDilutionAmount
//            }
//        }
//        ingredientNameText = ""
//        ingredientAmount = 0.0
//        ingredientAbvPercentage = 0.0
//    }
    
    
   
    
}

struct BatchedCellData: Hashable, Equatable {
    static func == (lhs: BatchedCellData, rhs: BatchedCellData) -> Bool {
        return lhs.ingredientName == rhs.ingredientName
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredientName)
    }
    
    var ingredientName: String
    var whole1LBottles: Double
    var remaining1LMls: Int
    var whole750mlBottles: Double
    var remaining750mLs: Int
    var mlAmount: Int
    var totalMls: Int
}


struct SplitBatchCellData: Hashable, Equatable {
    static func == (lhs: SplitBatchCellData, rhs: SplitBatchCellData) -> Bool {
        return lhs.ingredientName == rhs.ingredientName
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredientName)
    }
    var ingredientName: String
    var splitIngredientAmount: Int
    
    
}
