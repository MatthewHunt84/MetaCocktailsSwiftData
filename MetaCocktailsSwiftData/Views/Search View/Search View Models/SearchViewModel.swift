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
    let flavorStrings: [String] = Flavor.allCases.map { $0.rawValue }
    let profileStrings: [String] = Profile.allCases.map { $0.rawValue }
    let styleStrings: [String] = Style.allCases.map { $0.rawValue }
    
    var ingredientNames: [String] = []
    var allWhiskies: [String] = Whiskey.allCases.map({ $0.rawValue })
    
    private var includedIngredientsSet: Set<String> = []
    private var excludedIngredientsSet: Set<String> = []
    
    var unwantedIngredients: [String] = []
    var preferredIngredients: [String] = []
    var preferredUmbrellaCategories: [String] = []
    var preferredBaseCategories: [String] = []
    var preferredSpecialtyCategories: [String] = []
    var preferredFlavorStrings: [String] = []
    var preferredProfileStrings: [String] = []
    var preferredStyleStrings: [String] = []
    
    var isLoading = true
    var preferredCount = 0
    
    
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
    var sortMinusOne = false
    var isRunningComplexSearch = false
    var isGeneratingIngredientList = false
    var searchCompleted = false
    var searchType: SearchType = .simple
    var updatedUnwantedSelections = [String]()
    var allCocktails: [Cocktail] = []
    var isShowingResults: Bool = false
    
    // No Results View Logic
    
    var noMatches = (noPerfect: false, noMinusOne: false, noMinusTwo: false)
    var showingNoResultsView = false
    
    enum NoMatchMessage {
        case noPerfectMatchCocktails, noMinusOneCocktails, noMinusTwoCocktails
    }
    
    func notify(_ message: NoMatchMessage) {
        guard searchType == .simple else { return }
        switch message {
        case .noPerfectMatchCocktails:
            noMatches.noPerfect = true
        case .noMinusOneCocktails:
            noMatches.noMinusOne = true
        case .noMinusTwoCocktails:
            noMatches.noMinusTwo = true
        }
        
        if noMatches == (true, true, true) {
            Task {
                await MainActor.run {
                    showingNoResultsView = true
                    noMatches = (false, false, false)
                }
            }
        }
    }
    
    func handleThumbsUp(ingredient: String) {
        if !preferredSelections.contains(ingredient) {
            if umbrellaCategoryStrings.contains(ingredient) {
                if let umbrellaSpirits = SpiritsUmbrellaCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                   preferredSelections.removeAll(where: { umbrellaSpirits.subCategories.contains($0) })
                }
            }
            if baseCategoryStrings.contains(ingredient) {
                if let baseSpirits = BaseCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                    preferredSelections.removeAll(where: { baseSpirits.baseCategoryIngredients.contains($0) })
                }
            }
            if specialtyCategoryStrings.contains(ingredient) {
                if let specialtySpirits = SpecialtyCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                    preferredSelections.removeAll(where: { specialtySpirits.specialtyCategoryIngredients.contains($0) })
                }
            }
            preferredSelections.append(ingredient)
            preferredCount += 1
            if unwantedSelections.contains(ingredient){
                unwantedSelections.removeAll(where: {$0 == ingredient})
            }
        } else {
            preferredSelections.removeAll(where: {$0 == ingredient})
            preferredCount -= 1
        }
        updateCategoryIngredients()
        fillPreferredCategoryArrays()
        currentComponentSearchName = ""
    }
    
    func handleThumbsDown(ingredient: String) {
        if !unwantedSelections.contains(ingredient) {
            if umbrellaCategoryStrings.contains(ingredient) {
                if let umbrellaSpirits = SpiritsUmbrellaCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                    unwantedSelections.removeAll(where: { umbrellaSpirits.subCategories.contains($0) })
                }
            }
            if baseCategoryStrings.contains(ingredient) {
                if let baseSpirits = BaseCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                    unwantedSelections.removeAll(where: { baseSpirits.baseCategoryIngredients.contains($0) })
                }
            }
            if specialtyCategoryStrings.contains(ingredient) {
                if let specialtySpirits = SpecialtyCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                    unwantedSelections.removeAll(where: { specialtySpirits.specialtyCategoryIngredients.contains($0) })
                }
            }
            unwantedSelections.append(ingredient)
            if preferredSelections.contains(ingredient) {
                preferredSelections.removeAll(where: {$0 == ingredient})
                preferredCount -= 1
            }
        } else {
            unwantedSelections.removeAll(where: {$0 == ingredient})
        }
        updateCategoryIngredients()
        fillUnwantedCategoryArrays()
        currentComponentSearchName = ""
    }
    
    func minusOneHeader(missingIngredient: String) -> some View {
        VStack {
            Spacer()
            HStack {
                Text("MATCHES ALL EXCEPT FOR")
                    .foregroundColor(.secondary)
                Text(missingIngredient.uppercased())
                    .foregroundColor(.primary)
                    .bold()
                Spacer()
            }
            .padding(.leading, 4)
            .font(FontFactory.fontBody14)
        }
    }
    
    func minusOneFooter() -> some View {
        HStack {
            Spacer()
            Button {
                Task {
                    await MainActor.run {
                        withAnimation {
                            self.sortMinusOne.toggle()
                        }
                    }
                }
            } label: {
                Text(sortMinusOne ? "COLLAPSE" : "SORT BY MISSING INGREDIENT" )
                    .foregroundColor(ColorScheme.interactionTint)
            }
        }
        .font(FontFactory.fontBody14)
        .background(Color.clear)
        .frame(maxWidth: .infinity, maxHeight: 5)
    }
    
    func minusTwoHeader(missingIngredients: [String], cocktailCount: Int) -> some View {
        HStack{
            Text("(\(cocktailCount)) Missing \(missingIngredients[0]) & \(missingIngredients[1])")
            Spacer()
        }
        .font(FontFactory.fontBody16)
        .foregroundColor(.secondary)
    }
    
    func getMissingIngredients(for cocktail: Cocktail) -> [String] {
        let preferredSelectionsArray = preferredSelections
        var cocktailIngredients = cocktail.spec.map { $0.ingredientBase.name }
        cocktailIngredients += cocktail.spec.map { $0.ingredientBase.baseCategory }
        cocktailIngredients += cocktail.spec.map { $0.ingredientBase.specialtyCategory }
        cocktailIngredients += cocktail.spec.map { $0.ingredientBase.umbrellaCategory }
        if let cocktailFlavors = cocktail.compiledTags.flavors {
            cocktailIngredients += cocktailFlavors.map { $0.rawValue }
        }
        if let cocktailProfiles = cocktail.compiledTags.profiles {
            cocktailIngredients += cocktailProfiles.map { $0.rawValue }
        }
        if let cocktailStyles = cocktail.compiledTags.styles {
            cocktailIngredients += cocktailStyles.map { $0.rawValue }
        }
        let cocktailIngredientsNoDoubles = Array(Set(cocktailIngredients))
        return preferredSelectionsArray.filter { !cocktailIngredientsNoDoubles.contains($0) }
    }
    
    func group(cocktails: [Cocktail]) -> [([String], [Cocktail])] {
        let grouped = Dictionary(grouping: cocktails) { cocktail in
            getMissingIngredients(for: cocktail)
        }
        return grouped.sorted { $0.key.joined() < $1.key.joined() }
    }
  
    
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
            preferredSpecialtyCategories.count > 1 ||
            preferredFlavorStrings.count > 0 ||
            preferredProfileStrings.count > 0 ||
            preferredStyleStrings.count > 0 ||
            (unwantedIngredients.contains { flavorStrings.contains($0) }) ||
            (unwantedIngredients.contains { styleStrings.contains($0) }) ||
            (unwantedIngredients.contains { profileStrings.contains($0) }){
            searchType = SearchType.complex
        } else {
            searchType = SearchType.simple
        }
    }
    
    func clearSearchCriteria() {
        
        showingNoResultsView = false
        
        preferredSelections.removeAll()
        unwantedSelections.removeAll()
        
        preferredUmbrellaCategories.removeAll()
        preferredBaseCategories.removeAll()
        preferredSpecialtyCategories.removeAll()
        preferredFlavorStrings.removeAll()
        preferredProfileStrings.removeAll()
        preferredStyleStrings.removeAll()
        
        
        preferredIngredients.removeAll()
        unwantedIngredients.removeAll()
        
        
        includedIngredientsSet.removeAll()
        excludedIngredientsSet.removeAll()
        
        
        perfectMatchCocktails.removeAll()
        minusOneMatchCocktails.removeAll()
        minusTwoMatchCocktails.removeAll()
        preferredCount = 0
        
        
        currentComponentSearchName = ""
        
        
//        isRunningComplexSearch = false
//        isGeneratingIngredientList = false
        
        
        filteredIngredients.removeAll()
        
        isShowingResults = false
        
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
        preferredFlavorStrings.removeAll(where: { $0 == selection})
        preferredProfileStrings.removeAll(where: { $0 == selection})
        preferredStyleStrings.removeAll(where: {$0 == selection})
        
        preferredIngredients.removeAll(where: { $0 == selection})
        includedIngredientsSet.remove(selection)
        
        // remove ingredients connected to over arching categories
        if preferred {
            if umbrellaCategoryStrings.contains(selection) {
                if let umbrellaSpirit = SpiritsUmbrellaCategory.allCases.first(where: { $0.rawValue == selection }) {
                    includedIngredientsSet.subtract(umbrellaSpirit.subCategories)
                }
            }
            if baseCategoryStrings.contains(selection) {
                if let baseSpirit = BaseCategory.allCases.first(where: { $0.rawValue == selection }) {
                    includedIngredientsSet.subtract(baseSpirit.baseCategoryIngredients)
                }
            }
            if specialtyCategoryStrings.contains(selection) {
                if let specialtySpirit = SpecialtyCategory.allCases.first(where: { $0.rawValue == selection }) {
                    includedIngredientsSet.subtract(specialtySpirit.specialtyCategoryIngredients)
                }
            }
        } else {
            if umbrellaCategoryStrings.contains(selection) {
                if let umbrellaSpirit = SpiritsUmbrellaCategory.allCases.first(where: { $0.rawValue == selection }) {
                    excludedIngredientsSet.subtract(umbrellaSpirit.subCategories)
                }
            }
            if baseCategoryStrings.contains(selection) {
                if let baseSpirit = BaseCategory.allCases.first(where: { $0.rawValue == selection }) {
                    excludedIngredientsSet.subtract(baseSpirit.baseCategoryIngredients)
                }
            }
            if specialtyCategoryStrings.contains(selection) {
                if let specialtySpirit = SpecialtyCategory.allCases.first(where: { $0.rawValue == selection }) {
                    excludedIngredientsSet.subtract(specialtySpirit.specialtyCategoryIngredients)
                }
            }
        }
        
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
        preferredFlavorStrings = []
        
        for selection in preferredSelections {
            if umbrellaCategoryStrings.contains(selection) {
                preferredUmbrellaCategories.append(selection)
            } else if baseCategoryStrings.contains(selection) {
                preferredBaseCategories.append(selection)
            } else if specialtyCategoryStrings.contains(selection) {
                preferredSpecialtyCategories.append(selection)
            } else if flavorStrings.contains(selection) {
                preferredFlavorStrings.append(selection)
            } else if profileStrings.contains(selection) {
                preferredProfileStrings.append(selection)
            } else if styleStrings.contains(selection) {
                preferredStyleStrings.append(selection)
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
        let combinedArrays = ingredientNames + baseCategoryStrings + umbrellaCategoryStrings + specialtyCategoryStrings + flavorStrings + profileStrings + styleStrings
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
        func makeIngredientSearchCell(for ingredient: Binding<String>) -> some View {
            if includedIngredientsSet.contains(ingredient.wrappedValue) {
                IncludedIngredientSearchCell(ingredient: ingredient)
            } else if excludedIngredientsSet.contains(ingredient.wrappedValue) {
                ExcludedIngredientSearchCell(ingredient: ingredient)
            } else {
                DefaultIngredientSearchCell(ingredient: ingredient)
            }
        }
    
}

class AppStateRefresh: ObservableObject {
    @Published var refreshCocktailList = false
}
