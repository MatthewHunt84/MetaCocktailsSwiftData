//
//  ALightInTheDark.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var aLightInTheDark = Cocktail(cocktailName: "A Light in the Dark",
                               imageAsset: nil,
                               glasswareType: .tikiMug,
                               garnish: [.spentLimeShellFlaming, .pineappleFronds],
                               ice: .pebbleIce,
                               author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                               spec: aLightInTheDarkSpec,
                               tags: aLightInTheDarkTags,
                               collection: .williamsAndGraham)

let aLightInTheDarkSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lime), value: 0.25),
                                                 CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                                                 CocktailIngredient(.syrups(.pineappleGumSyrup), value: 1),
                                                 CocktailIngredient(.whiskies(.rittenhouseRye), value: 0.5),
                                                 CocktailIngredient(.fortifiedWines(.fino), value: 1),
                                                 CocktailIngredient(.fortifiedWines(.sandemanPort), value: 1)]


let aLightInTheDarkTags = Tags(profiles: [.refreshing, .complex, .fruity],
                               styles: [.sour, .shaken, .tiki])

