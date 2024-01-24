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
                  CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dash),
                  CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),]

var adonisTags = Tags(flavors: [.lemon],
                      textures: [.thin, .light],
                      styles: [.martini, .stirred])
                   

