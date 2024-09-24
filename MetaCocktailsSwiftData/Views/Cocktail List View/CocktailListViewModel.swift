//
//  CocktailListViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import Observation
import Combine

@Observable final class CocktailListViewModel: ObservableObject{
    
    private var allCocktails: [Cocktail] = []
    var filteredCocktails: [Cocktail] = []
    
    var cocktailListAlphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var searchText: String = ""
    private var debouncedSearchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let searchSubject = PassthroughSubject<String, Never>()
    
    private var organizedCocktailsCache: [String: [String: [Cocktail]]] = [:]
    
    var shouldReloadCache = false
    
    init() {
        setupSearch()
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
        updateFilteredCocktails()
    }
    
    private func shouldPopulateCache() -> Bool {
        let shouldPopulateCache = organizedCocktailsCache.isEmpty || shouldReloadCache
        print("should reload cache: \(shouldPopulateCache)")
        return shouldPopulateCache
    }
    
    private func cacheOrganizedCocktails() {
        guard shouldPopulateCache() else { return }
        let allOrganizedCocktails = organizeCocktails(filteredCocktails)
        for letter in cocktailListAlphabet {
            organizedCocktailsCache[letter] = allOrganizedCocktails.filter { $0.key.hasPrefix(letter) }
        }
    }
    func getOrganizedCocktails(for letter: String) -> [String: [Cocktail]] {
        return organizedCocktailsCache[letter] ?? [:]
    }
    
    func setAllCocktails(_ cocktails: [Cocktail]) {
        self.allCocktails = cocktails
        updateFilteredCocktails()
        cacheOrganizedCocktails()
    }
    
    func updateAndCache() {
        updateFilteredCocktails()
        cacheOrganizedCocktails()
    }
    
    private func updateFilteredCocktails() {
        let lowercasedSearchText = debouncedSearchText.lowercased()
        
        if debouncedSearchText.isEmpty {
            filteredCocktails = allCocktails
        } else {
            filteredCocktails = allCocktails.filter { cocktail in
                cocktail.cocktailName.localizedCaseInsensitiveContains(lowercasedSearchText) ||
                (cocktail.variationName?.localizedCaseInsensitiveContains(lowercasedSearchText) ?? false)
            }
        }
        
        // Sort the filtered cocktails
        filteredCocktails.sort { (lhs: Cocktail, rhs: Cocktail) in
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
            return (lhsLowercased.range(of: lowercasedSearchText)?.lowerBound ?? lhsLowercased.endIndex) < (rhsLowercased.range(of: lowercasedSearchText)?.lowerBound ?? rhsLowercased.endIndex)
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



