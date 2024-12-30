//
//  Bramble.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bramble = Cocktail(cocktailName: "Bramble" + historicTag,
                       glasswareType: .doubleOld,
                       garnish: [.lemonWheel, .blackberry],
                       ice: .pebbleIce,
                       author:Author(person: AuthorNames.dickBradsell.rawValue,
                                     place: AuthorPlaces.fredsClubLondon.rawValue,
                                     year: "1989") ,
                       spec: brambleSpec,
                       buildOrder: brambleBuild,
                       tags: brambleTags,
                       variation: .bramble,
                       collection: .originals,
                       titleCocktail: true,
                       historicSpec: .bramble)

let brambleSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 1),
                                            OldCocktailIngredient(.syrups(.richSimple), value: 0.5, prep: PrepBible.richSimple),
                                            OldCocktailIngredient(.liqueurs(.cremeDeMure), value: 0.5),
                                            OldCocktailIngredient(.gins(.ginLondonDry), value: 2)]

let brambleTags = Tags(flavors: [.lemon],
                       profiles: [.fruity, .floral, .citrusy],
                       styles: [.built])

