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

var adonisSpec = [CocktailIngredient(.fortifiedWines(.fino), value: 1.5),
                  CocktailIngredient(.fortifiedWines(.dolinRouge), value: 1.5),
                  CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                  CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),]

var adonisTags = Tags(profiles: [ .light, .complex, .bittersweet ],
                      styles: [.martini, .stirred])
                   

