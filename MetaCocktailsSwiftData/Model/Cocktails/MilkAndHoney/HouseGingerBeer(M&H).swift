//
//  HouseGingerBeer(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation


var houseGingerBeer  = Cocktail(cocktailName: "House Ginger Beer(Milk & Honey)",
                                glasswareType: .collins,
                                garnish: nil,
                                ice: .koldDraft,
                                author: sashaPetraske,
                                spec: houseGingerBeerSpec,
                                buildOrder: nil,
                                tags: houseGingerBeerTags,
                                variation: nil,
                                collection: .milkAndHoney)

var houseGingerBeerSpec  = [CocktailIngredient(.juices(.lemon), value: 1),
                            CocktailIngredient(.juices(.pineappleJuice), value: 1),
                            CocktailIngredient(.syrups(.gingerSyrup), value: 1),
                            CocktailIngredient(.syrups(.mapleSyrup), value: 1, unit: .barSpoon),
                            CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                            CocktailIngredient(.soda(.sodaWater) , value: 3)]

var houseGingerBeerTags   = Tags(profiles: [.citrusy, .effervescent, .sharp],
                                 styles: [.nonAlcoholic, .shaken, .fizz])

