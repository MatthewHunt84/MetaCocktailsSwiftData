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
    var searchResultsCocktails: [Cocktail] = []
    
    var cocktailListAlphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","#"]
    var searchText: String = ""
    private var debouncedSearchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let searchSubject = PassthroughSubject<String, Never>()
    
    private var organizedCocktailsCache: [String: [String: [Cocktail]]] = [:]
    
    var shouldReloadCache = false
    
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
            
            self.allCocktails = fetchedCocktails
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
            .debounce(for: .milliseconds(400), scheduler: DispatchQueue.main)
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
        self.debouncedSearchText = searchText
        if searchText.isEmpty {
            searchResultsCocktails = []
        } else {
            let filtered = filterCocktails(searchText: searchText, filteringCocktails: allCocktails)
            searchResultsCocktails = sortCocktails(filtered, searchText: searchText)
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
        let lowercasedSearchText = searchText.lowercased()
        return filteringCocktails.filter { cocktail in
            cocktail.cocktailName.localizedStandardContains(lowercasedSearchText) ||
            (cocktail.variationName?.localizedStandardContains(lowercasedSearchText) ?? false)
        }
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



