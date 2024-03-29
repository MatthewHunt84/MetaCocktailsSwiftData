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
    
 
    
    ///CBCMainView variables
    @Published var cocktailNameText = ""
    @Published var dilutionPercentage = 25.0
    @Published var numberOfCocktailsText = 100.0
    //@Published var totalCocktailABVPercentage = 0.0
    @Published var loadedCocktailData: CBCLoadedCocktailData = CBCLoadedCocktailData(cocktailName: "Test", ingredients: [])
  
    ///Main batch view variables
    @Published var totalDilutionVolume = 0.0
    @Published var totalBatchVolume = 0.0
    @Published var quantifiedBatchedIngredients: [BatchedCellData] = []
    @Published var chosenCocktail: Cocktail = aFlightSouthOfTheBorder
    
    ///Split Batch View
    @Published var containerSize =  4000
    @Published var numberOfContainers = 2
    @Published var splitBatchData: [SplitBatchCellData] = []
    
    
    var  formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    


    func convertIngredientOzAmountIntoMls(for ingredient: Double) -> Double {
        return round((ingredient * 29.5735) * 1000) / 1000
    }
    func convertMlToOz(for ingredient: Int) -> Double {
       return round((Double(ingredient) / 29.5735) * 100) / 100.0
        
    }
    
    
    func convertIngredientsToBatchCellData()  {
        var quantifiableIngredients = [BatchedCellData]()
        var totalVolume = 0.0
        var ingredientVolume = 0.0
        for ingredient in loadedCocktailData.ingredients {
            
            if ingredient.isIncluded {
                
                var modifiedMeasurement = 0.0
                /// go through all the modified measurement units and calculate the difference to oz conversion to later be converted into mls.
                
                if ingredient.ingredient.unit == .barSpoon || ingredient.ingredient.unit == .barSpoons || ingredient.ingredient.unit == .teaspoon || ingredient.ingredient.unit == .teaspoons || ingredient.ingredient.unit == .bittersDeco || ingredient.ingredient.unit == .glassRinse || ingredient.ingredient.unit == .splash || ingredient.ingredient.unit == .spraysInGlass || ingredient.ingredient.unit == .spritzOnTop {
                    modifiedMeasurement = ingredient.ingredient.value * 0.17
                    ingredientVolume = Double(convertIngredientOzAmountIntoMls(for: modifiedMeasurement)) * numberOfCocktailsText
                } else if  ingredient.ingredient.unit == .dash || ingredient.ingredient.unit == .dashes || ingredient.ingredient.unit == .floatedDashes {
                    modifiedMeasurement = ingredient.ingredient.value * 0.09
                    ingredientVolume = Double(convertIngredientOzAmountIntoMls(for: modifiedMeasurement)) * numberOfCocktailsText
                } else if ingredient.ingredient.unit == .drops {
                    modifiedMeasurement = ingredient.ingredient.value * 0.0017
                    ingredientVolume = Double(convertIngredientOzAmountIntoMls(for: modifiedMeasurement)) * numberOfCocktailsText
                } else if ingredient.ingredient.unit == .bottles {
                    modifiedMeasurement = ingredient.ingredient.value * 25.36
                    ingredientVolume = Double(convertIngredientOzAmountIntoMls(for: modifiedMeasurement)) * numberOfCocktailsText
                } else {
                    ingredientVolume = Double(convertIngredientOzAmountIntoMls(for: ingredient.ingredient.value)) * numberOfCocktailsText
                }
                
                totalVolume += ingredientVolume
                quantifiableIngredients.append(BatchedCellData(ingredientName: ingredient.ingredient.ingredient.name,
                                                               whole1LBottles: (ingredientVolume / 1000).rounded(.down),
                                                               remaining1LMls: Int(ingredientVolume.truncatingRemainder(dividingBy: 1000)),
                                                               whole750mlBottles: (ingredientVolume / 750).rounded(.down),
                                                               remaining750mLs: Int(ingredientVolume.truncatingRemainder(dividingBy: 750)),
                                                               mlAmount: Int(convertIngredientOzAmountIntoMls(for: ingredient.ingredient.value)),
                                                               totalMls: Int(ingredientVolume) ))
            }
            
            
            
        }
        totalDilutionVolume = totalVolume * (dilutionPercentage / 100.0)
        totalBatchVolume = totalVolume + totalDilutionVolume
        numberOfContainers = Int(ceil(totalBatchVolume / (Double(containerSize) * 0.9)))
        quantifiedBatchedIngredients = quantifiableIngredients
        
    }
    func convertLoadedCocktail(for cocktail: Cocktail) {
        var newLoadedCocktailData = CBCLoadedCocktailData(cocktailName: cocktail.cocktailName, ingredients: [])
        for spec in cocktail.spec {
            if spec.ingredient.category != "Herbs" && spec.ingredient.category != "Fruit" && spec.unit != .whole {
                newLoadedCocktailData.ingredients.append(CBCLoadedIngredient(ingredient: spec, isIncluded: true))
            }
        }
        
        loadedCocktailData = newLoadedCocktailData
    }
    func doSplitBatchMath() {
        var splitData: [SplitBatchCellData] = []
        for ingredient in quantifiedBatchedIngredients {
            splitData.append(SplitBatchCellData(ingredientName: ingredient.ingredientName, splitIngredientAmount: Int(ingredient.totalMls / numberOfContainers)))
        }
        splitData.append(SplitBatchCellData(ingredientName: "Dilution", splitIngredientAmount: Int(totalDilutionVolume / Double(numberOfContainers))))
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
}

struct CBCLoadedCocktailData: Hashable, Equatable {
    static func == (lhs: CBCLoadedCocktailData, rhs: CBCLoadedCocktailData) -> Bool {
        return lhs.cocktailName == rhs.cocktailName
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(cocktailName)
    }
    var cocktailName: String
    var ingredients: [CBCLoadedIngredient]
    
}
struct CBCLoadedIngredient {
    var ingredient: CocktailIngredient
    var isIncluded: Bool
    
    
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
