//
//  UltimaPalabra(W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var ultimaPalabraWnG = Cocktail(cocktailName: "Ultima Palabra(W&G version)",
                                glasswareType: .stemmedGlassware,
                                garnish: [.maraschinoCherry],
                                ice: nil,
                                spec: ultimaPalabraSpecWnG,
                                tags: ultimaPalabraTagsWnG,
                                variation: .ultimaPalabra)

var ultimaPalabraSpecWnG  = [CocktailIngredient(.juices(.lime), value: 0.75),
                             CocktailIngredient(.syrups(.simple), value: 0.25),
                             CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                             CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75),
                             CocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1)]

var ultimaPalabraTagsWnG = Tags(profiles: [.punchy, .herbal, .citrusy],
                                styles: [.sour, .daisy, .shaken])

