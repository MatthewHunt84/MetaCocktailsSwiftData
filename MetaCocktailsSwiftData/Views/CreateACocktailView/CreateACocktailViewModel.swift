//
//  CreateACocktailViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/26/24.
//

import SwiftUI

final class CreateACocktailViewModel: ObservableObject {
    
    @Published var ingredientName = ""
    @Published var ingredientAmount = 0.0
    @Published var ingredientType: IngredientType = IngredientType.agaves(.tequilaAny)
    @Published var selectedMeasurementUnit = MeasurementUnit.fluidOunces
    @Published var currentSelectedComponent = CocktailComponent(name: "Placeholder")
    @Published var addedIngredients: [CocktailIngredient] = []
    @Published var allPhysicalCocktailComponents: [CocktailComponent] = createPhysicalComponentArray()
    
    
    var  formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    func matchAllPhysicalCocktailComponents() {
        // if searchText is empty, show everything again
        
        if ingredientName == "" {
            for component in allPhysicalCocktailComponents {
                component.matchesCurrentSearch = true
            }
            // this forces an update when the search bar is empty, instead of waiting for the user to hit return
            self.objectWillChange.send()
            return
        }
        
        // if searchText has text, match it and set the viewModel properties accordingly
        for component in allPhysicalCocktailComponents {
            if component.name.localizedCaseInsensitiveContains(ingredientName) {
                component.matchesCurrentSearch = true
            } else {
                component.matchesCurrentSearch = false
            }
        }
        self.objectWillChange.send()
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
