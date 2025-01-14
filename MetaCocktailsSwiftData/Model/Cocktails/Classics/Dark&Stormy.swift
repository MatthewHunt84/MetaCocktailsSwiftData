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
                            buildOrder: darkNStormyBuild,
                            notes: darkAndStormyNote,
                            tags: darkNStormyTags)

var darkNStormySpec  = [OldCocktailIngredient(.soda(.gingerBeer), value: 4, prep: PrepBible.gingerBeer),
                        OldCocktailIngredient(.juices(.lime), value: 0.5),
                        OldCocktailIngredient(.rums(.goslingsBlackSeal), value: 2)]



var darkNStormyTags   = Tags(profiles: [.refreshing, .light, .effervescent],
                             styles: [.fizz, .built])




