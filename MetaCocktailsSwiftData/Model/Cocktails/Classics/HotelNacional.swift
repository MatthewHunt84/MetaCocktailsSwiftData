//
//  HotelNacional.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hotelNacional = Cocktail(cocktailName: "Hotel Nacional(1930s)",
                             glasswareType: .stemmedGlassware,
                             garnish: [.limeWheel],
                             ice: nil,
                             author:Author(person: "Will P. Taylor", place: "Hotel Nacional, Cuba", year: "1930s"),
                             spec: hotelNacionalSpec,
                             tags: hotelNacionalTags,
                             variation: .hotelNacional)

var hotelNacionalSpec = [CocktailIngredient(.syrups(.simple), value: 0.5),
                         CocktailIngredient(.juices(.lime), value: 0.5),
                         CocktailIngredient(.juices(.pineappleJuice), value: 1),
                         CocktailIngredient(.liqueurs(.apricotLiqueur), value: 0.25),
                         CocktailIngredient(.rums(.rumWhite), value: 1.5) ]

var hotelNacionalTags = Tags(profiles: [.fruity, .refreshing, .citrusy, .light, .tropical],
                             styles: [.shaken, .sour])
