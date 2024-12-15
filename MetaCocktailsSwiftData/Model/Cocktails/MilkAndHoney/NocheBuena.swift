//
//  NocheBuena.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var nocheBuena = Cocktail(cocktailName: "Noche Buena",
                          glasswareType: .coupe,
                          garnish: [.cinnamon],
                          ice: nil,
                          author: Author(person: AuthorNames.carolynGil.rawValue,
                                         place: AuthorPlaces.milkAndHoney.rawValue,
                                         year: "Early 2000s"),
                          spec: nocheBuenaSpec,
                          buildOrder: nocheBuenaBuild,
                          tags: nocheBuenaTags,
                          collection: .milkAndHoney)

var nocheBuenaSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                       OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                       OldCocktailIngredient(.otherNonAlc(.eggYolk), value: 1),
                       OldCocktailIngredient(.fortifiedWines(.tawnyPort), value: 1.5),
                       OldCocktailIngredient(.wines(.champagne), value: 1)]

var nocheBuenaTags = Tags(flavors: [.cinnamon],
                          profiles: [.rich, .silky, .fruity, .sweet],
                          styles: [.flip, .shaken])


