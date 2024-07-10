//
//  HotelNacional.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hotelNacional = Cocktail(cocktailName: "Hotel Nacional",
                             glasswareType: .stemmedGlassware,
                             garnish: [.limeWheel],
                             ice: nil,
                             author:Author(person: "Will P. Taylor", place: "Hotel Nacional, Cuba", year: "1930s"),
                             spec: hotelNacionalSpec,
                             tags: hotelNacionalTags,
                             variation: .hotelNacional,
                             collection: .originals)

var hotelNacionalSpec = [OldCocktailIngredient(.syrups(.simple), value: 0.5),
                         OldCocktailIngredient(.juices(.lime), value: 0.5),
                         OldCocktailIngredient(.juices(.pineappleJuice), value: 1),
                         OldCocktailIngredient(.liqueurs(.apricotLiqueur), value: 0.25),
                         OldCocktailIngredient(.rums(.rumWhite), value: 1.5) ]

var hotelNacionalTags = Tags(profiles: [.fruity, .refreshing, .citrusy, .light, .tropical],
                             styles: [.shaken, .sour])
