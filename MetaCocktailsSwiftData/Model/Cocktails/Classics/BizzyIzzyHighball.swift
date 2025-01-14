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
                                 notes: bizzyIzzyNote,
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


