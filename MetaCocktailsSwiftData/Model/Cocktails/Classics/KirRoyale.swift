//
//  KirRoyale.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var kirRoyale = Cocktail(cocktailName: "Kir Royale",
                         glasswareType: .wineGlass,
                         garnish: [.noGarnish],
                         ice: nil,
                         author: Author(person: "Gaston Gerard" , place: "'Le miroir de coin et de temps'. Dijon: Edition des Etats Generaux de la Gastronomie", year: "1959"),
                         spec: kirRoyaleSpec,
                         tags: kirRoyaleTags,
                         variation: .kirRoyale,
                         collection: .originals,
                         titleCocktail: true)

var kirRoyaleSpec  = [OldCocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.5, unit: .fluidOunces),
                      OldCocktailIngredient(.wines(.bourgogneAligote), value: 3.5, unit: .fluidOunces)]

var kirRoyaleTags = Tags(profiles: [.dry, .fruity],
                         styles: [.built])



