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
    var ingredientAmount = 0.0
    var ingredientType: IngredientType = IngredientType.agaves(.tequilaAny)
    var selectedMeasurementUnit = MeasurementUnit.fluidOunces
    var currentSelectedComponent = CocktailComponent(name: "Placeholder")
    var addedIngredients: [CocktailIngredient] = []
    var addedGarnish: [Garnish] = []
    var allPhysicalCocktailComponents: [CocktailComponent] = getAllPhysicalComponents()

    var defaultName = "Add Cocktail"

    var cocktailName: String = ""
    var isShowingUniqueNameAlert: Bool = false
    var  formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    var glass: Glassware?
    var ice: Ice? = .none
    var garnish: [Garnish]?
    var variation: Variation?

    var authorName: String = ""
    var authorPlace: String = ""
    var authorYear: String = ""
    var author: Author?

    var build: Build = Build(instructions: [])
    var buildOption: Build?
    var isShowingAlert: Bool = false
    
    func clearData() {
        cocktailName = ""
        authorName = ""
        authorPlace = ""
        authorYear = ""
        glass = nil
        ice = .none
        garnish = nil
        variation = nil
        addedIngredients = []
        defaultName = "Add Cocktail"
        build = Build(instructions: [])
        buildOption = nil
       
    }
    
    func clearIngredientData() {
        ingredientName = ""
        ingredientAmount = 0
        selectedMeasurementUnit = .fluidOunces
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
        print("cocktail name = \(cocktailName)")
        print("ingredient count = \(addedIngredients.count)")
        if let glassValue = glass {
            print("glass  = \(glassValue.rawValue)")
        } else {
            print("glass = nil")
        }
        
        return cocktailName != "" && ((addedIngredients.count) > 1) && glass != nil
    }
    
    func ingredientIsValid() -> Bool {
        return ingredientAmount != 0.0 && ingredientName != ""
    }

    func cantAddCocktailMessage() -> String {
        var text = ""
        
        if cocktailName == "" {
            text = "Your cocktail must have a name"
            if glass == nil {
                text += ", and a glass"
            }
        } else if glass == nil {
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

    func matchAllPhysicalCocktailComponents() {
        /// if searchText is empty, don't show any results
        
        if ingredientName == "" {
            for component in allPhysicalCocktailComponents {
                component.matchesCurrentSearch = false
            }
            //self.objectWillChange.send()
            return
        }
        
        /// if searchText has text, match it and set the viewModel properties accordingly
        for component in allPhysicalCocktailComponents {
            if component.name.localizedCaseInsensitiveContains(ingredientName) && ingredientName != "" {
                component.matchesCurrentSearch = true
            } else {
                component.matchesCurrentSearch = false
            }
        }
    }
    
     func dynamicallyChangeMeasurementUnit() {
            switch ingredientType {
            case .herbs:
                selectedMeasurementUnit = MeasurementUnit.gentlyMuddled
            case .fruit:
                selectedMeasurementUnit = MeasurementUnit.muddled
            case .seasoning:
                selectedMeasurementUnit = MeasurementUnit.drops
            case .wines:
                selectedMeasurementUnit = MeasurementUnit.float
            case .bitters:
                selectedMeasurementUnit = MeasurementUnit.dashes
            default:
                selectedMeasurementUnit = MeasurementUnit.fluidOunces
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
    func validateBuildInstructions() {
        if build.instructions != [] {
            buildOption = build
        }
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
