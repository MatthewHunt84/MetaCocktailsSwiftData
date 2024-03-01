//
//  PainKiller(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/30/24.
//

import Foundation

var painKillerWnG  = Cocktail(cocktailName: "Pain Killer(W&G Version)",
                              glasswareType: .collins,
                              garnish: [.nutmeg],
                              ice: .crackedIce,
                              author: williamsAndGraham,
                              spec: painKillerWnGSpec,
                              tags: painKillerWnGTags,
                              variation: .painKiller,
                              collection: .williamsAndGraham)

var painKillerWnGSpec  = [CocktailIngredient(.juices(.orange), value: 0.75),
                          CocktailIngredient(.syrups(.cocoLopez), value: 0.75),
                          CocktailIngredient(.juices(.pineappleJuice), value: 1.5),
                          CocktailIngredient(.rums(.plantationBarbados) , value: 1.5)]


var painKillerWnGTags   = Tags(profiles: [.fruity, .sweet, .tropical, .refreshing],
                               styles: [.shaken, .tiki])

