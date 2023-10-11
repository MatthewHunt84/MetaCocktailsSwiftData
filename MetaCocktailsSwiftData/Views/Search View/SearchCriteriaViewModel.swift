//
//  SearchCriteriaViewModel2.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/10/23.
//

import SwiftUI

final class SearchCriteriaViewModel: ObservableObject {

    @Published var searchText: String = ""
    @Published var cocktailComponents = Tags.createComponentArray()
    
    func matchAllTheThings() {
        // if searchText is empty, show everything again
        if searchText == "" {
            for cocktail in cocktailComponents {
                cocktail.matchesCurrentSearch = true
            }
             // this forces an update when the search bar is empty, instead of waiting for the user to hit return
            self.objectWillChange.send()
            return
        }

        // if searchText has text, match it and set the viewModel properties accordingly
        for cocktail in cocktailComponents {
            if cocktail.name.contains(searchText) {
                cocktail.matchesCurrentSearch = true
            } else {
                cocktail.matchesCurrentSearch = false
            }
        }
        self.objectWillChange.send()
    }
 
    func selectedPreferredIngredients() -> [CocktailComponent] {
        self.cocktailComponents.filter({ $0.isPreferred})
    }

    func selectedUnwantedIngredients() -> [CocktailComponent] {
        self.cocktailComponents.filter({ $0.isUnwanted})
    }

    func add(_ ingredient: CocktailComponent){
        cocktailComponents.append(ingredient)
    }
    
    func remove(at offsets: IndexSet){
        cocktailComponents.remove(atOffsets: offsets)
    }
}

class CocktailComponent: Identifiable, ObservableObject {
    
    // I don't love this, but it will work for now..
    
    @Published var matchesCurrentSearch: Bool
    var id = UUID()
    var name: String
    var isPreferred: Bool = false
    var isUnwanted: Bool = false
    var isSpirit: Bool = false
    var isFlavor: Bool = false
    var isProfile: Bool = false
    var isStyle: Bool = false
    var preferenceType: PreferenceType
 

    init(name: String, isFlavor: Bool = false, isProfile: Bool = false, isStyle: Bool = false, isSpirit: Bool = false, matchesCurrentSearch: Bool = true) {
        self.name = name
        self.isSpirit = isSpirit
        self.isFlavor = isFlavor
        self.isStyle = isStyle
        self.isProfile = isProfile
        self.matchesCurrentSearch = matchesCurrentSearch
        
        if isFlavor {
            preferenceType = .flavors
        } else if isStyle {
            preferenceType = .style
        } else if isSpirit {
            preferenceType = .spirits
        } else {
            preferenceType = .profiles
        }
    }
    
    init(for flavor: Flavor) {
        self.name = flavor.rawValue
        self.isFlavor = true
        self.preferenceType = .flavors
        self.matchesCurrentSearch = true
    }
    
    init(for spirit: Spirit) {
        self.name = spirit.rawValue
        self.isSpirit = true
        self.preferenceType = .spirits
        self.matchesCurrentSearch = true
    }
    
    init(for profile: Profile) {
        self.name = profile.rawValue
        self.isProfile = true
        self.preferenceType = .profiles
        self.matchesCurrentSearch = true
    }
    
    init(for style: Style) {
        self.name = style.rawValue
        self.isStyle = true
        self.preferenceType = .style
        self.matchesCurrentSearch = true
    }
}


