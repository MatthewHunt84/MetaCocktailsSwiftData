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
        let lowercasedSearchText = debouncedSearchText.lowercased()
        // Include variation cocktails when searching with the search bar.
        //Otherwise, only the title cocktail shows up in the search, instead of the title cocktail and all of it's variations.
        let variationCocktails = allCocktails.filter { cocktail in
            guard let variation = cocktail.variation else { return false }
            return filteredCocktails.contains { $0.variation == variation }
        }
        filteredCocktails.append(contentsOf: variationCocktails)
        filteredCocktails = Array(Set(filteredCocktails)).sorted { $0.cocktailName < $1.cocktailName }.sorted { (lhs: Cocktail, rhs: Cocktail) in
            //Move the sorting to after the variations have been added.
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
    
    private func updateFilteredCocktails() {
        let lowercasedSearchText = debouncedSearchText.lowercased()
        
        if debouncedSearchText.isEmpty {
            filteredCocktails = allCocktails
        } else {
            filteredCocktails = allCocktails.filter { $0.cocktailName.localizedCaseInsensitiveContains(lowercasedSearchText) }
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



