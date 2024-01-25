//
//  Dark&Stormy.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var darkNStormy  = Cocktail(cocktailName: "Dark & Stormy",
                          glasswareType: .collins,
                          garnish: [.limeWheel],
                          ice: .koldDraft,
                          spec: darkNStormySpec,
                          tags: darkNStormyTags)

var darkNStormySpec  = [CocktailIngredient(.soda(.gingerBeer), value: 4),
                        CocktailIngredient(.juices(.lime), value: 0.5),
                        CocktailIngredient(.rums(.goslingsBlackSeal), value: 2, unit: .fluidOuncesFloated)]



var darkNStormyTags   = Tags(profiles: [.refreshing, .light, .effervescent],
                           styles: [.fizz, .built])

