//
//  KirRoyale(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var kirRoyaleWnG = Cocktail(cocktailName: "Kir Royale" + wAndGTitleTag,
                            glasswareType: .flute,
                            garnish: [.lemonPeel],
                            ice: nil,
                            author: williamsAndGraham,
                            spec: kirRoyaleSpecWnG,
                            tags: kirRoyaleTagsWnG,
                            variation: .kirRoyale,
                            collection: .williamsAndGraham)

var kirRoyaleSpecWnG  = [OldCocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.25),
                         OldCocktailIngredient(.wines(.prosecco), value: 4.5)]

var kirRoyaleTagsWnG = Tags(flavors: [.lemon],
                            profiles: [.dry, .fruity, .effervescent],
                            styles: [.built])



