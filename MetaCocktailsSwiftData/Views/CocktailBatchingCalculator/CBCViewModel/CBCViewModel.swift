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
    @Published var editingBottleMathIngredient: BottleBatchedCellData?
    //@Published var totalCocktailABVPercentage = 0.0
    @Published var loadedCocktailData: CBCLoadedCocktailData = CBCLoadedCocktailData(cocktailName: "Test", ingredients: [])
    @Published var unitConversion: [MeasurementUnit: Double] = [
        .barSpoon: 0.17,
        .teaspoon: 0.17,
        .splash: 0.17,
        .dashes: 0.04,
        .sprays: 0.02,
        .drops: 0.0017,
        .bottles: 25.36,
        .oneLiterBottle: 33.814,
        .ml: 0.033814,
        .tablespoon: 0.5,
        .fluidOunces: 1.0
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
    @Published var groupedContainerSizes: [(label: String, volume: Int)] = []
    @Published var containerSizes: [(label: String, volume: Int)] = []
    
    var  formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    func makeDynamicContainerSizes() {
        containerSizes = []
        var size = 4000
        while getContainerCount(for: size) > 1 {
            let label = size == 19 ? "19 Liter (5 Gallon)" : "\(size / 1000) Liter"
            containerSizes.append((label: label, volume: size))
            size += 1000
        }
        
        let lastLabel = size == 19 ? "19 Liter (5 Gallon) +" : "\(size / 1000) Liter +"
        containerSizes.append((label: lastLabel, volume: size))
    }
    
    func groupContainerSizes() {
        
        makeDynamicContainerSizes()
        
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
                        let firstLiterAmount = first.volume / 1000
                        let lastLiterAmount = last.volume / 1000
                        
                        var label = ""
                        
                        if first.volume == 19000 {
                            label = "19 Liter (5 Gallon) - \(lastLiterAmount) Liter"
                        } else if last.volume == 19000 {
                            label = "\(firstLiterAmount) Liter - 19 Liter (5 Gallon)"
                        } else {
                            label = "\(firstLiterAmount) - \(lastLiterAmount) Liter"
                        }
                        if last.label.contains("+") {
                            label += " +"
                        }
                        
                        return (label: label, volume: first.volume)
                    }
                }
            }
                        //Theoretically, this will never get returned.
                         return (label: "Error", volume: 0)
        }
    }
    
    func findIndexForBottleMath() -> Int {
        if let editingIngredient = editingBottleMathIngredient {
            if let index = quantifiedBatchedIngredients.firstIndex(where: { $0.id == editingIngredient.id }) {
                return index
            }
        }
      return 0
    }
    func findIngredientOunceAmountFor(batchCellData: BottleBatchedCellData) -> Double {
        
        let initialIngredient =  chosenCocktail.spec.first(where: { $0.ingredientBase.name == batchCellData.ingredientName })
        if let foundIngredient = initialIngredient {
            return foundIngredient.value * numberOfCocktailsText
        }
        return 0.0
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
    func getIngredientMeasurement(for batchCellData: BottleBatchedCellData) -> (value: Double, unit: MeasurementUnit)? {
        if let foundIngredient = chosenCocktail.spec.first(where: { $0.ingredientBase.name == batchCellData.ingredientName }) {
            return (foundIngredient.value * numberOfCocktailsText, foundIngredient.unit)
        }
        return nil
    }

    func getActualFluidOunces(for batchCellData: BottleBatchedCellData) -> Double {
        return Double(batchCellData.totalMls) / mlToOzConversionFactor
    }
    
    func formatMeasurement(for batchCellData: BottleBatchedCellData, showAsFluidOunces: Bool = false) -> String {
        if showAsFluidOunces {
            let fluidOunces = Double(batchCellData.totalMls) / mlToOzConversionFactor
            return String(format: "%.2f oz", fluidOunces)
        } else {
            if let measurementInfo = getIngredientMeasurement(for: batchCellData) {
                let value = measurementInfo.value
                let unitLabel = measurementInfo.unit.rawValue
                
                if value.truncatingRemainder(dividingBy: 1) == 0 {
                    return "\(Int(value)) \(unitLabel)"
                } else {
                    return String(format: "%.2f %@", value, unitLabel)
                }
            }
            return "\(batchCellData.totalMls) ml"
        }
    }
    
    func convertIngredientsToBatchCellData() {
        var quantifiableIngredients = [BottleBatchedCellData]()
        var totalVolume = 0.0
        
        for ingredient in loadedCocktailData.ingredients {
            // Don't include non-liquid ingredients (since BottleBatchedCellData only applies to liquids)
            // TODO: Add dry ingredients to batch view
            if !determineIfLiquid(ingredientBase: ingredient.ingredient.ingredientBase) {
                continue
            }
            if ingredient.isIncluded {
                let conversionFactor = unitConversion[ingredient.ingredient.unit] ?? 1.0
                let modifiedMeasurement = ingredient.ingredient.value * conversionFactor
                let ingredientVolume = modifiedMeasurement.toMilliliters * numberOfCocktailsText
                totalVolume += ingredientVolume
                let existingIngredient = quantifiedBatchedIngredients.first { $0.ingredientName == ingredient.ingredient.ingredientBase.name }
                let bottleSize = existingIngredient?.bottleSize ?? 750
                let wholeBottles = Int(ingredientVolume / Double(bottleSize)) 
                let remainingMls = Int(ingredientVolume.truncatingRemainder(dividingBy: Double(bottleSize)))
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
    
    func determineIfLiquid(ingredientBase: IngredientBase) -> Bool {
        let umbrellaCategory = ingredientBase.umbrellaCategory
        let ingredientName = ingredientBase.name
        
        // For most categories, ingredients are liquid
        switch umbrellaCategory {
        case UmbrellaCategory.seasoning.rawValue:
            return Seasoning(rawValue: ingredientName)?.isLiquid ?? true
            
        case UmbrellaCategory.herbs.rawValue:
            return Herbs(rawValue: ingredientName)?.isLiquid ?? true
            
        case UmbrellaCategory.fruit.rawValue:
            return Fruit(rawValue: ingredientName)?.isLiquid ?? true
            
        case UmbrellaCategory.otherNonAlc.rawValue:
            return OtherNA(rawValue: ingredientName)?.isLiquid ?? true
            
        default:
            // All other umbrella categories are liquid by default
            return true
        }
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
            if UmbrellaCategory(rawValue: spec.ingredientBase.umbrellaCategory) != .herbs
                && UmbrellaCategory(rawValue: spec.ingredientBase.umbrellaCategory) != .fruit
                && spec.unit != .whole
                && spec.unit != .grams
                && spec.unit != .pinch {
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

let mlToOzConversionFactor = 29.5735
