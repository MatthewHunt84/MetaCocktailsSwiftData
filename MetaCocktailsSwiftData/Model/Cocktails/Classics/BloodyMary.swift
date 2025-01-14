//
//  BloodyMary.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bloodyMary  = Cocktail(cocktailName: "Bloody Mary",
                           glasswareType: .collins,
                           garnish: [.garnishAtWill],
                           ice: .koldDraft,
                           spec: bloodyMarrySpec,
                           buildOrder: bloodyMaryBuild,
                           notes: bloodyMaryNote,
                           tags: bloodyMarryTags,
                           variation: .bloodyMary,
                           titleCocktail: true)

var bloodyMarrySpec  = [OldCocktailIngredient(.otherNonAlc(.tomatoJuice), value: 4.5),
                        OldCocktailIngredient(.otherNonAlc(.worcestershire), value: 3, unit: .dashes),
                        OldCocktailIngredient(.juices(.lemon), value: 0.5),
                        OldCocktailIngredient(.otherNonAlc(.tobasco), value: 3, unit: .dashes),
                        OldCocktailIngredient(.vodkas(.vodkaAny), value: 1.5)]



var bloodyMarryTags   = Tags(profiles: [.savory, .rich, .restorative])
