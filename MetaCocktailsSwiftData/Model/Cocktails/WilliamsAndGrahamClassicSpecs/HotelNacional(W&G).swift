//
//  HotelNacional(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation


var hotelNacionalWnG = Cocktail(cocktailName: "Hotel Nacional (W&G Version)",
                                glasswareType: .stemmedGlassware,
                                garnish: [.limeWheel],
                                ice: nil,
                                author: williamsAndGraham,
                                spec: hotelNacionalSpecWnG,
                                tags: hotelNacionalTagsWnG,
                                variation: .hotelNacional,
                                collection: .williamsAndGraham)

var hotelNacionalSpecWnG = [OldCocktailIngredient(.syrups(.simple), value: 0.25),
                            OldCocktailIngredient(.juices(.lime), value: 0.5),
                            OldCocktailIngredient(.juices(.pineappleJuice), value: 1),
                            OldCocktailIngredient(.liqueurs(.giffardAbricot), value: 0.25),
                            OldCocktailIngredient(.rums(.plantation3Star), value: 2) ]

var hotelNacionalTagsWnG = Tags(profiles: [.fruity, .refreshing, .citrusy, .light, .tropical],
                                styles: [.shaken, .sour])
