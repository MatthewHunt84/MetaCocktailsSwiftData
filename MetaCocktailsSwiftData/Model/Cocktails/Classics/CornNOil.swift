//
//  CornNOil.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var cornNOil  = Cocktail(cocktailName: "Corn 'n' Oil",
                        glasswareType: .doubleOld,
                        garnish: [.noGarnish],
                         ice: .crackedIce,
                        spec: cornNOilSpec,
                        tags: cornNOilTags)

var cornNOilSpec  = [CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                     CocktailIngredient(.juices(.lime), value: 0.5),
                     CocktailIngredient(.liqueurs(.falernum), value: 0.5),
                    CocktailIngredient(.rums(.rumBlackStrap), value: 2)]


var cornNOilTags   = Tags(profiles: [.citrusy],
                          textures: [.rich],
                         styles: [.sour, .shaken])
                      
