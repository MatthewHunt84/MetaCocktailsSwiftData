//
//  ElksClubFizz(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var elksClubWnG = Cocktail(cocktailName: "Elk's Club Fizz (Williams & Graham spec.)",
                           glasswareType: .smallHighball,
                           garnish: [.lemonExpression],
                           author: Author(person: "Peter Sindar", place: "St. Paul, Minnesota", year: "1901"),
                           spec: elksClubSpecWnG,
                           buildOrder: elksClubBuildWnG,
                           tags: elksClubTags)

var elksClubSpecWnG  = [CocktailIngredient(.soda(.sodaWater), value: 2),
                        CocktailIngredient(.juices(.lemon), value: 0.75),
                        CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                        CocktailIngredient(.syrups(.simple), value: 0.75),
                        CocktailIngredient(.fortifiedWines(.sandemanPort), value: 1),
                        CocktailIngredient(.whiskies(.jimBeamRye), value: 1)]

var elksClubBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except the soda water and dry shake."),
                                            Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                            Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain into the soda."),
                                            Instruction(step: 4, method: "You can also choose to top with soda, but I find that the head doesn't get as fluffy that way."),
                                            Instruction(step: 5, method: "Express the lemon and then discard.")])


var elksClubTags = Tags(profiles: [.citrusy, .fruity, .light, .silky],
                        styles: [.sour, .shaken])

