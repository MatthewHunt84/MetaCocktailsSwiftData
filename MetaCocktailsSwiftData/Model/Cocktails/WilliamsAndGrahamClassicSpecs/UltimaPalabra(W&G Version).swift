//
//  UltimaPalabra (W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var ultimaPalabraWnG = Cocktail(cocktailName: "Ultima Palabra" + wAndGTitleTag,
                                glasswareType: .stemmedGlassware,
                                garnish: [.maraschinoCherry],
                                ice: nil,
                                spec: ultimaPalabraSpecWnG,
                                tags: ultimaPalabraTagsWnG,
                                variation: .ultimaPalabra,
                                collection: .williamsAndGraham)

var ultimaPalabraSpecWnG  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                             OldCocktailIngredient(.syrups(.simple), value: 0.25, prep: PrepBible.simpleSyrupPrep),
                             OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                             OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75),
                             OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1)]

var ultimaPalabraTagsWnG = Tags(profiles: [.punchy, .herbal, .citrusy],
                                styles: [.sour, .daisy, .shaken])

