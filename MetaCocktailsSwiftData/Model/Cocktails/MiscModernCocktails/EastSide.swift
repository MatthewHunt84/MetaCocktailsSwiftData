//
//  EastSide.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation


var eastSide = Cocktail(cocktailName: "East Side",
                        glasswareType: .collins,
                        garnish: [.mintBouquet, .cucumberSlices],
                        ice: .koldDraft,
                        author: Author(person: AuthorNames.georgeDelgado.rawValue,
                                       place: AuthorPlaces.libation.rawValue,
                                       year: "2004"),
                        spec: eastSideSpec,
                        buildOrder: eastSideBuild,
                        tags: eastSideTags,
                        variation: .eastSide,
                        titleCocktail: true)

let eastSideSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.cucumberSlices), value: 3, unit: .muddled),
                                          OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                          OldCocktailIngredient(.juices(.lime), value: 0.75),
                                          OldCocktailIngredient(.syrups(.richSimple), value: 0.5, prep: PrepBible.richSimple),
                                          OldCocktailIngredient(.gins(.haymansLondonDry), value: 2),
                                          OldCocktailIngredient(.soda(.sparklingWater), value: 2)]

let eastSideTags = Tags(profiles: [.herbal, .refreshing, .light, .effervescent],
                        styles: [.fizz, .shaken])




