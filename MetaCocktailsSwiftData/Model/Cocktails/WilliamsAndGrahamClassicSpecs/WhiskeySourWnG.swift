//
//  WhiskeySourWnG.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/15/24.
//

import Foundation

var whiskeySourWnG = Cocktail(cocktailName: "Whiskey Sour" + wAndGTitleTag,
                           glasswareType: .stemmedGlassware,
                           garnish: [.maraschinoCherry],
                           ice: nil,
                           author: nil,
                           spec: whiskeySourSpec,
                           buildOrder: whiskeySourBuild,
                           tags: whiskeySourTags,
                           variation: .whiskeySour,
                           collection: .williamsAndGraham)

var whiskeySourSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                        OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                        OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                        OldCocktailIngredient(.whiskies(.bourbonAny), value: 2),
                        OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes)]

var whiskeySourTags = Tags(profiles: [.citrusy, .refreshing, .light, .silky],
                           styles: [.sour, .shaken])

