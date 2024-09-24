//
//  ElDiablo(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/23/24.
//

import Foundation


var elDiabloWnG  = Cocktail(cocktailName: "El Diablo (W&G Version)",
                            glasswareType: .collins,
                            garnish: [.limeWheel],
                            ice: .crackedIce,
                            author: williamsAndGraham,
                            spec: elDiabloSpecWnG,
                            buildOrder: elDiabloBuildOrderWnG,
                            tags: elDiabloTagsWnG,
                            collection: .originals)

var elDiabloSpecWnG  = [OldCocktailIngredient(.soda(.gingerBeer), value: 2.5),
                        OldCocktailIngredient(.juices(.lime), value: 0.5),
                        OldCocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.25),
                        OldCocktailIngredient(.agaves(.tequilaFortalezaRepo), value: 1.5)]



var elDiabloTagsWnG   = Tags(profiles: [.refreshing, .punchy, .effervescent],
                             styles: [.fizz, .shaken])


var elDiabloBuildOrderWnG = Build(instructions: [Instruction(step: 1, method: "Shake everything but the ginger beer with ice."),
                                                 Instruction(step: 1, method: "Strain into a collins glass full of ice and top the ginger beer.")])
