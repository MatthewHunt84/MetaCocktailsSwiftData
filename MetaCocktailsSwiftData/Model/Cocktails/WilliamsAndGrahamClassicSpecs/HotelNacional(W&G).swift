//
//  HotelNacional(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation


var hotelNacionalWnG = Cocktail(cocktailName: "Hotel Nacional(W&G Version)",
                                glasswareType: .stemmedGlassware,
                                garnish: [.limeWheel],
                                ice: nil,
                                author: williamsAndGraham,
                                spec: hotelNacionalSpecWnG,
                                tags: hotelNacionalTagsWnG,
                                variation: .hotelNacional,
                                collection: .williamsAndGraham)

var hotelNacionalSpecWnG = [CocktailIngredient(.syrups(.simple), value: 0.25),
                            CocktailIngredient(.juices(.lime), value: 0.5),
                            CocktailIngredient(.juices(.pineappleJuice), value: 1),
                            CocktailIngredient(.liqueurs(.giffardAbricot), value: 0.25),
                            CocktailIngredient(.rums(.plantation3Star), value: 2) ]

var hotelNacionalTagsWnG = Tags(profiles: [.fruity, .refreshing, .citrusy, .light, .tropical],
                                styles: [.shaken, .sour])
