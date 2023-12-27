////
////  Paloma.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI


var paloma  = Cocktail(cocktailName: "Paloma",
                       glasswareType: .collins,
                       garnish: [.grapefruitPeel],
                       ice: .koldDraft,
                       spec: palomaSpec,
                       tags: palomaTags)

var palomaSpec  = [CocktailIngredient(.agaves(.tequilaBlanco), value: 2),
                   CocktailIngredient(.juices(.lime), value: 0.5),
                   CocktailIngredient(.seasoning(.salt), value: 1, unit: .pinch),
                   CocktailIngredient(.soda(.grapefruitSoda), value: 3)]

var palomaTags  =  Tags(profiles: [.fruity],
                        textures: [.light, .effervescent],
                        styles: [.built, .sour])
