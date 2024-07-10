//
//  Aviation.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var aviation  = Cocktail(cocktailName: "Aviation",
                         glasswareType: .martini,
                         garnish: [.maraschinoCherry],
                         author: Author(person: AuthorNames.hugoEnsslin.rawValue, place: "'Recipes for Mixed Drinks'", year: "1916"),
                         spec: aviationSpec,
                         tags: aviationTags,
                         collection: .originals)

var aviationSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                     OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                     OldCocktailIngredient(.liqueurs(.cremeDeViolette), value: 1, unit: .teaspoon),
                     OldCocktailIngredient(.gins(.ginLondonDry) , value: 2)]


var aviationTags   = Tags(profiles: [.citrusy, .tart, .light],
                          styles: [.shaken,.sour, .daisy])
