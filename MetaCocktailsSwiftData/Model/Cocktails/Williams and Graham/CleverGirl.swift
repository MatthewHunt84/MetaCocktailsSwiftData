//
//  CleverGirl.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var cleverGirl = Cocktail(cocktailName: "Clever Girl",
                          imageAsset: nil,
                          glasswareType: .doubleOld,
                          garnish: [.grapefruitExpression, .chamomileFlowers],
                          ice: .bigRock,
                          author: Author(person: "Kristen Bair", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                          spec: cleverGirlSpec,
                          tags: cleverGirlTags,
                          collection: .williamsAndGraham)

let cleverGirlSpec = [CocktailIngredient(.bitters(.hoppedGrapefruit), value: 3, unit: .dashes),
                      CocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                      CocktailIngredient(.amari(.luxardoBitterBianco), value: 0.5),
                      CocktailIngredient(.gins(.hendricks), value: 0.75),
                      CocktailIngredient(.gins(.stGeorgeTerroir), value: 1.25)]


let cleverGirlTags = Tags(profiles: [.botanical, .complex, .spiritForward, .bright],
                          styles: [.stirred, .martini])



