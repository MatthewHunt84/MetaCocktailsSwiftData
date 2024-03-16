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

var oaxacaniteSpec = [CocktailIngredient(.juices(.lime), value: 0.75, unit: .fluidOunces),
                      CocktailIngredient(.bitters(.angosturaBitters), value: 0.5, unit: .teaspoon),
                      CocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                      CocktailIngredient(.fruit(.grapefruitPeel), value: 1),
                      CocktailIngredient(.agaves(.tequilaBlanco), value: 1),
                      CocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1)]

var oaxacaniteTags = Tags(profiles: [.citrusy, .smokey, .light, .complex],
                          styles: [.sour, .shaken])
