//
//  HouseGingerBeer(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation


var houseGingerBeer  = Cocktail(cocktailName: "House Ginger Beer (Milk & Honey)",
                                glasswareType: .collins,
                                garnish: nil,
                                ice: .koldDraft,
                                author: sashaPetraske,
                                spec: houseGingerBeerSpec,
                                buildOrder: nil,
                                tags: houseGingerBeerTags,
                                variation: nil,
                                collection: .milkAndHoney)

var houseGingerBeerSpec  = [OldCocktailIngredient(.juices(.lemon), value: 1),
                            OldCocktailIngredient(.juices(.pineappleJuice), value: 1),
                            OldCocktailIngredient(.syrups(.gingerSyrup), value: 1),
                            OldCocktailIngredient(.syrups(.mapleSyrup), value: 1, unit: .barSpoon),
                            OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                            OldCocktailIngredient(.soda(.sodaWater) , value: 3)]

var houseGingerBeerTags   = Tags(profiles: [.citrusy, .effervescent],
                                 styles: [.nonAlcoholic, .shaken, .fizz])

