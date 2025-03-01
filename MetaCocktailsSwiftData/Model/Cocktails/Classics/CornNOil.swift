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
                         notes: cornNOilNote,
                         tags: cornNOilTags,
                         collection: .originals)

var cornNOilSpec  = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                     OldCocktailIngredient(.juices(.lime), value: 0.5),
                     OldCocktailIngredient(.liqueurs(.falernum), value: 0.5),
                     OldCocktailIngredient(.rums(.rumBlackStrap), value: 2)]


var cornNOilTags   = Tags(profiles: [.citrusy, .rich],
                          styles: [.sour, .shaken])
