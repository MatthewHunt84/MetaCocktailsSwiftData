//
//  SearchViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import Observation
import SwiftData


@Observable
final class SearchViewModel: ObservableObject {
    
    
    var currentComponentSearchName: String = ""
    var filteredIngredients: [IngredientBase] = []
    
    var unwantedIngredients: [IngredientBase] = []
    var preferredIngredients: [IngredientBase] = []
    
    var isLoading = true
    var preferredCount = 0
    var missingIngredients: [String] = []
    var sections = [ResultViewSectionData]()
    var willLoadOnAppear = true
    var onBasisSearchView: Bool = true
    
    
    
    func clearData() {
        filteredIngredients = []
        currentComponentSearchName = ""
        missingIngredients = []
        unwantedIngredients = []
        preferredIngredients = []
        sections.removeAll()
        preferredCount = 0
        
    }
//    @MainActor
//    func findPreferredIngredients(modelContext: ModelContext) -> [IngredientBase] {
//        var preferredIngredients: [IngredientBase] = []
//        let fetchDescriptor = FetchDescriptor<IngredientBase>(predicate: #Predicate { ingredient in
//            ingredient.isPreferred == true
//        })
//        do {
//            preferredIngredients = try modelContext.fetch(fetchDescriptor)
//        } catch {
//            print(error.localizedDescription)
//        }
//        return preferredIngredients
//    }
//    @MainActor
//    func findUnwantedIngredients(modelContext: ModelContext) -> [IngredientBase] {
//        var unwantedIngredients: [IngredientBase] = []
//        let fetchDescriptor = FetchDescriptor<IngredientBase>(predicate: #Predicate { ingredient in
//            ingredient.notPreferred == true
//        })
//        do {
//            unwantedIngredients = try modelContext.fetch(fetchDescriptor)
//        } catch {
//            print(error.localizedDescription)
//        }
//        return unwantedIngredients
//    }
//    
//    @MainActor
//    func findCocktails(modelContext: ModelContext) {
//        isLoading = true
//        sections.removeAll()
//        var startingCocktails: [Cocktail] = []
//        var includedIngredientBases: [IngredientBase] = []
//        let fetchDescriptor = FetchDescriptor<Cocktail>(sortBy: [SortDescriptor(\.cocktailName)])
//        do {
//            startingCocktails = try modelContext.fetch(fetchDescriptor)
//        } catch {
//            print(error.localizedDescription)
//        }
//        let preferedIngredientsFetchDescriptor = FetchDescriptor<IngredientBase>(predicate: #Predicate{$0.isPreferred == true })
//        do {
//            includedIngredientBases = try modelContext.fetch(preferedIngredientsFetchDescriptor)
//            preferredCount = includedIngredientBases.count
//
//        } catch {
//            print(error.localizedDescription)
//        }
//        
//        let refinedCocktails: [Cocktail] = filterUnwantedCocktails(cocktails: startingCocktails)
//        
//        let finalMatchContainers: [ResultViewSectionData] = {
//            var dataShells = [ResultViewSectionData]()
//            for i in 0...Int(preferredCount / 2) {
//                let numberOfMatches = (preferredCount - i)
//                dataShells.append(ResultViewSectionData(count: preferredCount, matched: numberOfMatches, cocktails: []))
//                
//            }
//            return dataShells
//        }()
//        
//        for cocktail in refinedCocktails {
//            /** We use let _ = ... to loop over finalMatchContainers to append cocktails that match preferred components to the right section without creating a new array in the process */
//            let _ = finalMatchContainers.map { resultViewSectionData in
//                /** Then we want to match cocktails to sections by calculating the number of components that match the preferred array. */
//                
//                
//                let matches = includedIngredientBases.reduce(0, { countMatches(currentCount: $0, preferredComponent: $1, cocktailIngredients: cocktail.spec)}) // we hijack this reduce function to make a missing component array
//                if resultViewSectionData.matched == matches {
//                    resultViewSectionData.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: missingIngredients, cocktail: cocktail))
//                }
//                
//                missingIngredients.removeAll()
//            }
//        }
//        /** Finally, we then return an array of matching cocktails as an array of ResultSectionViewData objects, checking to make sure the sections aren't empty. */
//        sections.append(contentsOf: finalMatchContainers.filter({ !$0.cocktails.isEmpty}))
//        
//        /** (alternatively we do the same thing with compactMap and just cast the non-matches as optionals and compactMap will remove them for us)
//         i.e.
//         sections = finalMatchContainers.compactMap { resultSectionData in
//         return resultSectionData.cocktails.isEmpty ? nil : resultSectionData } */
//        isLoading = false
//        
//    }
    func countMatches(currentCount: Int, preferredComponent: IngredientBase, cocktailIngredients: [Ingredient]) -> Int {
        // compare preferredComponent against current cocktail of loop, then return number of matches.
        var matches = currentCount
        let ingredientBases = cocktailIngredients.map({$0.ingredientBase.name})
        if ingredientBases.contains(preferredComponent.name) {
            matches += 1
        } else {
            missingIngredients.append(preferredComponent.name)
        }
        return matches
    }
    func createAPerfectMatchResultViewSectionData(cocktails: [Cocktail]) {
        sections.append(ResultViewSectionData(count: preferredCount, matched: preferredCount, cocktails: []))
        
        for sections in sections {
                for cocktail in cocktails {
                    sections.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: [], cocktail: cocktail))
                }
        }
    }
    
//    func filterUnwantedCocktails(cocktails: [Cocktail]) -> [Cocktail] {
//        return  cocktails.filter { !$0.spec.contains(where: { $0.ingredientBase.notPreferred == true}) }
//        
//    }
//    
//    func removePreference(for component: IngredientBase) {
//        // When we click a green bubble to remove a preferred tag, we change the data and the UI updates.
//        preferredCount -= 1
//        component.isPreferred = false
////        preferredIngredients.removeAll(where: { $0.name == component.name})
//        
//    }
//    func removeUnwanted(for component: IngredientBase) {
//        // When we click a red bubble to remove an unwanted tag, we change the data and the UI updates.
////        excludedIngredients.removeAll(where: { $0.name == component.name})
//        component.notPreferred = false
////        unwantedIngredients.removeAll(where:{ $0 == component })
//        
//    }
//    @ViewBuilder
//    func viewModelTagView(_ tag: String, _ color: Color, _ icon: String) -> some View {
//        HStack(spacing: 10) {
//            Text(tag)
//                .font(.callout)
//                .fontWeight(.semibold)
//                .foregroundColor(.white)
//            
//            Image(systemName: icon)
//                .fontWeight(.heavy)
//                .foregroundColor(.white)
//        }
//        .frame(height: 35)
//        .foregroundStyle(.black)
//        .padding(.horizontal, 15)
//        .background {
//            Capsule()
//                .fill(color.gradient)
//        }
//    }
//    
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
