//
//  Adonis.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

var adonis = Cocktail(cocktailName: "Adonis",
                      imageAsset: nil,
                      glasswareType: Glassware.coupe,
                      garnish: [.orangeOrLemon],
                      ice: nil,
                      author:Author(person: "Joe McKone", place: AuthorPlaces.hoffmanHouse.rawValue),
                      spec: adonisSpec,
                      buildOrder: nil,
                      tags: adonisTags)

var adonisSpec = [OldCocktailIngredient(.fortifiedWines(.fino), value: 1.5),
                  OldCocktailIngredient(.fortifiedWines(.dolinRouge), value: 1.5),
                  OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                  OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),]

var adonisTags = Tags(profiles: [ .light, .complex, .bittersweet ],
                      styles: [.martini, .stirred])
                   

