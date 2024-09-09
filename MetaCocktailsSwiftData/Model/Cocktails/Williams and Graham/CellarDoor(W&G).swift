//
//  CellarDoor(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var cellarDoor = Cocktail(cocktailName: "Cellar Door(W&G)",
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

var cellarDoorBuild = Build(instructions: [Instruction(step: 1, method: "Place all ingredients in a small shaker tin. "),
                                           Instruction(step: 2, method: "Fill the large shaker tin half full of near boiling water then float the small tin on top, bain-marie style."),
                                           Instruction(step: 3, method: "At the same time, heat your tea cup by adding hot water to it. Remove water before adding the cocktail."),
                                           Instruction(step: 4, method: "After the cocktail is sufficiently heated, emulsify with a small electric milk frother and then pour into the tea cup. "),
                                           Instruction(step: 5, method: "Grate cinnamon on top and add almonds and raisins to the saucer for garnish.")])
