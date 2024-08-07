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
    var allWhiskies: [String] = Whiskey.allCases.map({ $0.rawValue })
    var unwantedSelections: [String] = []
    var preferredSelections: [String] = []
    var preferredIngredients: [String] = []
    var unwantedIngredients: [String] = []
    var preferredUmbrellaCategories: [String] = []
    var unwantedUmbrellaCategories: [String] = []
    var preferredBaseCategories: [String] = []
    var unwantedBaseCategories: [String] = []
    var preferredSpecialtyCategories: [String] = []
    var unwantedSpecialtyCategories: [String] = []
    var isLoading = true
    var preferredCount = 0
    var sections: [ResultViewSectionData] = []
    var willLoadOnAppear = true

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
    
    func fillUnwantedCategoryArrays() {
        
        unwantedUmbrellaCategories = []
        unwantedBaseCategories = []
        unwantedSpecialtyCategories = []
        unwantedIngredients = []
        
        for selection in unwantedSelections {
            if let _ = UmbrellaCategory(rawValue: selection) {
                unwantedUmbrellaCategories.append(selection)
            } else if let _ = BaseCategory(rawValue: selection) {
                unwantedBaseCategories.append(selection)
            } else if let _ = SpecialtyCategory(rawValue: selection) {
                unwantedSpecialtyCategories.append(selection)
            } else {
                unwantedIngredients.append(selection)
            }
        }
    }
    
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
    
    func findIngredientNamesForCorrespondingSubCategories() -> (preferred: [String],unwanted: [String]) {
        
        var unwantedIngredientsFromSubCategories: [String] = []
        var preferredIngredientsFromSubCategories: [String] = []
        let unwantedSubCategories = unwantedSelections.filter { baseCategoryStrings.contains($0) }.filter { umbrellaCategoryStrings.contains($0) }.filter { specialtyCategoryStrings.contains($0) }
        let preferredSubCategories = preferredSelections.filter { baseCategoryStrings.contains($0) }
        
        func appendUnwantedIngredients<T: CaseIterable & RawRepresentable>(for type: T.Type) where T.AllCases: RandomAccessCollection, T.RawValue == String {
            for booze in type.allCases {
                if let boozeTags = (booze as? BoozeTagsProtocol)?.tags.booze,
                   boozeTags.map({ $0.name }).contains(where: { unwantedSubCategories.contains($0) }),
                   !unwantedSelections.contains(booze.rawValue) {
                    unwantedIngredientsFromSubCategories.append(booze.rawValue)
                }
            }
            
        }
        func appendPreferredIngredients<T: CaseIterable & RawRepresentable>(for type: T.Type) where T.AllCases: RandomAccessCollection, T.RawValue == String {
            for booze in type.allCases {
                if let boozeTags = (booze as? BoozeTagsProtocol)?.tags.booze,
                   boozeTags.map({ $0.name }).contains(where: { preferredSubCategories.contains($0) }),
                   !preferredSelections.contains(booze.rawValue) {
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
    
    func createMatchContainers()  {
        sections = []
        for i in 0...Int(preferredCount / 2) {
            let numberOfMatches = (preferredCount - i)
            sections.append(ResultViewSectionData(count: preferredCount, matched: numberOfMatches, cocktails: []))
        }
    }
    
    func modifyPreferredCount() {
        if findIngredientNamesForCorrespondingSubCategories().preferred.count > 0 {
            preferredCount += (findIngredientNamesForCorrespondingSubCategories().preferred.count - 1)
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

extension SearchViewModel {
    
    
    func predicateFactory(for matchCount: Int) -> Predicate<Cocktail> {
        // Early exit for complicated predicate search
        if preferredUmbrellaCategories.count > 1 ||
            preferredBaseCategories.count > 1 ||
            preferredSpecialtyCategories.count > 1 {
            return complicatedPredicateSearch()
        }

        // Prepare expressions
        let countPreferredIngredients = countPrefIngredients()
        let hasUmbrella = hasUmbrella()
        let hasBase = hasBaseCategory()
        let hasSpecialty = hasSpecialty()
        let totalUnwanted = totalUnwantedIngredients()

        // Check for preferred ingredients only
        if preferredUmbrellaCategories.isEmpty && preferredBaseCategories.isEmpty && preferredSpecialtyCategories.isEmpty && !preferredIngredients.isEmpty {
            return makeSimplePredicate(totalUnwanted: totalUnwanted, expression: countPreferredIngredients, matchCount: matchCount)
        }

        // Check for single umbrella category
        if preferredUmbrellaCategories.count == 1 && preferredBaseCategories.isEmpty && preferredSpecialtyCategories.isEmpty && preferredIngredients.isEmpty {
            return makeSimplePredicate(totalUnwanted: totalUnwanted, expression: hasUmbrella, matchCount: matchCount)
        }

        // Check for single base category
        if preferredUmbrellaCategories.isEmpty && preferredBaseCategories.count == 1 && preferredSpecialtyCategories.isEmpty && preferredIngredients.isEmpty {
            return makeSimplePredicate(totalUnwanted: totalUnwanted, expression: hasBase, matchCount: matchCount)
        }

        // Check for single specialty category
        if preferredUmbrellaCategories.isEmpty && preferredBaseCategories.isEmpty && preferredSpecialtyCategories.count == 1 && preferredIngredients.isEmpty {
            return makeSimplePredicate(totalUnwanted: totalUnwanted, expression: hasSpecialty, matchCount: matchCount)
        }

        // Check for combined categories and ingredients
        return makeCombinedPredicate(
            totalUnwanted: totalUnwanted,
            hasUmbrella: hasUmbrella,
            hasBase: hasBase,
            hasSpecialty: hasSpecialty,
            countPreferredIngredients: countPreferredIngredients,
            matchCount: matchCount
        )
    }

    private func makeSimplePredicate(totalUnwanted: Expression<[Ingredient], Bool>, expression: Expression<[Ingredient], Int>, matchCount: Int) -> Predicate<Cocktail> {
        return #Predicate<Cocktail> { cocktail in
            !totalUnwanted.evaluate(cocktail.spec) &&
            expression.evaluate(cocktail.spec) == matchCount
        }
    }

    private func makeCombinedPredicate(
        totalUnwanted: Expression<[Ingredient], Bool>,
        hasUmbrella: Expression<[Ingredient], Int>,
        hasBase: Expression<[Ingredient], Int>,
        hasSpecialty: Expression<[Ingredient], Int>,
        countPreferredIngredients: Expression<[Ingredient], Int>,
        matchCount: Int) -> Predicate<Cocktail> {
        
        let predicate: Predicate<Cocktail>
        
        switch (preferredUmbrellaCategories.count, preferredBaseCategories.count, preferredSpecialtyCategories.count, preferredIngredients.count) {
        case (1, 1, 0, 0):
            // One umbrella and one base category
            predicate = #Predicate<Cocktail> { cocktail in
                hasUmbrella.evaluate(cocktail.spec) + hasBase.evaluate(cocktail.spec) == matchCount
            }

        case (1, 0, 1, 0):
            // One umbrella and one specialty category
            predicate = #Predicate<Cocktail> { cocktail in
                hasUmbrella.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) == matchCount
            }

        case (0, 1, 1, 0):
            // One base and one specialty category
            predicate = #Predicate<Cocktail> { cocktail in
                hasBase.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) == matchCount
            }

        case (1, 1, 1, 0):
            // One umbrella, one base, and one specialty category
            predicate = #Predicate<Cocktail> { cocktail in
                hasUmbrella.evaluate(cocktail.spec) + hasBase.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) == matchCount
            }

        case (0, 0, 0, let ingredientCount) where ingredientCount > 0:
            // Only preferred ingredients
            predicate = #Predicate<Cocktail> { cocktail in
                countPreferredIngredients.evaluate(cocktail.spec) == matchCount
            }

        case (1, 0, 0, let ingredientCount) where ingredientCount > 0:
            // One umbrella and preferred ingredients
            predicate = #Predicate<Cocktail> { cocktail in
                hasUmbrella.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
            }

        case (0, 1, 0, let ingredientCount) where ingredientCount > 0:
            // One base and preferred ingredients
            predicate = #Predicate<Cocktail> { cocktail in
                hasBase.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
            }

        case (0, 0, 1, let ingredientCount) where ingredientCount > 0:
            // One specialty and preferred ingredients
            predicate = #Predicate<Cocktail> { cocktail in
                hasSpecialty.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
            }

        case (1, 1, 0, let ingredientCount) where ingredientCount > 0:
            // One umbrella, one base, and preferred ingredients
            predicate = #Predicate<Cocktail> { cocktail in
                hasUmbrella.evaluate(cocktail.spec) + hasBase.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
            }

        case (1, 0, 1, let ingredientCount) where ingredientCount > 0:
            // One umbrella, one specialty, and preferred ingredients
            predicate = #Predicate<Cocktail> { cocktail in
                hasUmbrella.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
            }

        case (0, 1, 1, let ingredientCount) where ingredientCount > 0:
            // One base, one specialty, and preferred ingredients
            predicate = #Predicate<Cocktail> { cocktail in
                hasBase.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
            }

        default:
            // Do all the checks
            predicate = #Predicate<Cocktail> { cocktail in
                hasUmbrella.evaluate(cocktail.spec) + hasBase.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
            }
        }
        // Finally, return the resulting predicate.
        return #Predicate<Cocktail> { cocktail in
            !totalUnwanted.evaluate(cocktail.spec) && predicate.evaluate(cocktail)
        }
    }

        
        func complicatedPredicateSearch() -> Predicate<Cocktail>{
            return #Predicate<Cocktail> { cocktail in
                cocktail.cocktailName == "Daiquiri"
            }
        }
        
        //build expression for preferred ingredients
        func countPrefIngredients() -> Expression<[Ingredient], Int> {
            return #Expression<[Ingredient], Int> { ingredients in
                ingredients.filter { ingredient in
                    preferredIngredients.contains(ingredient.ingredientBase.name)
                }.count
            }
        }
        
        //build expression for umbrella
        func hasUmbrella() -> Expression<[Ingredient], Int> {
            return #Expression<[Ingredient], Int> { ingredients in
                ingredients.filter { ingredient in
                    preferredUmbrellaCategories.contains(ingredient.ingredientBase.umbrellaCategory)
                }.count > 0 ? 1 : 0
            }
        }
        
        //build expression for baseCategory
        func hasBaseCategory() -> Expression<[Ingredient], Int> {
            return #Expression<[Ingredient], Int> { ingredients in
                ingredients.filter { ingredient in
                    preferredBaseCategories.contains(ingredient.ingredientBase.baseCategory)
                }.count > 0 ? 1 : 0
            }
        }
        
        //build expression for specialty
        func hasSpecialty() -> Expression<[Ingredient], Int> {
            return #Expression<[Ingredient], Int> { ingredients in
                ingredients.filter { ingredient in
                    preferredSpecialtyCategories.contains(ingredient.ingredientBase.specialtyCategory)
                }.count > 0 ? 1 : 0
            }
        }
        
        func totalUnwantedIngredients() -> Expression<[Ingredient], Bool> {
            let totalUnwantedIngredients: [String] = unwantedIngredients + findIngredientNamesForCorrespondingSubCategories().unwanted
            
            return #Expression<[Ingredient], Bool> { ingredients in
                ingredients.filter { ingredient in
                    totalUnwantedIngredients.contains(ingredient.ingredientBase.name)
                }.count > 0
            }
            
        }
}
