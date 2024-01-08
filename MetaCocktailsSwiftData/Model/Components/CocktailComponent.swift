//
//  CocktailComponent.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/4/24.
//

import SwiftUI

class CocktailComponent: Identifiable, ObservableObject, Hashable{
    
    // I don't love this, but it will work for now..
    
    @Published var matchesCurrentSearch: Bool
    var id = UUID()
    var name: String
    @Published var isPreferred: Bool = false
    @Published var isUnwanted: Bool = false
    var isSpirit: Bool = false
    var isFlavor: Bool = false
    var isProfile: Bool = false
    var isStyle: Bool = false
    var isTexture: Bool = false
    var preferenceType: PreferenceType
    var spiritCategory: IngredientType?
    var spiritCategoryName: String = ""
    
    
    init(name: String, isFlavor: Bool = false, isProfile: Bool = false, isStyle: Bool = false, isSpirit: Bool = false, isTexture: Bool = false, matchesCurrentSearch: Bool = true) {
        self.name = name
        self.isSpirit = isSpirit
        self.isFlavor = isFlavor
        self.isStyle = isStyle
        self.isProfile = isProfile
        self.isTexture = isTexture
        self.matchesCurrentSearch = matchesCurrentSearch
        
        if isFlavor {
            preferenceType = .flavors
        } else if isStyle {
            preferenceType = .style
        } else if isSpirit {
            preferenceType = .spirits
        } else if isProfile {
            preferenceType = .profiles
        } else {
            preferenceType = .textures
        }
    }
    
    init(for flavor: Flavor) {
        self.name = flavor.rawValue
        self.isFlavor = true
        self.preferenceType = .flavors
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
    
    init(for texture: Texture) {
        self.name = texture.rawValue
        self.isTexture = true
        self.preferenceType = .textures
        self.matchesCurrentSearch = true
    }
    
    init(for booze: Booze) {
        self.name = booze.ingredientType.name
        self.isSpirit = true
        self.preferenceType = .spirits
        self.matchesCurrentSearch = true
        self.spiritCategory = booze.ingredientType
        self.spiritCategoryName = booze.ingredientType.category
    }
    
    static func == (lhs: CocktailComponent, rhs: CocktailComponent) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    func isEqualTo(_ cocktailIngredient: CocktailIngredient) -> Bool {
        return self.name == cocktailIngredient.ingredient.name

    }
        
}


