//
//  CorpseReviver2.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var corpseReviver2 = Cocktail(cocktailName: "Corpse Reviver No.2",
                              glasswareType: .stemmedGlassware,
                              ice: nil,
                              spec: corpseReviver2Spec,
                              buildOrder: kinaLilletExplanation,
                              tags: corpseReviver2Tags)

var corpseReviver2Spec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                           CocktailIngredient(.gins(.ginLondonDry), value: 0.75),
                           CocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                           CocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.75),
                           CocktailIngredient(.otherAlcohol(.absinthe), value: 1, unit: .dash)]

var corpseReviver2Tags = Tags(textures: [.light],
                              styles: [.sour, .shaken])

var kinaLilletExplanation = Build(instructions: [Instruction(step: 1, method: "The original cocktail called for Kina Lillet which is a quinine bitter that stopped production in 1985. The closest thing we can find to it is Cocchi Americano, so that's why we're using it here. Lillet Blanc is nothing like Kina Lillet.")])

