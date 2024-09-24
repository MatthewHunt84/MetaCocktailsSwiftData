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
                         notes: cornNOilNotes,
                         tags: cornNOilTags,
                         collection: .originals)

var cornNOilSpec  = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                     OldCocktailIngredient(.juices(.lime), value: 0.5),
                     OldCocktailIngredient(.liqueurs(.falernum), value: 0.5),
                     OldCocktailIngredient(.rums(.rumBlackStrap), value: 2)]


var cornNOilTags   = Tags(profiles: [.citrusy, .rich],
                          styles: [.sour, .shaken])
                      
var cornNOilNotes = "The Corn 'n' Oil cocktail likely originated in Barbados during the 18th century. Its intriguing name is derived from a biblical passage in Deuteronomy, which refers to gathering 'corn, wine, and oil.'Like other cocktails with such a long history, it fails to produce a noteable author."
