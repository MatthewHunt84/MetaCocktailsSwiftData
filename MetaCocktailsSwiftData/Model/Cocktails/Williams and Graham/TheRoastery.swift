//
//  TheRoastery.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var TheRoastery = Cocktail(cocktailName: "The Roastery",
                           glasswareType: .doubleOld,
                           garnish: [.pirouette, .biscotti],
                           ice: .bigRock,
                           author: justWnG,
                           spec: TheRoasterySpec,
                           tags: TheRoasteryTags,
                           collection: .williamsAndGraham)

var TheRoasterySpec  = [CocktailIngredient(.bitters(.chocolateMole), value: 4, unit: .drops),
                        CocktailIngredient(.liqueurs(.borghetti), value: 0.5),
                        CocktailIngredient(.amari(.suze), value: 0.25),
                        CocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.75),
                        CocktailIngredient(.gins(.stGeorgeBotanivore), value: 1.5)]

var TheRoasteryTags = Tags(profiles: [.rich, .complex, .punchy, .spiritForward],
                           styles: [.stirred, .negroni])
