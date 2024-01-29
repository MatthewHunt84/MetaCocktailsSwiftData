//
//  BloodyMarry(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bloodyMarryWnG  = Cocktail(cocktailName: "Bloody Marry(W&G)",
                               glasswareType: .collins,
                               garnish: [.olive, .cocktailOnion],
                               author: williamsAndGraham,
                               spec: bloodyMarryWnGSpec,
                               buildOrder: bloodyMarryWnGBuild,
                               tags: bloodyMarryWnGTags)

var bloodyMarryWnGSpec  = [CocktailIngredient(.otherNonAlc(.bloodyMarryMixWnG), value: 4),
                           CocktailIngredient(.vodkas(.vodkaAny), value: 2)]

var bloodyMarryWnGBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients along with the ice and toss from tin to tin."),
                                                Instruction(step: 2, method: "Dirty dump")])

var bloodyMarryWnGTags   = Tags(profiles: [.savory, .rich, .restorative])

