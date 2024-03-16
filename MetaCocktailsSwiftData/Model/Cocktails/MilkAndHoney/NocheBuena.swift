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

var nocheBuenaSpec  = [CocktailIngredient(.juices(.lemon), value: 0.5),
                       CocktailIngredient(.syrups(.simple), value: 0.75),
                       CocktailIngredient(.otherNonAlc(.eggYolk), value: 1),
                       CocktailIngredient(.fortifiedWines(.tawnyPort), value: 1.5),
                       CocktailIngredient(.wines(.champagne), value: 1)]

var nocheBuenaTags = Tags( profiles: [.rich, .silky, .fruity, .sweet],
                          styles: [.flip, .shaken])

var nocheBuenaBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the Champagn into a tin a dry shake to emulsify"),
                                           Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                           Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a coupe."),
                                           Instruction(step: 4, method: "Top with Champagne and grate some cinnamon over the top.")])
