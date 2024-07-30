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
    
    var nonmatchSearchPreference: String = "none"
    var currentComponentSearchName: String = ""
    var filteredIngredients: [String] = []
    var subCategoryStrings: [String] = SubCategories.allCases.map({$0.rawValue})
    var umbrellaCategoryStrings: [String] = SpiritsUmbrellaCategory.allCases.map{ $0.rawValue }
    var baseCategoryStrings: [String] = BaseCategory.allCases.map({$0.rawValue})
    var specialtyCategoryStrings: [String] = SpecialtyCategory.allCases.map({$0.rawValue})
    var unwantedIngredients: [String] = []
    var preferredIngredients: [String] = []
    var isLoading = true
    var preferredCount = 0
    var sections: [ResultViewSectionData] = []
    var willLoadOnAppear = true
    var basicSearchViewIsActive: Bool = false

    var cocktailsAndMissingIngredientsForMinusOne: [CocktailsAndMissingIngredients] = []
    var cocktailsAndMissingIngredientsForMinusTwo: [CocktailsAndMissingIngredients] = []

    func clearData() {
        currentComponentSearchName = ""
        unwantedIngredients = []
        preferredIngredients = []
        sections.removeAll()
        preferredCount = 0
    }
    
    
    func convertExpression(strings: [String]) -> Expression<[Ingredient], Int> {
      
        let ingredientCount = #Expression<[Ingredient], Int> { ingredients in
            ingredients.filter { ingredient in
                strings.contains(ingredient.ingredientBase.name)
            }.count
        }
    
          
       
        return ingredientCount
    }


//    func findIngredientNamesForUmbrellaCategories() -> (preferred: [String],unwanted: [String]) {
//        
//        
//        var unwantedIngredientsFromSubCategories: [String] = []
//        var preferredIngredientsFromSubCategories: [String] = []
//        let unwantedSubCategories = unwantedIngredients.filter { umbrellaCategoryStrings.contains($0) }
//        let preferredSubCategories = preferredIngredients.filter { umbrellaCategoryStrings.contains($0) }
//  
//     
//        
//        for i in unwantedSubCategories {
//            if i == UmbrellaCategory.agaves.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Agave.allCases.map({$0.rawValue}) )
//     
//            }
//            if i == UmbrellaCategory.brandies.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Brandy.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.gins.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Gin.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.rums.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Rum.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.vodkas.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Vodka.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.whiskies.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Whiskey.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.liqueurs.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Liqueur.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.fortifiedWines.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: FortifiedWine.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.wines.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Wine.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.bitters.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Bitters.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.amari.rawValue {
//                unwantedIngredientsFromSubCategories.append(contentsOf: Amaro.allCases.map({$0.rawValue}) )
//            }
//        }
//        for i in preferredSubCategories {
//            if i == UmbrellaCategory.agaves.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Agave.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.brandies.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Brandy.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.gins.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Gin.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.rums.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Rum.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.vodkas.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Vodka.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.whiskies.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Whiskey.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.liqueurs.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Liqueur.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.fortifiedWines.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: FortifiedWine.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.wines.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Wine.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.bitters.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Bitters.allCases.map({$0.rawValue}) )
//            }
//            if i == UmbrellaCategory.amari.rawValue {
//                preferredIngredientsFromSubCategories.append(contentsOf: Amaro.allCases.map({$0.rawValue}) )
//            }
//        }
//        
//        return (preferred: preferredIngredientsFromSubCategories, unwanted: unwantedIngredientsFromSubCategories)
//    }
    func findIngredientNamesForCorrespondingSubCategories() -> (preferred: [String],unwanted: [String]) {
        
        var unwantedIngredientsFromSubCategories: [String] = []
        var preferredIngredientsFromSubCategories: [String] = []
        let unwantedSubCategories = unwantedIngredients.filter { subCategoryStrings.contains($0) }
        let preferredSubCategories = preferredIngredients.filter { subCategoryStrings.contains($0) }
        
        func appendUnwantedIngredients<T: CaseIterable & RawRepresentable>(for type: T.Type) where T.AllCases: RandomAccessCollection, T.RawValue == String {
            for booze in type.allCases {
                if let boozeTags = (booze as? BoozeTagsProtocol)?.tags.booze,
                   boozeTags.map({ $0.name }).contains(where: { unwantedSubCategories.contains($0) }),
                   !unwantedIngredients.contains(booze.rawValue) {
                    unwantedIngredientsFromSubCategories.append(booze.rawValue)
                }
            }
            
        }
        func appendPreferredIngredients<T: CaseIterable & RawRepresentable>(for type: T.Type) where T.AllCases: RandomAccessCollection, T.RawValue == String {
            for booze in type.allCases {
                if let boozeTags = (booze as? BoozeTagsProtocol)?.tags.booze,
                   boozeTags.map({ $0.name }).contains(where: { preferredSubCategories.contains($0) }),
                   !preferredIngredients.contains(booze.rawValue) {
                    preferredIngredientsFromSubCategories.append(booze.rawValue)
                }
            }
        }
        appendUnwantedIngredients(for: Agave.self)
        appendUnwantedIngredients(for: Brandy.self)
        appendUnwantedIngredients(for: Gin.self)
        appendUnwantedIngredients(for: Rum.self)
        appendUnwantedIngredients(for: Vodka.self)
        appendUnwantedIngredients(for: Whiskey.self)
        appendUnwantedIngredients(for: Wine.self)
        appendUnwantedIngredients(for: Liqueur.self)
        
        appendPreferredIngredients(for: Agave.self)
        appendPreferredIngredients(for: Brandy.self)
        appendPreferredIngredients(for: Gin.self)
        appendPreferredIngredients(for: Rum.self)
        appendPreferredIngredients(for: Vodka.self)
        appendPreferredIngredients(for: Whiskey.self)
        appendPreferredIngredients(for: Wine.self)
        appendPreferredIngredients(for: Liqueur.self)
        return (preferred: preferredIngredientsFromSubCategories, unwanted: unwantedIngredientsFromSubCategories)
    }
  
    func findIngredientNamesForBaseCategories() -> (preferred: [String],unwanted: [String]) {
        
        var unwantedIngredientsFromSubCategories: [String] = []
        var preferredIngredientsFromSubCategories: [String] = []
        let unwantedSubCategories = unwantedIngredients.filter { baseCategoryStrings.contains($0) }
        let preferredSubCategories = preferredIngredients.filter { baseCategoryStrings.contains($0) }
        
        func appendUnwantedIngredients<T: CaseIterable & RawRepresentable>(for type: T.Type) where T.AllCases: RandomAccessCollection, T.RawValue == String {
            for booze in type.allCases {
                if let boozeTags = (booze as? BoozeTagsProtocol)?.tags.booze,
                   boozeTags.map({ $0.name }).contains(where: { unwantedSubCategories.contains($0) }),
                   !unwantedIngredients.contains(booze.rawValue) {
                    unwantedIngredientsFromSubCategories.append(booze.rawValue)
                }
            }
            
        }
        func appendPreferredIngredients<T: CaseIterable & RawRepresentable>(for type: T.Type) where T.AllCases: RandomAccessCollection, T.RawValue == String {
            for booze in type.allCases {
                if let boozeTags = (booze as? BoozeTagsProtocol)?.tags.booze,
                   boozeTags.map({ $0.name }).contains(where: { preferredSubCategories.contains($0) }),
                   !preferredIngredients.contains(booze.rawValue) {
                    preferredIngredientsFromSubCategories.append(booze.rawValue)
                }
            }
        }
        appendUnwantedIngredients(for: Agave.self)
        appendUnwantedIngredients(for: Brandy.self)
        appendUnwantedIngredients(for: Gin.self)
        appendUnwantedIngredients(for: Rum.self)
        appendUnwantedIngredients(for: Vodka.self)
        appendUnwantedIngredients(for: Whiskey.self)
        appendUnwantedIngredients(for: Wine.self)
        appendUnwantedIngredients(for: Liqueur.self)
        
        appendPreferredIngredients(for: Agave.self)
        appendPreferredIngredients(for: Brandy.self)
        appendPreferredIngredients(for: Gin.self)
        appendPreferredIngredients(for: Rum.self)
        appendPreferredIngredients(for: Vodka.self)
        appendPreferredIngredients(for: Whiskey.self)
        appendPreferredIngredients(for: Wine.self)
        appendPreferredIngredients(for: Liqueur.self)
        return (preferred: preferredIngredientsFromSubCategories, unwanted: unwantedIngredientsFromSubCategories)
    }
  

    
    func createDynamicSubCategoryPreferedCounts() {
        
    }
    func createMatchContainers()  {
        sections = []
        for i in 0...Int(preferredCount / 2) {
            let numberOfMatches = (preferredCount - i)
            sections.append(ResultViewSectionData(count: preferredCount, matched: numberOfMatches, cocktails: []))
        }
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

    func matchAllIngredientsAndSubcategories(ingredients: [String]) -> [String] {
        
        guard !currentComponentSearchName.isEmpty else {
             return [] // Return all ingredients if search text is empty
         }
        let lowercasedSearchText = currentComponentSearchName.lowercased()
        let combinedArrays = ingredients + subCategoryStrings
        let combinedArraysWithoutDuplicates = Array(Set(combinedArrays))
        return combinedArraysWithoutDuplicates.filter { $0.lowercased().contains(lowercasedSearchText) }
            .sorted { lhs, rhs in
                let lhsLowercased = lhs.lowercased()
                let rhsLowercased = rhs.lowercased()
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
                    return lhs.count < rhs.count
                }
                // If neither starts with the search text, prioritize the one with the search text appearing first in the word
                let lhsRange = lhsLowercased.range(of: currentComponentSearchName.lowercased())
                let rhsRange = rhsLowercased.range(of: currentComponentSearchName.lowercased())
                let matchedArray = (lhsRange?.lowerBound ?? lhsLowercased.endIndex) < (rhsRange?.lowerBound ?? rhsLowercased.endIndex)
                return matchedArray
            }
    }

}


class AppStateRefresh: ObservableObject {
    @Published var refreshCocktailList = false
}
