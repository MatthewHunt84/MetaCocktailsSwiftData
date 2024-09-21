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
    @Published var loadedCocktailData: CBCLoadedCocktailData = CBCLoadedCocktailData(cocktailName: "Test", ingredients: [])
    
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
    @Published var groupedContainerSizes: [(label: String, volume: Int)] = []
    
    var  formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    func groupContainerSizes() {
        let containerSizes: [(label: String, volume: Int)] = [
            ("4 Liter", 4000),
            ("5 Liter", 5000),
            ("6 Liter", 6000),
            ("7 Liter", 7000),
            ("8 Liter", 8000),
            ("9 Liter", 9000),
            ("10 Liter", 10000),
            ("11 Liter", 11000),
            ("12 Liter", 12000),
            ("13 Liter", 13000),
            ("14 Liter", 14000),
            ("15 Liter", 15000),
            ("16 Liter", 16000),
            ("17 Liter", 17000),
            ("18 Liter", 18000),
            ("5 Gallon Bucket", 18927)
        ]
        
        var groups: [[(label: String, volume: Int)]] = []
        var currentGroup: [(label: String, volume: Int)] = []
        var containerCountForThePreviousSize = 0
        
        for size in containerSizes {
            let currentContainerCount = getContainerCount(for: size.volume)
            
            if currentContainerCount != containerCountForThePreviousSize && !currentGroup.isEmpty {
                groups.append(currentGroup)
                currentGroup = []
            }
            
            currentGroup.append(size)
            containerCountForThePreviousSize = currentContainerCount
        }
        if !currentGroup.isEmpty {
            groups.append(currentGroup)
        }
        groupedContainerSizes = groups.map { group in
            if group.count == 1 {
                return group[0]
            } else {
                if let first = group.first {
                    if let last = group.last {
                        var firstLabel = first.label
                        if last.label != "5 Gallon Bucket"{
                            firstLabel = first.label.replacingOccurrences(of: "Liter", with: "")
                        }
                        let label = "\(firstLabel) - \(last.label)"
                        return (label: label, volume: first.volume)
                    }
                }
            }
                //Theoretically, this will never get returned.
                return (label: "Error", volume: 0)
            
        }
    }
    
    private func getContainerCount(for size: Int) -> Int {
        let safeVolume = Double(size) * 0.9 // 90% of container size
        return Int(ceil(totalBatchVolume / safeVolume))
    }
    
    func updateContainerSize(newSize: Int) {
        containerSize = newSize
        if let label = groupedContainerSizes.first(where: { $0.volume == newSize })?.label {
            containerSizeLabel = label
        }
        convertIngredientsToBatchCellData()
        doSplitBatchMath()
    }
    
    
    func convertIngredientsToBatchCellData() {
        var quantifiableIngredients = [BottleBatchedCellData]()
        var totalVolume = 0.0
        
        // Conversion factors based on unit type
        let unitConversion: [MeasurementUnit: Double] = [
            .barSpoon: 0.17,
            .teaspoon: 0.17,
            .splash: 0.17,
            .dashes: 0.04,
            .sprays: 0.02,
            .drops: 0.0017,
            .bottles: 25.36
        ]
        
        for ingredient in loadedCocktailData.ingredients where ingredient.isIncluded {
            let conversionFactor = unitConversion[ingredient.ingredient.unit] ?? 1.0
            let modifiedMeasurement = ingredient.ingredient.value * conversionFactor
            let ingredientVolume = modifiedMeasurement.toMilliliters * numberOfCocktailsText
            
            
            totalVolume += ingredientVolume
            quantifiableIngredients.append(BottleBatchedCellData(ingredientName: ingredient.ingredient.ingredientBase.name,
                                                                 whole1LBottles: (ingredientVolume.rounded(.up) / 1000).rounded(.down),
                                                                 remaining1LMls: Int(ingredientVolume.rounded(.up).truncatingRemainder(dividingBy: 1000)),
                                                                 whole750mlBottles: (ingredientVolume.rounded(.up) / 750).rounded(.down),
                                                                 remaining750mLs: Int(ingredientVolume.rounded(.up).truncatingRemainder(dividingBy: 750)),
                                                                 mlAmount: modifiedMeasurement.toMilliliters,
                                                                 totalMls: Int(ingredientVolume.rounded(.up))))
            
            
        }
        totalDilutionVolume = totalVolume * (dilutionPercentage / 100.0)
        totalBatchVolume = totalVolume + totalDilutionVolume
        numberOfContainers = Int(ceil(totalBatchVolume / (Double(containerSize) * 0.9)))
        quantifiedBatchedIngredients = quantifiableIngredients
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

struct BottleBatchedCellData: Hashable, Equatable {
    var ingredientName: String
    var whole1LBottles: Double
    var remaining1LMls: Int
    var whole750mlBottles: Double
    var remaining750mLs: Int
    var mlAmount: Double
    var totalMls: Int
    
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
