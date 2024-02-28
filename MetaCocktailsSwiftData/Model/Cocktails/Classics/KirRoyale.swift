//
//  KirRoyale.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var kirRoyale = Cocktail(cocktailName: "Kir Royale(1959)",
                         glasswareType: .wineGlass,
                         garnish: [.noGarnish],
                         ice: nil,
                         author: Author(person: "Gaston Gerard" , place: "'Le miroir de coin et de temps'. Dijon: Edition des Etats Generaux de la Gastronomie", year: "1959"),
                         spec: kirRoyaleSpec,
                         tags: kirRoyaleTags,
                         variation: .kirRoyale)

var kirRoyaleSpec  = [CocktailIngredient(.liqueurs(.cremeDeCassis), value: 15, unit: .ml),
                      CocktailIngredient(.wines(.bourgogneAligote), value: 100, unit: .ml)]

var kirRoyaleTags = Tags(profiles: [.dry, .fruity],
                         styles: [.built])



