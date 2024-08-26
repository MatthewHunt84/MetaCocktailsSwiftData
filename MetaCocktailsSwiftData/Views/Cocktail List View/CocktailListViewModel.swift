//
//  CocktailListViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import Observation
//import Combine

@Observable final class CocktailListViewModel{

    private var allCocktails: [Cocktail] = []
    var filteredCocktails: [Cocktail] = []
    
    var cocktailListAlphabet = [sfSymbolForCustomCocktails, "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    static var sfSymbolForCustomCocktails = "star.fill"

    private var searchTextTask: Task<Void, Never>?
    var searchText: String = "" {
            didSet {
                debounceSearchText()
            }
        }
    var debouncedSearchText: String = "" {
            didSet {
                updateFilteredCocktails()
            }
        }
    // Debounce for list search. Not super necessary but I still feel like it helps.
    private func debounceSearchText() {
        searchTextTask?.cancel()
        searchTextTask = Task { @MainActor in
            do {
                try await Task.sleep(for: .milliseconds(600))
                if !Task.isCancelled {
                    self.debouncedSearchText = self.searchText
                }
            } catch {}
        }
    }
    
    private func updateFilteredCocktails() {
        let lowercasedSearchText = debouncedSearchText.lowercased()
        
        if debouncedSearchText.isEmpty {
            filteredCocktails = allCocktails
        } else {
            filteredCocktails = allCocktails.filter { $0.cocktailName.localizedCaseInsensitiveContains(lowercasedSearchText) }
                .sorted { (lhs: Cocktail, rhs: Cocktail) in
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
    }
    
    func setAllCocktails(_ cocktails: [Cocktail]) {
        self.allCocktails = cocktails
        updateFilteredCocktails()
    }
    
    func selectedCocktailVariations(for cocktail: Cocktail) -> [Cocktail] {
        if let variation = cocktail.variation {
            let variationsWithSelectedCocktailFirst = filteredCocktails.filter({$0.variation == variation}).sorted {
                $1.cocktailName == cocktail.cocktailName ? false :
                $0.cocktailName == cocktail.cocktailName ? true :
                $0.cocktailName < $1.cocktailName
            }
            return variationsWithSelectedCocktailFirst
        } else {
            return [cocktail]
        }
    }
    
}



