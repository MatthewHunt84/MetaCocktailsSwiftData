//
//  DummyCocktails.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/13/24.
//

final class DummyCocktails {
    
    static public var cocktails: [Cocktail] = [zombie, brunelle, cloverClub, ramosGinFizz]
    static public func randomCocktail() -> Cocktail {
        return cocktails.randomElement() ?? zombie
    }
}
