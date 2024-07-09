//
//  Oaxacanite.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var oaxacanite = Cocktail(cocktailName: "Oaxacanite",
                          glasswareType: .coupe,
                          garnish: nil,
                          ice: nil,
                          author:Author(person: AuthorNames.benLong.rawValue,
                                        place: AuthorPlaces.milkAndHoney.rawValue,
                                        year: "Early 2000s"),
                          spec: oaxacaniteSpec,
                          buildOrder: nil,
                          tags: oaxacaniteTags,
                          variation: nil,
                          collection: .milkAndHoney)

var oaxacaniteSpec = [OldCocktailIngredient(.juices(.lime), value: 0.75, unit: .fluidOunces),
                      OldCocktailIngredient(.bitters(.angosturaBitters), value: 0.5, unit: .teaspoon),
                      OldCocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                      OldCocktailIngredient(.fruit(.grapefruitPeel), value: 1),
                      OldCocktailIngredient(.agaves(.tequilaBlanco), value: 1),
                      OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1)]

var oaxacaniteTags = Tags(profiles: [.citrusy, .smokey, .light, .complex],
                          styles: [.sour, .shaken])
