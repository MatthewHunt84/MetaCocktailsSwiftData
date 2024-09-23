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
    
    private func cacheOrganizedCocktails() {
        for letter in cocktailListAlphabet {
            organizedCocktailsCache[letter] = organizeCocktails(filteredCocktails.filter { $0.cocktailName.hasPrefix(letter) })
        }
    }
    func getOrganizedCocktails(for letter: String) -> [String: [Cocktail]] {
        return organizedCocktailsCache[letter] ?? [:]
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
    
    func setAllCocktails(_ cocktails: [Cocktail]) {
        self.allCocktails = cocktails
        updateFilteredCocktails()
        cacheOrganizedCocktails()
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
            //check to see if the cocktail is a variation
            if let variationName = cocktail.variationName {
                // if it is a variation, check to see if it's value exists in the dict.
                if organizedCocktailsDict[variationName] == nil {
                    organizedCocktailsDict[variationName] = []
                }
                //if it does exist, it appends that cocktail to that group. But first, check it's ID so it isn't adding duplicates.
                //I was finding duplicates in CocktailListView before I added this.
                if !organizedCocktailsDict[variationName]!.contains(where: { $0.id == cocktail.id }) {
                    organizedCocktailsDict[variationName]?.append(cocktail)
                }
            } else {
                // If variationName is Nil, then it's is a base cocktail, create a new group
                if organizedCocktailsDict[cocktail.cocktailName] == nil {
                    organizedCocktailsDict[cocktail.cocktailName] = [cocktail]
                }
                let variations = cocktails.filter { $0.variationName == cocktail.cocktailName }
                for variation in variations {
                    // again, make sure duplicates aren't being added.
                    if !organizedCocktailsDict[cocktail.cocktailName]!.contains(where: { $0.id == variation.id }) {
                        organizedCocktailsDict[cocktail.cocktailName]?.append(variation)
                    }
                }
            }
        }
        
        // Sort each group
        for (key, value) in organizedCocktailsDict {
            organizedCocktailsDict[key] = value.sorted { $0.cocktailName < $1.cocktailName }
        }
        
        return organizedCocktailsDict
    }
}



