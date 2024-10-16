//
//  BizzyIzzyHighball.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var bizzyIzzyHighball = Cocktail(cocktailName: "Bizzy Izzy High Ball",
                                 glasswareType: .fizzGlass,
                                 ice: .koldDraft,
                                 author: Author(person: AuthorNames.tomBullock.rawValue,
                                                place: "The Ideal Bartender",
                                                year: "1917"),
                                 spec: bizzyIzzyHighballSpec,
                                 buildOrder: bizzyIzzyHighballBuild,
                                 notes: bizzyIzzyNotes,
                                 tags: bizzyIzzyHighballTags,
                                 collection: .originals)

var bizzyIzzyHighballSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                              OldCocktailIngredient(.syrups(.pineappleGumSyrup), value: 2, unit: .teaspoon, prep: PrepBible.pineappleGommeSyrup),
                              OldCocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 1),
                              OldCocktailIngredient(.fortifiedWines(.sherryEastIndia), value: 1),
                              OldCocktailIngredient(.soda(.sparklingWater), value: 1),
]

var bizzyIzzyHighballTags = Tags(profiles: [.citrusy, .light, .fruity, .effervescent],
                                 styles: [.collins, .shaken])

var bizzyIzzyHighballBuild = Build(instructions: [Instruction(step: 1, method: "We tried to keep the recipe as close to the one in the book. Though, the book doesn't have soda in the recipe (So feel free to omit), but still labels it as a highball and doesn't mention any sort of garnish."),
                                                  Instruction(step: 2, method: "However, if you do add the sparkling water, add it last after you've shaken and strained the cocktail.")])
