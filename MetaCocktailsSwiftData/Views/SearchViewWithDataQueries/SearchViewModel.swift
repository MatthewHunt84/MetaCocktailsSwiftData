//
//  SearchViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import Observation


@Observable
final class SearchViewModel: ObservableObject {
    
    
    var currentComponentSearchName: String = ""
    var filteredIngredients: [IngredientBase] = []
    var includedIngredients: [IngredientBase] = []
    var excludedIngredients: [IngredientBase] = []
    
    var isLoading = true
    var preferredCount = 0
    var missingIngredients: [String] = []
    var sections = [ResultViewSectionData]()
    var willLoadOnAppear = true
    
    
    
    func clearData() {
        filteredIngredients = []
        includedIngredients = []
        excludedIngredients = []
        currentComponentSearchName = ""
        
    }
    
    
    
    func findCocktails(startingCocktails: [Cocktail]) {
        isLoading = true
        
        let refinedCocktails: [Cocktail] = filterUnwantedCocktails(unwantedIngredients: excludedIngredients, cocktails: startingCocktails)
        
        let finalMatchContainers: [ResultViewSectionData] = {
            var dataShells = [ResultViewSectionData]()
            preferredCount = includedIngredients.count
            for i in 0...Int(preferredCount / 2) {
                let numberOfMatches = (preferredCount - i)
                dataShells.append(ResultViewSectionData(count: preferredCount, matched: numberOfMatches, cocktails: []))
            }
            return dataShells
        }()
        for cocktail in refinedCocktails {
            
            //let cocktailTagsAsStrings = convertTagsAndSpecToStrings(for: cocktail)
            
            /** We use let _ = ... to loop over finalMatchContainers to append cocktails that match preferred components to the right section without creating a new array in the process */
            let _ = finalMatchContainers.map { resultViewSectionData in
                
                /** Then we want to match cocktails to sections by calculating the number of components that match the preferred array. */
               

                let matches = includedIngredients.reduce(0, { countMatches(currentCount: $0, preferredComponent: $1, cocktailIngredients: cocktail.spec)}) // we hijack this reduce function to make a missing component array

                if resultViewSectionData.matched == matches {
                    resultViewSectionData.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: missingIngredients, cocktail: cocktail))
                }
                
                missingIngredients.removeAll()
            }
        }
        /** Finally, we then return an array of matching cocktails as an array of ResultSectionViewData objects, checking to make sure the sections aren't empty. */
        sections.append(contentsOf: finalMatchContainers.filter({ !$0.cocktails.isEmpty}))
        
        /** (alternatively we do the same thing with compactMap and just cast the non-matches as optionals and compactMap will remove them for us)
         i.e.
         sections = finalMatchContainers.compactMap { resultSectionData in
         return resultSectionData.cocktails.isEmpty ? nil : resultSectionData } */
        isLoading = false
        
        
    }
    func countMatches(currentCount: Int, preferredComponent: IngredientBase, cocktailIngredients: [Ingredient]) -> Int {
        // compare preferredComponent against current cocktail of loop, then return number of matches.
        var matches = currentCount
        var nameStrings = cocktailIngredients.map({$0.ingredientBase.name})
        if nameStrings.contains(preferredComponent.name) {
            matches += 1
        } else {
            missingIngredients.append(preferredComponent.name)
        }
        return matches
    }
    
    func filterUnwantedCocktails(unwantedIngredients: [IngredientBase], cocktails: [Cocktail]) -> [Cocktail] {
      return  cocktails.filter { cocktail in
            unwantedIngredients.allSatisfy { unwantedComponent in
                !cocktail.spec.map({ $0.ingredientBase.name}).contains(unwantedComponent.name)
            }
        }
    }
    
    
    func removePreference(for component: IngredientBase) {
        // When we click a green bubble to remove a preferred tag, we change the data and the UI updates.
        preferredCount -= 1
        includedIngredients.removeAll(where: { $0.name == component.name})
        
    }
    func removeUnwanted(for component: IngredientBase) {
        // When we click a red bubble to remove an unwanted tag, we change the data and the UI updates.
        excludedIngredients.removeAll(where: { $0.name == component.name})
        
    }
    
    
    func matchAllIngredients(ingredients: [IngredientBase]) -> [IngredientBase] {
        
        guard !currentComponentSearchName.isEmpty else {
             return [] // Return all ingredients if search text is empty
         }
        let lowercasedSearchText = currentComponentSearchName.lowercased()
        return ingredients.filter { $0.name.lowercased().contains(lowercasedSearchText) }
            .sorted { lhs, rhs in
                let lhsLowercased = lhs.name.lowercased()
                let rhsLowercased = rhs.name.lowercased()
                // prioritize ingredients that start with the search text
                let lhsStartsWith = lhsLowercased.hasPrefix(currentComponentSearchName.lowercased())
                let rhsStartsWith = rhsLowercased.hasPrefix(currentComponentSearchName.lowercased())
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
                let lhsRange = lhsLowercased.range(of: currentComponentSearchName.lowercased())
                let rhsRange = rhsLowercased.range(of: currentComponentSearchName.lowercased())
                let matchedArray = (lhsRange?.lowerBound ?? lhsLowercased.endIndex) < (rhsRange?.lowerBound ?? rhsLowercased.endIndex)
                return matchedArray
            }
    }
}
