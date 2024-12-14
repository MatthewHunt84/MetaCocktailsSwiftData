//
//  CellarDoor(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var cellarDoor = Cocktail(cocktailName: "Cellar Door",
                          glasswareType: .teaCup,
                          garnish: [.cinnamon, .almonds, .raisins],
                          author: justWnG,
                          spec: cellarDoorSpec,
                          buildOrder: cellarDoorBuild,
                          tags: cellarDoorTags,
                          collection: .williamsAndGraham)

var cellarDoorSpec  = [OldCocktailIngredient(.otherNonAlc(.butter), value: 0.25),
                       OldCocktailIngredient(.syrups(.orgeat), value: 0.75, prep: PrepBible.orgeat),
                       OldCocktailIngredient(.liqueurs(.stGeorgeSpicesPear), value: 0.5),
                       OldCocktailIngredient(.fortifiedWines(.oloroso), value: 2)]

var cellarDoorTags = Tags(flavors: [.tea, .cinnamon],
                          profiles: [.hot, .aromatic, .nutty],
                          styles: [.toddy])


