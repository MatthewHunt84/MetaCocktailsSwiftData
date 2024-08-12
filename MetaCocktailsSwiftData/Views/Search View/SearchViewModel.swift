//
//  SearchViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

@Observable
final class SearchViewModel: ObservableObject {
    
    var allCocktails: [Cocktail] = []
    var shouldRepopulatePredicates = true
    
    var nonmatchSearchPreference: String = "none"
    var currentComponentSearchName: String = ""
    var filteredIngredients: [String] = []
    var subCategoryStrings: [String] = SubCategories.allCases.map({$0.rawValue})
    var umbrellaCategoryStrings: [String] = SpiritsUmbrellaCategory.allCases.map{ $0.rawValue }
    var baseCategoryStrings: [String] = BaseCategory.allCases.map({$0.rawValue})
    var specialtyCategoryStrings: [String] = SpecialtyCategory.allCases.map({$0.rawValue})
    var allWhiskies: [String] = Whiskey.allCases.map({ $0.rawValue })
    var unwantedSelections: [String] = []
    var preferredSelections: [String] = []
    var preferredIngredients: [String] = []
    var unwantedIngredients: [String] = []
    var preferredUmbrellaCategories: [String] = []
//    var unwantedUmbrellaCategories: [String] = []
    var preferredBaseCategories: [String] = []
//    var unwantedBaseCategories: [String] = []
    var preferredSpecialtyCategories: [String] = []
//    var unwantedSpecialtyCategories: [String] = []
    var isLoading = true
    var preferredCount = 0
    var sections: [ResultViewSectionData] = []
    var willLoadOnAppear = true
    
    var perfectMatchCocktails = [String]()
    var minusOneMatchCocktails = [String]()
    var minusTwoMatchCocktails = [String]()

    var cocktailsAndMissingIngredientsForMinusOne: [CocktailsAndMissingIngredients] = []
    var cocktailsAndMissingIngredientsForMinusTwo: [CocktailsAndMissingIngredients] = []
    
    let umbrellaCategoryMap: [SpiritsUmbrellaCategory: [String]] = [
        .agaves: Agave.allCases.map { $0.rawValue },
        .brandies: Brandy.allCases.map { $0.rawValue },
        .gins: Gin.allCases.map { $0.rawValue },
        .rums: Rum.allCases.map { $0.rawValue },
        .vodkas: Vodka.allCases.map { $0.rawValue },
        .whiskies: Whiskey.allCases.map { $0.rawValue },
        .liqueurs: Liqueur.allCases.map { $0.rawValue },
        .fortifiedWines: FortifiedWine.allCases.map { $0.rawValue },
        .wines: Wine.allCases.map { $0.rawValue },
        .bitters: Bitters.allCases.map { $0.rawValue },
        .amari: Amaro.allCases.map { $0.rawValue }]
    
    let baseCategoryMap: [BaseCategory: [String]] = [
        .mezcalAny: BaseCategory.mezcalAny.baseCategoryIngredients,
        .tequilaAny: BaseCategory.tequilaAny.baseCategoryIngredients,
        .appleBrandy: BaseCategory.appleBrandy.baseCategoryIngredients,
        .armagnac: BaseCategory.armagnac.baseCategoryIngredients,
        .cognac: BaseCategory.cognac.baseCategoryIngredients,
        .pisco: BaseCategory.pisco.baseCategoryIngredients,
        .ginLondonDry: BaseCategory.ginLondonDry.baseCategoryIngredients,
        .navyStrengthGin: BaseCategory.navyStrengthGin.baseCategoryIngredients,
        .cachaca: BaseCategory.cachaca.baseCategoryIngredients,
        .rumAged: BaseCategory.rumAged.baseCategoryIngredients,
        .rumDemerara: BaseCategory.rumDemerara.baseCategoryIngredients,
        .rumDominican: BaseCategory.rumDominican.baseCategoryIngredients,
        .rumPuertoRican: BaseCategory.rumPuertoRican.baseCategoryIngredients,
        .rumWhite: BaseCategory.rumWhite.baseCategoryIngredients,
        .rumDark: BaseCategory.rumDark.baseCategoryIngredients,
        .americanWhiskeyAny: BaseCategory.americanWhiskeyAny.baseCategoryIngredients,
        .canadianWhiskeyAny: BaseCategory.canadianWhiskeyAny.baseCategoryIngredients,
        .irishWhiskeyAny: BaseCategory.irishWhiskeyAny.baseCategoryIngredients,
        .japaneseWhiskeyAny: BaseCategory.japaneseWhiskeyAny.baseCategoryIngredients,
        .scotchAny: BaseCategory.scotchAny.baseCategoryIngredients,
        .vermouthAny: BaseCategory.vermouthAny.baseCategoryIngredients,
        .sherryAny: BaseCategory.sherryAny.baseCategoryIngredients,
        .port: BaseCategory.port.baseCategoryIngredients]
    
    let specialtyCategoryMap: [SpecialtyCategory: [String]] = [
        .mezcalEspadin: SpecialtyCategory.mezcalEspadin.specialtyCategoryIngredients,
        .mezcalSmokeyAny: SpecialtyCategory.mezcalSmokeyAny.specialtyCategoryIngredients,
        .mezcalNotSmokeyAny: SpecialtyCategory.mezcalNotSmokeyAny.specialtyCategoryIngredients,
        .tequilaBlanco: SpecialtyCategory.tequilaBlanco.specialtyCategoryIngredients,
        .tequilaReposado: SpecialtyCategory.tequilaReposado.specialtyCategoryIngredients,
        .tequilaAnejo: SpecialtyCategory.tequilaAnejo.specialtyCategoryIngredients,
        .goldJamaicanRum: SpecialtyCategory.goldJamaicanRum.specialtyCategoryIngredients,
        .goldPuertoRicanRum: SpecialtyCategory.goldPuertoRicanRum.specialtyCategoryIngredients,
        .rumAgedCuban: SpecialtyCategory.rumAgedCuban.specialtyCategoryIngredients,
        .rumJamaicanAged: SpecialtyCategory.rumJamaicanAged.specialtyCategoryIngredients,
        .rumBlackStrap: SpecialtyCategory.rumBlackStrap.specialtyCategoryIngredients,
        .rumWhiteAgricole: SpecialtyCategory.rumWhiteAgricole.specialtyCategoryIngredients,
        .bourbonAny: SpecialtyCategory.bourbonAny.specialtyCategoryIngredients,
        .ryeWhiskeyAny: SpecialtyCategory.ryeWhiskeyAny.specialtyCategoryIngredients,
        .straightRyeOrBourbon: SpecialtyCategory.straightRyeOrBourbon.specialtyCategoryIngredients,
        .scotchBlended: SpecialtyCategory.scotchBlended.specialtyCategoryIngredients,
        .scotchHighland: SpecialtyCategory.scotchHighland.specialtyCategoryIngredients,
        .scotchIsla: SpecialtyCategory.scotchIsla.specialtyCategoryIngredients,
        .amontillado: SpecialtyCategory.amontillado.specialtyCategoryIngredients,
        .fino: SpecialtyCategory.fino.specialtyCategoryIngredients,
        .oloroso: SpecialtyCategory.oloroso.specialtyCategoryIngredients,
        .blancVermouth: SpecialtyCategory.blancVermouth.specialtyCategoryIngredients,
        .dryVermouthAny: SpecialtyCategory.dryVermouthAny.specialtyCategoryIngredients,
        .sweetVermouthAny: SpecialtyCategory.sweetVermouthAny.specialtyCategoryIngredients,
        .tawnyPort: SpecialtyCategory.tawnyPort.specialtyCategoryIngredients]
    
    func handleRemovalOf(selection: String) {
        shouldRepopulatePredicates = true
        unwantedSelections.removeAll(where: { $0 == selection})
        unwantedIngredients.removeAll(where: { $0 == selection})
        preferredSelections.removeAll(where: { $0 == selection})
        preferredUmbrellaCategories.removeAll(where: { $0 == selection})
        preferredBaseCategories.removeAll(where: { $0 == selection})
        preferredSpecialtyCategories.removeAll(where: { $0 == selection})
        preferredIngredients.removeAll(where: { $0 == selection})
        perfectMatchCocktails = []
        minusOneMatchCocktails = []
        minusTwoMatchCocktails = []
    }
    
    func fillPreferredCategoryArrays() {
        
        preferredUmbrellaCategories = []
        preferredBaseCategories = []
        preferredSpecialtyCategories = []
        preferredIngredients = []
        
        for selection in preferredSelections {
            if umbrellaCategoryStrings.contains(selection) {
                preferredUmbrellaCategories.append(selection)
            } else if baseCategoryStrings.contains(selection) {
                preferredBaseCategories.append(selection)
            } else if specialtyCategoryStrings.contains(selection) {
                preferredSpecialtyCategories.append(selection)
            } else {
                preferredIngredients.append(selection)
            }
        }
    }
    
//    func fillUnwantedCategoryArrays() {
//        
//        unwantedUmbrellaCategories = []
//        unwantedBaseCategories = []
//        unwantedSpecialtyCategories = []
//        unwantedIngredients = []
//        
//        for selection in unwantedSelections {
//            if let _ = UmbrellaCategory(rawValue: selection) {
//                unwantedUmbrellaCategories.append(selection)
//            } else if let _ = BaseCategory(rawValue: selection) {
//                unwantedBaseCategories.append(selection)
//            } else if let _ = SpecialtyCategory(rawValue: selection) {
//                unwantedSpecialtyCategories.append(selection)
//            } else {
//                unwantedIngredients.append(selection)
//            }
//        }
//    }
    
    func findAllCategoryIngredients() -> (included: [String], excluded: [String]) {
        var includedIngredients: [String] = []
        var excludedIngredients: [String] = []
        
        for (category, ingredients) in umbrellaCategoryMap {
            if preferredSelections.contains(category.rawValue) {
                includedIngredients.append(contentsOf: ingredients)
            }
            if unwantedSelections.contains(category.rawValue) {
                excludedIngredients.append(contentsOf: ingredients)
            }
            includedIngredients.removeAll(where: { excludedIngredients.contains($0) })
        }
        for (category, ingredients) in baseCategoryMap {
            if preferredSelections.contains(category.rawValue) {
                includedIngredients.append(contentsOf: ingredients)
            }
            if unwantedSelections.contains(category.rawValue) {
                excludedIngredients.append(contentsOf: ingredients)
            }
            includedIngredients.removeAll(where: { excludedIngredients.contains($0) })
        }
        for (category, ingredients) in specialtyCategoryMap {
            if preferredSelections.contains(category.rawValue) {
                includedIngredients.append(contentsOf: ingredients)
            }
            if unwantedSelections.contains(category.rawValue) {
                excludedIngredients.append(contentsOf: ingredients)
            }
            includedIngredients.removeAll(where: { excludedIngredients.contains($0) })
        }
        return (includedIngredients, excludedIngredients)
    }
    
    @ViewBuilder
    func returnPreferencesThumbCell(ingredient: Binding<String> ) -> some View {
        
        if findAllCategoryIngredients().included.contains(ingredient.wrappedValue)  {
            PreferencesIncludedLimitedThumbCell(ingredient: ingredient)
        } else if findAllCategoryIngredients().excluded.contains(ingredient.wrappedValue) {
            PreferencesExcludedLimitedThumbCell(ingredient: ingredient)
        } else {
            PreferencesThumbsCell(ingredient: ingredient)
        }
    }

    func clearData() {
        currentComponentSearchName = ""
        unwantedSelections = []
        preferredSelections = []
        sections.removeAll()
        preferredCount = 0
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
        let combinedArrays = ingredients + baseCategoryStrings + umbrellaCategoryStrings + specialtyCategoryStrings
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
