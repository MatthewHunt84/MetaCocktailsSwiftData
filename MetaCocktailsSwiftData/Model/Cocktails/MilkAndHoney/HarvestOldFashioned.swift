//
//  HarvestOldFashioned.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var harvestOldFashioned = Cocktail(cocktailName: "Harvest Old Fashioned",
                                   glasswareType: .doubleOld,
                                   garnish: [.lemonPeel, .orangePeel],
                                   ice: .bigRock,
                                   author:Author(person: AuthorNames.sashaPetraske.rawValue,
                                                 place: AuthorPlaces.milkAndHoney.rawValue ,
                                                 year: "Early 2000s"),
                                   spec: harvestOldFashionedSpec,
                                   buildOrder: harvestOldFashionedBuild,
                                   tags: harvestOldFashionedTags,
                                   variation: nil,
                                   collection: .milkAndHoney)

var harvestOldFashionedSpec     =  [CocktailIngredient(.otherNonAlc(.sugarCube), value: 1, unit: .muddled),
                                    CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                                    CocktailIngredient(.bitters(.peychauds), value: 1, unit: .dash),
                                    CocktailIngredient(.brandies(.lairdsApplejack), value: 1),
                                    CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1)]

var harvestOldFashionedTags     = Tags(profiles: [.spiritForward, .bittersweet],
                                       styles: [.oldFashioned, .stirred])

var harvestOldFashionedBuild = Build(instructions: [Instruction(step: 1, method: "Put the sugar cube in an Old Fashioned glass and soak with both bitters. Add club soda and muddle until a paste forms."),
                                                    Instruction(step: 2, method: "Add the brandy and whiskey."),
                                                    Instruction(step: 3, method: "Add a big rock and stir the drink slowly 9 times or so to lightly chill."),
                                                    Instruction(step: 4, method: "Finish with the lemon and orange twists. -Regarding Cocktails, Sasha Petraske")])
