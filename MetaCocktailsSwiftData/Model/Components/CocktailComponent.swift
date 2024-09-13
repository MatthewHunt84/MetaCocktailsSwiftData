//
//  CocktailComponent.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/4/24.
//

import SwiftUI


class CocktailComponent: Identifiable, ObservableObject, Hashable{
    static func == (lhs: CocktailComponent , rhs: CocktailComponent) -> Bool {
        return lhs.name == rhs.name
    }
    // I don't love this, but it will work for now..
    
    @Published var matchesCurrentSearch: Bool
    var id = UUID()
    var name: String
    @Published var isPreferred: Bool = false
    @Published var isUnwanted: Bool = false
    var isSpirit: Bool = false
    var isNA: Bool = false
    var isFlavor: Bool = false
    var isProfile: Bool = false
    var isStyle: Bool = false
    var spiritCategory: IngredientType?
    var nACategory: IngredientType?
    var nACategoryName: String = ""
    var spiritCategoryName: String = ""
    var info: String?
    
    
    init(name: String, isFlavor: Bool = false, isProfile: Bool = false, isStyle: Bool = false, isSpirit: Bool = false, isNA: Bool = false, matchesCurrentSearch: Bool = true, info: String? = nil) {
        self.name = name
        self.isSpirit = isSpirit
        self.isNA = isNA
        self.isFlavor = isFlavor
        self.isStyle = isStyle
        self.isProfile = isProfile
        self.matchesCurrentSearch = matchesCurrentSearch
        self.info = {
            if name == Whiskey.aberlourAbundah.rawValue {
                return "High Proof Single Malt"
            }
            if name == Syrup.richDem.rawValue || name == Syrup.richSimple.rawValue || name == Syrup.richCinnamonAndVanill.rawValue {
                return "Rich 2:1 by weight syrup."
            }
            return info
        }()
       
    }
  
    
    init(for flavor: Flavor) {
        self.name = flavor.rawValue
        self.isFlavor = true
        self.matchesCurrentSearch = true
    }
    
    init(for profile: Profile) {
        self.name = profile.rawValue
        self.isProfile = true
        self.matchesCurrentSearch = true
    }
    
    init(for style: Style) {
        self.name = style.rawValue
        self.isStyle = true
        self.matchesCurrentSearch = true
    }
    init(for booze: Booze) {
        self.name = booze.ingredientType.name
        self.isSpirit = true
        self.matchesCurrentSearch = true
        self.spiritCategory = booze.ingredientType
        self.spiritCategoryName = booze.ingredientType.category
    }
    init(for nA: NAIngredients) {
        self.name = nA.ingredientType.name
        self.isSpirit = false
        self.matchesCurrentSearch = true
        self.isNA = true
        self.nACategory = nA.ingredientType
        self.nACategoryName = nA.ingredientType.category
    }
    
    
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    func isEqualTo(_ oldCocktailIngredient: OldCocktailIngredient) -> Bool {
        return self.name == oldCocktailIngredient.ingredient.name

    }
        
}


