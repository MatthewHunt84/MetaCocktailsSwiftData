//
//  CocktailListViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import SwiftData
import Observation
import Combine

@MainActor
@Observable final class CocktailListViewModel: ObservableObject {
    
    var cocktailFetchCompleted = false
    
    private var allCocktails: [Cocktail] = []
    var mainListCocktails: [Cocktail] = []
    var searchResultsCocktails: [Cocktail] {
        if searchText.isEmpty {
            return [Cocktail]()
        } else {
            let filtered = filterCocktails(searchText: searchText, filteringCocktails: allCocktails)
            return sortCocktails(filtered, searchText: searchText)
        }
    }
    
    var filteredResults: (top: Cocktail?, others: [Cocktail]) {
        let results = searchResultsCocktails
        guard !results.isEmpty else { return (top: nil, others: [Cocktail]()) }
        guard !searchText.isEmpty else { return (top: nil, others: results) }
        
        let others = Array(results[1...])
        return (top: results.first, others: others)
    }
    // We need to show a list of cocktail on the search page - but they aren't actually used, so we display the first 20 and wait for the search field to present the real filtered list
    var searchViewDisplayCocktails: [Cocktail] { Array(allCocktails[...20]) }
    
    var cocktailListAlphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","#"]
    var searchText: String = ""
    private var debouncedSearchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let searchSubject = PassthroughSubject<String, Never>()
    
    private var organizedCocktailsCache: [String: [String: [Cocktail]]] = [:]
    
    var shouldReloadCache = false
    var didTapCocktail = false
    
    init(modelContext: ModelContext) {
        self.setupSearch()
        Task {
            await fetchCocktails(modelContext: modelContext)
        }
    }

    func fetchCocktails(modelContext: ModelContext) async {
        
        do {
            let fetchedCocktails = try {
                let descriptor = FetchDescriptor<Cocktail>()
                return try modelContext.fetch(descriptor)
            }()
            
            self.allCocktails = fetchedCocktails.sorted { $0.cocktailName < $1.cocktailName }
            self.updateMainListCocktails()
            self.cacheOrganizedCocktails()
            await MainActor.run {
                withAnimation(.easeOut(duration: 1.5)) {
                    self.cocktailFetchCompleted = true
                }
            }
        } catch {
            print("Error fetching cocktails: \(error)")
            await MainActor.run {
                self.cocktailFetchCompleted = true
            }
        }
    }
    
    private func setupSearch() {
        searchSubject
            .debounce(for: .milliseconds(100), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.performSearch(searchText)
            }
            .store(in: &cancellables)
    }
    
    func updateSearch(_ searchText: String) {
        searchSubject.send(searchText)
    }
    
    @discardableResult
    private func performSearch(_ searchText: String) -> [Cocktail] {
        self.debouncedSearchText = searchText
        if searchText.isEmpty {
            return allCocktails
        } else {
            let filtered = filterCocktails(searchText: searchText, filteringCocktails: allCocktails)
            return sortCocktails(filtered, searchText: searchText)
        }
    }
    
    private func shouldPopulateCache() -> Bool {
        let shouldPopulateCache = organizedCocktailsCache.isEmpty || shouldReloadCache
        return shouldPopulateCache
    }
    
    private func shouldShowInSpecialSection(_ string: String) -> Bool {
        guard let firstChar = string.first else { return false }
        return !firstChar.isLetter || firstChar.isNumber
    }
    
    private func cacheOrganizedCocktails() {
        guard shouldPopulateCache() else { return }
        let allOrganizedCocktails = organizeCocktails(mainListCocktails)
        
        for letter in cocktailListAlphabet {
            organizedCocktailsCache[letter] = [:]
        }
        
        for (key, cocktails) in allOrganizedCocktails {
            if shouldShowInSpecialSection(key) {
                organizedCocktailsCache["#"]?[key] = cocktails
            } else {
                if let firstChar = key.first {
                    let firstLetter = String(firstChar.uppercased())
                    if cocktailListAlphabet.contains(firstLetter) {
                        organizedCocktailsCache[firstLetter]?[key] = cocktails
                    }
                }
            }
        }
    }
    
    func getOrganizedCocktails(for letter: String) -> [String: [Cocktail]] {
        return organizedCocktailsCache[letter] ?? [:]
    }
    
    func updateAndCache() {
        updateMainListCocktails()
        cacheOrganizedCocktails()
    }
    
    private func updateMainListCocktails() {
        mainListCocktails = allCocktails
    }
    
    private func filterCocktails(searchText: String, filteringCocktails: [Cocktail]) -> [Cocktail] {
        print("FILTER COCKTAILS START")
        let lowercasedSearchText = searchText.lowercased()
        let filtered = filteringCocktails.filter { cocktail in
            cocktail.cocktailName.localizedStandardContains(lowercasedSearchText) ||
            (cocktail.variationName?.localizedStandardContains(lowercasedSearchText) ?? false)
        }
        print("FILTER COCKTAILS END")
        return filtered
    }
    
    private func sortCocktails(_ cocktails: [Cocktail], searchText: String) -> [Cocktail] {
        let lowercasedSearchText = searchText.lowercased()
        return cocktails.sorted { (lhs: Cocktail, rhs: Cocktail) in
            let lhsLowercased = lhs.cocktailName.lowercased()
            let rhsLowercased = rhs.cocktailName.lowercased()
            
            let lhsStartsWith = lhsLowercased.hasPrefix(lowercasedSearchText)
            let rhsStartsWith = rhsLowercased.hasPrefix(lowercasedSearchText)
            
            if lhsStartsWith != rhsStartsWith {
                return lhsStartsWith
            }
            
            if lhsStartsWith {
                return lhs.cocktailName.count < rhs.cocktailName.count
            }
            return (lhsLowercased.range(of: lowercasedSearchText)?.lowerBound ?? lhsLowercased.endIndex) <
                (rhsLowercased.range(of: lowercasedSearchText)?.lowerBound ?? rhsLowercased.endIndex)
        }
    }
    
    func selectedCocktailVariations(for cocktail: Cocktail) -> [Cocktail] {
        
        let variationsWithSelectedCocktailFirst = allCocktails.filter { $0.variationName == cocktail.cocktailName }.sorted {
            $1.cocktailName == cocktail.cocktailName ? false :
            $0.cocktailName == cocktail.cocktailName ? true :
            $0.cocktailName < $1.cocktailName
        }
        return variationsWithSelectedCocktailFirst
        
    }
    
    func organizeCocktails(_ cocktails: [Cocktail]) -> [String: [Cocktail]] {
        var organizedCocktailsDict: [String: [Cocktail]] = [:]
        
        for cocktail in cocktails {
            let key = cocktail.variationName ?? cocktail.cocktailName
            
            if organizedCocktailsDict[key] == nil {
                organizedCocktailsDict[key] = []
            }
            if let existingCocktails = organizedCocktailsDict[key] {
                if !existingCocktails.contains(where: { $0.id == cocktail.id }) {
                    organizedCocktailsDict[key]?.append(cocktail)
                }
            }
        }
        for (key, value) in organizedCocktailsDict {
            organizedCocktailsDict[key] = value.sorted { $0.cocktailName < $1.cocktailName }
        }
        
        return organizedCocktailsDict
    }
}



