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
    
    var unwantedIngredients: [String] = []
    var preferredIngredients: [String] = []
    
    var isLoading = true
    var preferredCount = 0
    var sections: [ResultViewSectionData] = []
    var willLoadOnAppear = true
    var onBasisSearchView: Bool = true

    func clearData() {
        currentComponentSearchName = ""
        unwantedIngredients = []
        preferredIngredients = []
        sections.removeAll()
        preferredCount = 0
    }

    func createResultsForSectionData(perfectMatch: [Cocktail], minusOne: [Cocktail], minusTwo: [Cocktail], minusThree: [Cocktail], minusFour: [Cocktail]) {
        for section in sections {
            if section.matched == preferredCount {
                for cocktail in perfectMatch {
                    section.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: [], cocktail: cocktail))
                    print("💯💯💯 \(cocktail.cocktailName) just got added with a preferred count of \(preferredCount) and a match of \(section.matched)")
                }
            }
            if section.matched == (preferredCount - 1) {
                for cocktail in minusOne {
                    
                    section.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: findMissingIngredients(cocktail: cocktail), cocktail: cocktail))
                    print("1️⃣1️⃣1️⃣ \(cocktail.cocktailName) just got added with a preferred count of \(preferredCount) and a match of \(section.matched)")
                }
            }
            if section.matched == (preferredCount - 2) {
                for cocktail in minusTwo{
                    section.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: findMissingIngredients(cocktail: cocktail), cocktail: cocktail))
                    print("2️⃣2️⃣2️⃣ \(cocktail.cocktailName) just got added with a preferred count of \(preferredCount) and a match of \(section.matched)")
                }
                
            }
            if section.matched == (preferredCount - 3) {
                for cocktail in minusThree{
                    section.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: findMissingIngredients(cocktail: cocktail), cocktail: cocktail))
                }
            }
            if section.matched == (preferredCount - 4) {
                for cocktail in minusThree{
                    section.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: findMissingIngredients(cocktail: cocktail), cocktail: cocktail))
                }
            }
        }
    }
    func perfectMatch(perfectMatch: [Cocktail]) {
       
        for section in sections {
            if section.sectionsPreferredCount == preferredCount {
                for cocktail in perfectMatch {
                    section.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: [], cocktail: cocktail))
                    print("💯💯💯 \(cocktail.cocktailName) just got added with a preferred count of \(preferredCount) and a match of \(section.matched)")
                }
            }
        }
    }
    func minusOne(minusOne: [Cocktail]) {
        for section in sections {
            if section.sectionsPreferredCount == (preferredCount - 1) {
                for cocktail in minusOne {
                    
                    section.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: findMissingIngredients(cocktail: cocktail), cocktail: cocktail))
                    print("1️⃣1️⃣1️⃣ \(cocktail.cocktailName) just got added with a preferred count of \(preferredCount) and a match of \(section.matched)")
                }
            }
        }
    }
    func minusTwo(minusTwo: [Cocktail]) {
        for section in sections {
            if section.sectionsPreferredCount == (preferredCount - 2) {
                for cocktail in minusTwo{
                    section.cocktails.append(CocktailsAndMissingIngredients(missingIngredients: findMissingIngredients(cocktail: cocktail), cocktail: cocktail))
                    print("2️⃣2️⃣2️⃣ \(cocktail.cocktailName) just got added with a preferred count of \(preferredCount) and a match of \(section.matched)")
                }
                
            }
        }
    }
    func createMatchContainers() -> [ResultViewSectionData] {
        print("preferred count = \(preferredCount)")
            var dataShells = [ResultViewSectionData]()
            for i in 0...Int(preferredCount / 2) {
                let numberOfMatches = (preferredCount - i)
                dataShells.append(ResultViewSectionData(count: preferredCount, matched: numberOfMatches, cocktails: []))
            }
            return dataShells
        
    }
    func findMissingIngredients(cocktail: Cocktail) -> [String] {
       print("This got fired")
        var cocktailMissingIngredients: [String] = []
        for spec in cocktail.spec {
            if !preferredIngredients.contains(spec.ingredientBase.name) {
                print("\(spec.ingredientBase.name) is being added to missing ingredients")
                cocktailMissingIngredients.append(spec.ingredientBase.name)
            }
        }
        return cocktailMissingIngredients
    }
    @ViewBuilder
    func viewModelTagView(_ tag: String, _ color: Color, _ icon: String) -> some View {
        HStack(spacing: 10) {
            Text(tag)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Image(systemName: icon)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 35)
        .foregroundStyle(.black)
        .padding(.horizontal, 15)
        .background {
            Capsule()
                .fill(color.gradient)
        }
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
