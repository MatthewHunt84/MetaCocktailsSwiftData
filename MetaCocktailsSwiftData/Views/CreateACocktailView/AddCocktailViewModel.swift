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
    var ingredientName = ""
    var ingredientAmount = 0.0
    var ingredientType: IngredientType = IngredientType.agaves(.tequilaAny)
    var selectedMeasurementUnit = MeasurementUnit.fluidOunces
    var currentSelectedComponent = CocktailComponent(name: "Placeholder")
    var addedIngredients: [CocktailIngredient] = []
    var addGarnish: [Garnish] = []
    var allPhysicalCocktailComponents: [CocktailComponent] = createPhysicalComponentArray()
    
    var dateAdded = Date()
    var defaultName = "Add Cocktail"
    
    // Required
    var cocktailName: String = ""
    
    // Ingredients
    var  formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    // Extras
    var glass: Glassware? = .doubleOld
    var ice: Ice? = .none
    var garnish: Garnish? = .noGarnish
    var variation: Variation?
    
    // Author
    var authorName: String = ""
    var authorPlace: String = ""
    var authorYear: String = ""
    
    // Build
    var build: Build?
    
    func clearData() {
        cocktailName = ""
        authorName = ""
        authorPlace = ""
        authorYear = ""
        glass = .doubleOld
        ice = .none
        garnish = .noGarnish
        variation = nil
        addedIngredients = []
        defaultName = "Add Cocktail"
        build = nil 
    }
    
    func isValid() -> Bool {
        return cocktailName != "" && ((addedIngredients.count) > 2)
    }
    
    // Can't add cocktail alert
    
    var isShowingAlert: Bool = false
    
    func cantAddCocktailMessage() -> Text {
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
        return Text(text)
    }
    
    @ViewBuilder
    func navigateToCocktailListView() -> some View {
        
         CocktailListView()
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

    
    static func createPhysicalComponentArray() ->  [CocktailComponent] {
        
        var array = [CocktailComponent]()
        let convertedBoozeArray: [CocktailComponent] = SearchCriteriaViewModel.generatedBoozeCocktailComponents
        let convertedNAArray: [CocktailComponent] = SearchCriteriaViewModel.generatedNACocktailComponents
        for component in convertedBoozeArray {
            array.append(component)
        }
        for component in convertedNAArray {
            array.append(component)
        }
        
        return array
    }
}
