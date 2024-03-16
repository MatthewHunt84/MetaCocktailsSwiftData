////
////  CropTop.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var cropTop = Cocktail(cocktailName: "Crop Top",
                       glasswareType: .nickAndNora,
                       garnish: [.grapefruitExpression],
                       ice: nil,
                       author: Author(person: AuthorNames.devonTarby.rawValue,
                                      place: AuthorPlaces.deathAndCo.rawValue,
                                      year: "2013"),
                       spec: cropTopSpec,
                       tags: cropTopTags,
                       collection: .deathAndCo)

var cropTopSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                    CocktailIngredient(.gins(.ginLondonDry), value: 0.75),
                    CocktailIngredient(.amari(.amaroMontenegro), value: 0.75),
                    CocktailIngredient(.liqueurs(.giffardPamplemousse), value: 0.75)]


var cropTopTags = Tags(profiles: [.refreshing, .floral, .herbal, .light],
                       styles: [.sour, .shaken])
                       
