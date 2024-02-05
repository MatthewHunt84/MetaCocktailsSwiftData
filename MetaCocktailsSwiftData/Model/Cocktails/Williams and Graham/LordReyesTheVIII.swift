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
                                  author: justWnG,
                                  spec: elOchoRosadoSpec,
                                  tags: elOchoRosadoTags)

var lordReyesTheVIIISpec = [CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                            CocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.5),
                            CocktailIngredient(.fortifiedWines(.amontillado), value: 0.75),
                            CocktailIngredient(.liqueurs(.anchoRayesAncho), value: 0.75),
                            CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1)]

var lordReyesTheVIIITags = Tags(profiles: [.complex, .spicy, .punchy],
                                styles: [.stirred])
