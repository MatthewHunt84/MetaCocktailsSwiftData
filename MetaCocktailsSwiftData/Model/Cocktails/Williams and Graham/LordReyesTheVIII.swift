//
//  LordReyesTheVIII.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var lordReyesTheVIII  =  Cocktail(cocktailName: "Lord Reyes the VIII ",
                                  glasswareType: .doubleOld,
                                  garnish: [.orangePeel],
                                  ice: .bigRock,
                                  author: Author(person: AuthorNames.nickTouch.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                                  spec: elOchoRosadoSpec,
                                  tags: elOchoRosadoTags,
                                  collection: .williamsAndGraham)

var lordReyesTheVIIISpec = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                            OldCocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.5),
                            OldCocktailIngredient(.fortifiedWines(.amontillado), value: 0.75),
                            OldCocktailIngredient(.liqueurs(.anchoRayesAncho), value: 0.75),
                            OldCocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1)]

var lordReyesTheVIIITags = Tags(flavors: [.orange],
                                profiles: [.complex, .spicy, .punchy],
                                styles: [.stirred])
