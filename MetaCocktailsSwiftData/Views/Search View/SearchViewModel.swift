//
//  SearchViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData
import Combine

@Observable
final class SearchViewModel: ObservableObject {
    
    // Any changes to these two arrays will trigger view updates and must happen on the main thread!
    var unwantedSelections: [String] = []
    var preferredSelections: [String] = []
    
    var nonmatchSearchPreference: String = "none"
    var currentComponentSearchName: String = ""
    var filteredIngredients: [String] = []
    var umbrellaCategoryStrings: [String] = SpiritsUmbrellaCategory.allCases.map{ $0.rawValue }
    var baseCategoryStrings: [String] = BaseCategory.allCases.map({$0.rawValue})
    var specialtyCategoryStrings: [String] = SpecialtyCategory.allCases.map({$0.rawValue})
    
    var ingredientNames: [String] = []
    var allWhiskies: [String] = Whiskey.allCases.map({ $0.rawValue })
    
    private var includedIngredientsSet: Set<String> = []
    private var excludedIngredientsSet: Set<String> = []
    
    var unwantedIngredients: [String] = []
    var preferredIngredients: [String] = []
    var preferredUmbrellaCategories: [String] = []
    var preferredBaseCategories: [String] = []
    var preferredSpecialtyCategories: [String] = []
    var isLoading = true
    var preferredCount = 0
    var sections: [ResultViewSectionData] = []
    
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
    
    // complex search variables
    var perfectMatchCocktails = [String]()
    var minusOneMatchCocktails = [String]()
    var minusTwoMatchCocktails = [String]()
    var isRunningComplexSearch = false
    var isGeneratingIngredientList = false
    var searchCompleted = false
    var searchType: SearchType = .simple
    var updatedUnwantedSelections = [String]()
    var allCocktails: [Cocktail] = []
    var isShowingResults: Bool = false
    
    func toggleIsShowingResults() {

        Task {
            await MainActor.run {
                isShowingResults = true
            }
        }
    }
    
    // complex search functions
    func toggleLoading() async {
        await MainActor.run {
            isRunningComplexSearch.toggle()
        }
    }
    
    func toggleGeneratingIngredients() async {
        await MainActor.run {
            isGeneratingIngredientList.toggle()
        }
    }
    
    func searchButtonPressed() async {
        
        updatedUnwantedSelections = unwantedSelections
        
        evaluateSearchType()
        if searchType == .complex {
            await generateComplicatedPredicates()
        }
        await MainActor.run {
            searchCompleted = true
        }
        
    }
    
    func evaluateSearchType() {
        if preferredUmbrellaCategories.count > 1 ||
            preferredBaseCategories.count > 1 ||
            preferredSpecialtyCategories.count > 1 {
            searchType = SearchType.complex
        } else {
            searchType = SearchType.simple
        }
    }
    
    func resetSearch() {
        searchCompleted = false
    }
    
    func handleRemovalOf(selection: String, preferred: Bool) {
        
        updatedUnwantedSelections = unwantedSelections
        updatedUnwantedSelections.removeAll(where: { $0 == selection})
        
        // Remove view-independant selections
        unwantedIngredients.removeAll(where: { $0 == selection})
        preferredUmbrellaCategories.removeAll(where: { $0 == selection})
        preferredBaseCategories.removeAll(where: { $0 == selection})
        preferredSpecialtyCategories.removeAll(where: { $0 == selection})
        preferredIngredients.removeAll(where: { $0 == selection})
        
        // Reset arrays for generation (if complex or not they need to be reset)
        perfectMatchCocktails = []
        minusOneMatchCocktails = []
        minusTwoMatchCocktails = []
        
        // Drop count by one if preferred:
        if preferred {
            preferredCount -= 1
        }
        
        if !isShowingResults {
            preferredSelections.removeAll(where: { $0 == selection})
            unwantedSelections.removeAll(where: { $0 == selection})
            return
        }
        
        // Evaluate new search type
        evaluateSearchType()
        
        // If complex, do complex thing. (note: look for count somewhere in here, that's gotta be switched out)
        Task {
            if searchType == .complex {
                
                await generateComplicatedPredicates()
                
                await MainActor.run {
                    searchCompleted = true
                    preferredSelections.removeAll(where: { $0 == selection})
                    unwantedSelections.removeAll(where: { $0 == selection})
                }
            } else {
                // Trigger updates:
                await MainActor.run {
                    preferredSelections.removeAll(where: { $0 == selection})
                    unwantedSelections.removeAll(where: { $0 == selection})
                }
            }
        }
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
    
    func fillUnwantedCategoryArrays() {
        unwantedIngredients = []
        
        for selection in unwantedSelections {
            guard UmbrellaCategory(rawValue: selection) == nil,
                  BaseCategory(rawValue: selection) == nil,
                  SpecialtyCategory(rawValue: selection) == nil
            else { continue }
            unwantedIngredients.append(selection)
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
    

    
    func clearData() {
        currentComponentSearchName = ""
        unwantedSelections = []
        preferredSelections = []
        sections.removeAll()
        preferredCount = 0
    }
    
    // TextField filtering jazz
    
    private var cancellables = Set<AnyCancellable>()
    private let searchSubject = PassthroughSubject<String, Never>()
    
    func setupSearch() {
        searchSubject
            .debounce(for: .milliseconds(200), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.performSearch(searchText)
            }
            .store(in: &cancellables)
    }
    
    func updateSearch(_ searchText: String) {
        searchSubject.send(searchText)
    }

    private func performSearch(_ searchText: String) {
        guard !searchText.isEmpty else {
            filteredIngredients = []
            return
        }
        
        let lowercasedSearchText = searchText.lowercased()
        let combinedArrays = ingredientNames + baseCategoryStrings + umbrellaCategoryStrings + specialtyCategoryStrings
        let combinedArraysWithoutDuplicates = Array(Set(combinedArrays))
        
        filteredIngredients = combinedArraysWithoutDuplicates.filter { $0.lowercased().contains(lowercasedSearchText) }
            .sorted { lhs, rhs in
                let lhsLowercased = lhs.lowercased()
                let rhsLowercased = rhs.lowercased()
                
                let lhsStartsWith = lhsLowercased.hasPrefix(lowercasedSearchText)
                let rhsStartsWith = rhsLowercased.hasPrefix(lowercasedSearchText)
                
                if lhsStartsWith != rhsStartsWith {
                    return lhsStartsWith
                }
                
                if lhsStartsWith {
                    return lhs.count < rhs.count
                }
                
                return (lhsLowercased.range(of: lowercasedSearchText)?.lowerBound ?? lhsLowercased.endIndex) < (rhsLowercased.range(of: lowercasedSearchText)?.lowerBound ?? rhsLowercased.endIndex)
            }
    }
        //Cache ingredients instead of running findAllCategoryIngredients a million times
        func updateCategoryIngredients() {
            let (included, excluded) = findAllCategoryIngredients()
            includedIngredientsSet = Set(included)
            excludedIngredientsSet = Set(excluded)
        }
        
        @ViewBuilder
        func returnPreferencesThumbCell(ingredient: Binding<String>) -> some View {
            if includedIngredientsSet.contains(ingredient.wrappedValue) {
                PreferencesIncludedLimitedThumbCell(ingredient: ingredient)
            } else if excludedIngredientsSet.contains(ingredient.wrappedValue) {
                PreferencesExcludedLimitedThumbCell(ingredient: ingredient)
            } else {
                PreferencesThumbsCell(ingredient: ingredient)
            }
        }
    
}

class AppStateRefresh: ObservableObject {
    @Published var refreshCocktailList = false
}
