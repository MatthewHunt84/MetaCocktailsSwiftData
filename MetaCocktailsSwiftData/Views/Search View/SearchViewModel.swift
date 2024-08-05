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
    var unwantedIngredients: [String] = []
    var preferredIngredients: [String] = []
    var preferredUmbrellaCategories: [UmbrellaCategory] = []
    var unwantedUmbrellaCategories: [UmbrellaCategory] = []
    var preferredBaseCategories: [BaseCategory] = []
    var unwantedBaseCategories: [BaseCategory] = []
    var preferredSpecialtyCategories: [SpecialtyCategory] = []
    var unwantedSpecialtyCategories: [SpecialtyCategory] = []
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
    
    // I'm using nested loops here to fill the corresponding categories. In fillUnwantedCategoryArrays(), I'm using a quicker method with the bang operator. But is it wrong?!
    func fillPreferredCategoryArrays() {
        
         preferredUmbrellaCategories = []
         preferredBaseCategories = []
         preferredSpecialtyCategories = []
        
        
        for preferredIngredient in preferredIngredients {
            for umbrella in UmbrellaCategory.allCases {
                if UmbrellaCategory(rawValue: preferredIngredient) == umbrella { preferredUmbrellaCategories.append(umbrella) }
            }
            for base in BaseCategory.allCases {
                if BaseCategory(rawValue: preferredIngredient) == base { preferredBaseCategories.append(base) }
            }
            for specialty in SpecialtyCategory.allCases {
                if SpecialtyCategory(rawValue: preferredIngredient) == specialty { preferredSpecialtyCategories.append(specialty) }
            }
        }
    }
    // I'm using the bang operator here. I know we aren't supposed to use them in coding but I don't see why we can't use it here.
    func fillUnwantedCategoryArrays() {

         unwantedUmbrellaCategories = []
         unwantedBaseCategories = []
         unwantedSpecialtyCategories = []
   
        for unwantedIngredient in unwantedIngredients {
            if umbrellaCategoryStrings.contains(unwantedIngredient) {
                unwantedUmbrellaCategories.append(UmbrellaCategory(rawValue: unwantedIngredient)!)
            }
            if baseCategoryStrings.contains(unwantedIngredient) {
                unwantedBaseCategories.append(BaseCategory(rawValue: unwantedIngredient)!)
            }
            if specialtyCategoryStrings.contains(unwantedIngredient) {
                unwantedSpecialtyCategories.append(SpecialtyCategory(rawValue: unwantedIngredient)!)
            }
        }
    }
    
    
    func findAllCategoryIngredients() -> (included: [String], excluded: [String]) {
        var includedIngredients: [String] = []
        var excludedIngredients: [String] = []
        
        for (category, ingredients) in umbrellaCategoryMap {
            if preferredIngredients.contains(category.rawValue) {
                includedIngredients.append(contentsOf: ingredients)
            }
            if unwantedIngredients.contains(category.rawValue) {
                excludedIngredients.append(contentsOf: ingredients)
            }
        }
        for (category, ingredients) in baseCategoryMap {
            if preferredIngredients.contains(category.rawValue) {
                includedIngredients.append(contentsOf: ingredients)
            }
            if unwantedIngredients.contains(category.rawValue) {
                excludedIngredients.append(contentsOf: ingredients)
            }
        }
        for (category, ingredients) in specialtyCategoryMap {
            if preferredIngredients.contains(category.rawValue) {
                includedIngredients.append(contentsOf: ingredients)
            }
            if unwantedIngredients.contains(category.rawValue) {
                excludedIngredients.append(contentsOf: ingredients)
            }
        }
        return (includedIngredients, excludedIngredients)
    }
    
    @ViewBuilder
    func returnPreferencesThumbCell(ingredient: Binding<String> ) -> some View {
        
        if findAllCategoryIngredients().included.contains(ingredient.wrappedValue)  {
            PreferencesIncludedLimitedThumbCell(ingredient: ingredient)
        } else {
            PreferencesThumbsCell(ingredient: ingredient)
        }
    }

    func clearData() {
        currentComponentSearchName = ""
        unwantedIngredients = []
        preferredIngredients = []
        sections.removeAll()
        preferredCount = 0
    }
    
    func findIngredientNamesForCorrespondingSubCategories() -> (preferred: [String],unwanted: [String]) {
        
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
