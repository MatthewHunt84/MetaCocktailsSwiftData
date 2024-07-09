//
//  CreateACocktailViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/26/24.
//

import SwiftUI
import Observation

@Observable final class AddCocktailViewModel {

    //AddIngredientView
    var isShowingingredientAlert: Bool = false
    var ingredientName = ""
    var category: Category = Category.agaves
    var ingredientAmount = 0.0
    var startingIngredientsHaveLoaded: Bool = false
    var ingredientTags = Tags()
    var prep: Prep? 
    var selectedMeasurementUnit = MeasurementUnit.fluidOunces
    var currentSelectedComponent = CocktailComponent(name: "Placeholder")
    var startingIngredients: [Ingredient] = []
    var addedIngredients: [Ingredient] = []
    var addedGarnish: [Garnish] = []
    var allPhysicalCocktailComponents: [CocktailComponent] = getAllPhysicalComponents()
    var isShowingAlert: Bool = false
    var dateAdded = Date()
    var defaultName = "Add Cocktail"
    var didChooseExistingIngredient: Bool = false
    var isCustomIngredient: Bool = false 
    
    // Required
    var cocktailName: String = ""
    var isShowingUniqueNameAlert: Bool = false
    
    // Ingredients
    var  formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    // Extras
    var uniqueGlasswareName: Glassware?
    var ice: Ice? = Ice.none
    var garnish: [Garnish]? = []
    var variation: Variation? = Variation.none
    
    //Ingredient recipe
    var prepIngredientRecipe: [Instruction] = []
    
    // Author
    var authorName: String = ""
    var authorPlace: String = ""
    var authorYear: String = ""
    var author: Author?
    // Build
    var build: Build = Build(instructions: [])
    var buildOption: Build?
    func validateBuildInstructions() {
        if build.instructions != [] {
            buildOption = build
        }
    }
    
    func clearData() {
        cocktailName = ""
        authorName = ""
        authorPlace = ""
        authorYear = ""
        uniqueGlasswareName = .blueBlazerMugs
        ice = Ice.none
        garnish = nil 
        addedGarnish = []
        variation = nil
        addedIngredients = []
        defaultName = "Add Cocktail"
        build = Build(instructions: [])
        buildOption = nil 
        startingIngredientsHaveLoaded = false
       
    }
    func clearIngredientData() {
        ingredientName = ""
        ingredientAmount = 0
        prep = nil
        selectedMeasurementUnit = .fluidOunces
        prep = nil
        prepIngredientRecipe = []
        didChooseExistingIngredient = false 
        isCustomIngredient = false
    }
    
    func validateCurrentSelectedComponent(for component: CocktailComponent) -> IngredientType {
       
        
        if component != CocktailComponent(name: "Placeholder") {
            if component.isSpirit {
                if let spirit = currentSelectedComponent.spiritCategory {
                    return spirit
                }
            } else if component.isNA {
                if let nA = currentSelectedComponent.nACategory {
                   return  nA
                }
            }
        }
        
        return IngredientType.seasoning(.nutmeg)
    }
    
    
    func isValid() -> Bool {
        return cocktailName != "" && ((addedIngredients.count) > 1) && uniqueGlasswareName != nil
    }
    
    func existingIngredientIsValid() -> Bool {
        
        return ingredientAmount != 0.0 && ingredientNameDoesExist() && didChooseExistingIngredient == true
    }
    func customIngredientIsValid() -> Bool {
        
        return ingredientName != "" && !ingredientNameDoesExist() && ingredientAmount != 0.0
    }
    // Can't add cocktail alert
    func ingredientNameDoesExist() -> Bool {
        let componentStrings = startingIngredients.map({$0.name})

        return componentStrings.contains(ingredientName)
    }
   
    
    func cantAddCocktailMessage() -> String {
        var text = ""
        
        if cocktailName == "" {
            text = "Your cocktail must have a name"
            if uniqueGlasswareName == nil {
                text += ", and a glass"
            }
        } else if uniqueGlasswareName == nil {
            text = "Select a glass"
        }
        if (addedIngredients.count) < 2 {
            if text == "" {
                text = "You must add at least two ingredients"
            } else {
                text += ", and at least two ingredients"
            }
        }
        return text
    }
    
    func customIngredientIsSpirit() -> Bool {
        if category == .agaves || category == .amari || category == .bitters || category == .brandies || category == .fortifiedWines || category == .gins || category == .liqueurs || category == .otherAlcohol || category == .rums || category == .vodkas || category == .whiskies || category == .wines {
            return true
        }
        
        return false
    }
    func customIngredientIsNA() -> Bool {
        if customIngredientIsSpirit() {
            return false
        }
        
        return true
    }
   

    func matchAllPhysicalCocktailComponents() {
        // if searchText is empty, don't show any results
        
        if ingredientName == "" {
            for component in allPhysicalCocktailComponents {
                component.matchesCurrentSearch = false
            }
            //self.objectWillChange.send()
            return
        }
        
        // if searchText has text, match it and set the viewModel properties accordingly
        for component in allPhysicalCocktailComponents {
            if component.name.localizedCaseInsensitiveContains(ingredientName) && ingredientName != "" {
                component.matchesCurrentSearch = true
            } else {
                component.matchesCurrentSearch = false
            }
        }

    }
    
    func matchAllIngredients(ingredients: [Ingredient]) -> [Ingredient] {
        for ingredient in ingredients {
            if ingredient.name.localizedCaseInsensitiveContains(ingredientName) && ingredientName != "" {
                ingredient.matchesCurrentSearch = true
            } else {
                ingredient.matchesCurrentSearch = false
            }
        }
        return ingredients.filter({ $0.matchesCurrentSearch == true})
    }
    
    func matchAllIngredients2(ingredients: [IngredientBase]) -> [IngredientBase] {
        
        guard !ingredientName.isEmpty else {
             return ingredients // Return all ingredients if search text is empty
         }
        
        let lowercasedSearchText = ingredientName.lowercased()
        
        return ingredients.filter { $0.name.lowercased().contains(lowercasedSearchText) }
            .sorted { lhs, rhs in
                let lhsLowercased = lhs.name.lowercased()
                let rhsLowercased = rhs.name.lowercased()
                
                // prioritize ingredients that start with the search text
                let lhsStartsWith = lhsLowercased.hasPrefix(ingredientName.lowercased())
                let rhsStartsWith = rhsLowercased.hasPrefix(ingredientName.lowercased())
                
                if lhsStartsWith && !rhsStartsWith {
                    return true
                } else if !lhsStartsWith && rhsStartsWith {
                    return false
                }
                
                // if two ingredients start with the same search text, prioritize the shortest one
                if lhsStartsWith && rhsStartsWith {
                    return lhs.name.count < rhs.name.count
                }
                
                // If neither starts with the search text, prioritize the one with the search text appearing first in the word
                let lhsRange = lhsLowercased.range(of: ingredientName.lowercased())
                let rhsRange = rhsLowercased.range(of: ingredientName.lowercased())
                
                let matchedArray = (lhsRange?.lowerBound ?? lhsLowercased.endIndex) < (rhsRange?.lowerBound ?? rhsLowercased.endIndex)
                
                return matchedArray
            }
    }
    
//    func getAllCocktailIngredients(cocktails: [Cocktail]) -> [Ingredient] {
//       
//        
//        let listOfIngredients = cocktails.map({$0.spec}).flatMap({$0}).sorted(by: {$0.name < $1.name})
//        let filteredList: [Ingredient] = {
//            var ingredients: [Ingredient] = []
//            var ingredientNamesOnly: [String] = []
//            for ingredient in listOfIngredients {
//                if !ingredientNamesOnly.contains(ingredient.name) {
//                    ingredients.append(ingredient)
//                    ingredientNamesOnly.append(ingredient.name)
//                }
//            }
//            return ingredients
//        }()
//        
//        return filteredList
//    }
    
     func dynamicallyChangeMeasurementUnit() {
         switch category {
            case .herbs:
                selectedMeasurementUnit = MeasurementUnit.gentlyMuddled
            case .fruit:
                selectedMeasurementUnit = MeasurementUnit.muddled
            case .seasoning:
                selectedMeasurementUnit = MeasurementUnit.drops
            case .wines:
                selectedMeasurementUnit = MeasurementUnit.fluidOunces
            case .bitters:
                selectedMeasurementUnit = MeasurementUnit.dashes
            default:
                selectedMeasurementUnit = MeasurementUnit.fluidOunces
            }
        }
    func dynamicallyChangeMeasurementOptionsBasedOnChosenCategory() -> [MeasurementUnit] {
        
        switch category {
        case .herbs:
            return [.gentlyMuddled, .muddled, .nitroMuddled, .grams, .none]
        case .fruit:
            return [.gentlyMuddled, .muddled, .grams, .sliceOf, .whole, .nitroMuddled, .none]
        case .seasoning:
            return [.pinch, .drops, .grams, .dashes, .barSpoon, .teaspoon, .tablespoon, .none]
        case .otherNonAlc:
            return MeasurementUnit.allCases
        default:
            return [.fluidOunces, .barSpoon, .dashes, .drops, .grams, .ml,  .sprays, .teaspoon, .tablespoon, .bottles, .none]
        }
    }
    
    static func getAllPhysicalComponents() -> [CocktailComponent] {
        var cocktailComponentArray = [CocktailComponent]()
        
        cocktailComponentArray.append(contentsOf: Syrup.allCases.map({ $0.nAComponent}))
        cocktailComponentArray.append(contentsOf: Juice.allCases.map({ $0.nAComponent}))
        cocktailComponentArray.append(contentsOf: Herbs.allCases.map({ $0.nAComponent}))
        cocktailComponentArray.append(contentsOf: Fruit.allCases.map({ $0.nAComponent}))
        cocktailComponentArray.append(contentsOf: Seasoning.allCases.map({ $0.nAComponent}))
        cocktailComponentArray.append(contentsOf: Soda.allCases.map({ $0.nAComponent}))
        cocktailComponentArray.append(contentsOf: OtherNA.allCases.map({ $0.nAComponent}))
        
        cocktailComponentArray.append(contentsOf: Agave.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: Brandy.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: Gin.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: OtherAlcohol.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: Rum.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: Vodka.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: Whiskey.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: Liqueur.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: FortifiedWine.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: Wine.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: Bitters.allCases.map { $0.cockTailComponent })
        cocktailComponentArray.append(contentsOf: Amaro.allCases.map { $0.cockTailComponent })
        
     
        
        return cocktailComponentArray
        
    }
    
 
    
    func validateAuthor() {
        if authorName != "" && authorYear != "" && authorPlace != "" {
            author = Author(person: authorName, place: authorYear, year: authorPlace)
        }
    }
    func validateGarnish() {
        if addedGarnish.count > 0 {
            garnish = addedGarnish
        }
    }
    
    
    

}

extension AddCocktailView {
    
    func nameIsUnique() -> Bool {
        
        let cocktailNames: [String] = cocktails.map({$0.cocktailName})
        
        if cocktailNames.allSatisfy({ $0 != viewModel.cocktailName}) {
            print("\(viewModel.cocktailName) in not in cocktail names.")
            return true
        } else {
            return false
        }
    }
    
}
