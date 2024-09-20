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
    @Published var dilutionPercentage = 25.0
    @Published var numberOfCocktailsText: Double = 100.0
    @Published var isShowingBottleMathMode: Bool = false
    @Published var editingIngredient: String?
    @Published var numberOfBottlesText: String?
    @Published var sizeOfTheBottle: String?
    //@Published var totalCocktailABVPercentage = 0.0
    @Published var loadedCocktailData: CBCLoadedCocktailData = CBCLoadedCocktailData(cocktailName: "Test", ingredients: [])
    @Published var unitConversion: [MeasurementUnit: Double] = [
        .barSpoon: 0.17,
        .teaspoon: 0.17,
        .splash: 0.17,
        .dashes: 0.04,
        .sprays: 0.02,
        .drops: 0.0017,
        .bottles: 25.36
    ]
    
    ///Main batch view variables
    @Published var totalDilutionVolume = 0.0
    @Published var totalBatchVolume = 0.0
    @Published var quantifiedBatchedIngredients: [BottleBatchedCellData] = []
    @Published var chosenCocktail: Cocktail = DummyCocktails.randomCocktail()
    
    ///Split Batch View
    @Published var containerSize =  4000
    @Published var numberOfContainers = 2
    @Published var splitBatchData: [SplitBatchCellData] = []
    @Published var containerSizeLabel = "4 Liter"
    
    var  formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    func convertIngredientsToBatchCellData() {
        var quantifiableIngredients = [BottleBatchedCellData]()
        var totalVolume = 0.0
        
        
        for ingredient in loadedCocktailData.ingredients {
            if ingredient.isIncluded {
                let conversionFactor = unitConversion[ingredient.ingredient.unit] ?? 1.0
                let modifiedMeasurement = ingredient.ingredient.value * conversionFactor
                let ingredientVolume = modifiedMeasurement.toMilliliters * numberOfCocktailsText
                totalVolume += ingredientVolume
                let existingIngredient = quantifiedBatchedIngredients.first { $0.ingredientName == ingredient.ingredient.ingredientBase.name }
                let bottleSize = existingIngredient?.bottleSize ?? 750
                let wholeBottles = Int(ingredientVolume / Double(bottleSize))
                let remainingMls = Int(ingredientVolume.truncatingRemainder(dividingBy: Double(bottleSize)))
//                print("\(ingredient.ingredient.ingredientBase.name) needs \(wholeBottles) bottles and has \(remainingMls) remaining mls.")
                quantifiableIngredients.append(BottleBatchedCellData(
                    id: existingIngredient?.id ?? UUID(),
                    ingredientName: ingredient.ingredient.ingredientBase.name,
                    bottleSize: bottleSize,
                    wholeBottles: wholeBottles,
                    remainingMls: remainingMls,
                    mlAmount: modifiedMeasurement.toMilliliters,
                    totalMls: Int(ingredientVolume.rounded(.up))
                ))
            }
        }
        
        totalDilutionVolume = totalVolume * (dilutionPercentage / 100.0)
        totalBatchVolume = totalVolume + totalDilutionVolume
        numberOfContainers = Int(ceil(totalBatchVolume / (Double(containerSize) * 0.9)))
        
        // recalculate bottle sizes and remaining mls
        for (index, ingredient) in quantifiableIngredients.enumerated() {
            if let existingIngredient = quantifiedBatchedIngredients.first(where: { $0.ingredientName == ingredient.ingredientName }) {
                quantifiableIngredients[index].bottleSize = existingIngredient.bottleSize
                let totalMls = quantifiableIngredients[index].totalMls
                quantifiableIngredients[index].wholeBottles = totalMls / existingIngredient.bottleSize
                quantifiableIngredients[index].remainingMls = totalMls % existingIngredient.bottleSize
            }
        }
        quantifiedBatchedIngredients = quantifiableIngredients
    }
    
    
    func updateIngredientAmount(ingredientName: String, newAmount: Int, newBottleSize: Int) {
        if let index = quantifiedBatchedIngredients.firstIndex(where: { $0.ingredientName == ingredientName }) {
            let oldAmount = quantifiedBatchedIngredients[index].totalMls
            let ratio = Double(newAmount) / Double(oldAmount)
            numberOfCocktailsText *= ratio
            quantifiedBatchedIngredients[index].totalMls = newAmount
            quantifiedBatchedIngredients[index].bottleSize = newBottleSize
            quantifiedBatchedIngredients[index].wholeBottles = newAmount / newBottleSize
            quantifiedBatchedIngredients[index].remainingMls = newAmount % newBottleSize
            convertIngredientsToBatchCellData()
        }
    }
    
    func doMathForModified1LBottleCount(initialAmount: Double, newQuantityAmount: Double) {
        
        numberOfCocktailsText = ((newQuantityAmount * 1000) / initialAmount)
        convertIngredientsToBatchCellData()
        
    }
    
    func doMathForModified750mlBottleCount(initialAmount: Double, newQuantityAmount: Double) {
        
        numberOfCocktailsText = ((newQuantityAmount * 750) / initialAmount)
        convertIngredientsToBatchCellData()
        
    }
    
    func convertLoadedCocktail(for cocktail: Cocktail) {
        var newLoadedCocktailData = CBCLoadedCocktailData(cocktailName: cocktail.cocktailName, ingredients: [])
        for spec in cocktail.spec {
            if UmbrellaCategory(rawValue: spec.ingredientBase.umbrellaCategory) != .herbs && UmbrellaCategory(rawValue: spec.ingredientBase.umbrellaCategory) != .fruit && spec.unit != .whole {
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
        splitData.append(SplitBatchCellData(ingredientName: "Dilution", splitIngredientAmount: (Int(totalDilutionVolume) / numberOfContainers)))
        splitBatchData = splitData
        
    }
    func updateEditingIngredient(name: String) {
        editingIngredient = name
    }
    
    
    func finishEditing() {
        if let editing = editingIngredient {
            if let index = quantifiedBatchedIngredients.firstIndex(where: { $0.ingredientName == editing }) {
                if let newValue = Int(quantifiedBatchedIngredients[index].editedTotalMls) {
                    
                    let currentBottleSize = quantifiedBatchedIngredients[index].bottleSize
                    updateIngredientAmount(ingredientName: editing, newAmount: newValue, newBottleSize: currentBottleSize)
                }
            }
        }
        editingIngredient = nil
    }
}

struct CBCLoadedCocktailData: Hashable, Equatable {
    var cocktailName: String
    var ingredients: [CBCLoadedIngredient]
    
    static func == (lhs: CBCLoadedCocktailData, rhs: CBCLoadedCocktailData) -> Bool {
        return lhs.cocktailName == rhs.cocktailName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(cocktailName)
    }
    
}
struct CBCLoadedIngredient {
    var ingredient: Ingredient
    var isIncluded: Bool
}

struct BottleBatchedCellData: Hashable, Equatable, Identifiable {
    let id: UUID
    var ingredientName: String
    var bottleSize: Int
    var wholeBottles: Int
    var remainingMls: Int
    var mlAmount: Double
    var totalMls: Int
    var editedTotalMls: String = ""
    
    init(id: UUID = UUID(), ingredientName: String, bottleSize: Int, wholeBottles: Int, remainingMls: Int, mlAmount: Double, totalMls: Int) {
        self.id = id
        self.ingredientName = ingredientName
        self.bottleSize = bottleSize
        self.wholeBottles = wholeBottles
        self.remainingMls = remainingMls
        self.mlAmount = mlAmount
        self.totalMls = totalMls
    }
    
    static func == (lhs: BottleBatchedCellData, rhs: BottleBatchedCellData) -> Bool {
        return lhs.ingredientName == rhs.ingredientName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredientName)
    }
}

struct SimpleBatchedCellData: Hashable, Equatable {
    var ingredientName: String
    var totalMls: Int
    
    static func == (lhs: SimpleBatchedCellData, rhs: SimpleBatchedCellData) -> Bool {
        return lhs.ingredientName == rhs.ingredientName
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredientName)
    }
}


struct SplitBatchCellData: Hashable, Equatable {
    var ingredientName: String
    var splitIngredientAmount: Int
    
    static func == (lhs: SplitBatchCellData, rhs: SplitBatchCellData) -> Bool {
        return lhs.ingredientName == rhs.ingredientName
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredientName)
    }
}

extension String {
    func addingMls() -> String {
        return self + " mls"
    }
}
