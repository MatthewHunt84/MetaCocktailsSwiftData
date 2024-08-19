//
//  BrandyCrusta(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brandyCrustaWnG = Cocktail(cocktailName: "Brandy Crusta (W&G Version)",
                               glasswareType: .coupe,
                               author: williamsAndGraham,
                               spec: brandyCrustaSpecWnG,
                               tags: brandyCrustaTags,
                               variation: .brandyCrusta,
                               collection: .williamsAndGraham)

var brandyCrustaSpecWnG    = [OldCocktailIngredient(.juices(.lemon), value: 1, unit: .barSpoon),
                              OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 1, unit: .barSpoon),
                              OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 1, unit: .barSpoon, prep: PrepBible.demSyrupPrep),
                              OldCocktailIngredient(.bitters(.angosturaBitters), value:2, unit: .dashes),
                              OldCocktailIngredient(.brandies(.pF1840), value:2)]

