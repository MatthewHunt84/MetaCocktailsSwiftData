//
//  Preload.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/17/24.
//

import Foundation

final class DummyCocktails {
    
    static let shared = DummyCocktails()
    
    private init() {
        self.cocktails = [zombie, brunelle, cloverClub, ramosGinFizz]
        self.cocktail = cocktails.randomElement()!
    }
    
    public var cocktails: [Cocktail]
    public var cocktail: Cocktail
}
