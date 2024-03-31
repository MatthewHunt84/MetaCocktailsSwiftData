//
//  JungleBird(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var jungleBirdWnG = Cocktail(cocktailName: "JungleBird (W&G Version)",
                             glasswareType: .collins,
                             garnish: [.pineappleFrond],
                             ice: .pebbleIce,
                             author: williamsAndGraham,
                             spec: jungleBirdSpecWnG,
                             tags: jungleBirdTagsWnG,
                             variation: .jungleBird,
                             collection: .williamsAndGraham)

var jungleBirdSpecWnG  =  [CocktailIngredient(.juices(.lime), value: 0.5),
                           CocktailIngredient(.juices(.pineappleJuice), value: 1.5),
                           CocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5),
                           CocktailIngredient(.amari(.campari), value: 0.75),
                           CocktailIngredient(.rums(.cruzanBlackstrap), value: 0.5),
                           CocktailIngredient(.rums(.plantationBarbados), value: 1)]

var jungleBirdTagsWnG = Tags(flavors: [.pineapple, .lime],
                             profiles: [.aromatic, .citrusy, .fruity, .complex],
                             styles: [.tiki, .shaken, .sour])

