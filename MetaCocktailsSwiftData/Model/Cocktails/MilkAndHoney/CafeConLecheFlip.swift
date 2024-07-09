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

var cafeConLecheFlipSpec  = [CocktailIngredient(.otherNonAlc(.cream), value: 0.75),
                             CocktailIngredient(.syrups(.simple), value: 0.75),
                             CocktailIngredient(.liqueurs(.lolita), value: 1),
                             CocktailIngredient(.rums(.cruzanBlackstrap), value: 1),
                             CocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]

var cafeConLecheFlipTags = Tags(flavors: [.nutmeg],
                                profiles: [.rich, .silky, .savory],
                                styles: [.flip, .shaken])

var cafeConLecheFlipBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin a dry shake to emulsify"),
                                                 Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                 Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a flip glass. (In Sasha Petraske's 'Regaurding Cocktails', is says to use a  'chilled sour glas')"),
                                                 Instruction(step: 4, method: "Grate some nutmeg over the top.")])
