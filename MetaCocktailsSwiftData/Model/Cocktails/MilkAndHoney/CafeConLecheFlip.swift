//
//  CafeConLecheFlip.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var cafeConLecheFlip = Cocktail(cocktailName: "Café con Leche Flip",
                                glasswareType: .snifter,
                                garnish: [.nutmeg],
                                ice: nil,
                                author: Author(person: AuthorNames.samRoss.rawValue,
                                               place: AuthorPlaces.milkAndHoney.rawValue,
                                               year: "Early 2000s"),
                                spec: cafeConLecheFlipSpec,
                                buildOrder: cafeConLecheFlipBuild,
                                tags: cafeConLecheFlipTags,
                                collection: .milkAndHoney)

var cafeConLecheFlipSpec  = [OldCocktailIngredient(.otherNonAlc(.cream), value: 0.75),
                             OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                             OldCocktailIngredient(.liqueurs(.lolita), value: 1),
                             OldCocktailIngredient(.rums(.cruzanBlackstrap), value: 1),
                             OldCocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]

var cafeConLecheFlipTags = Tags(flavors: [.nutmeg],
                                profiles: [.rich, .silky, .savory],
                                styles: [.flip, .shaken])


