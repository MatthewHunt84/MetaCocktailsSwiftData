//
//  Stirred&Boozy.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var stirredAndBoozy = Cocktail(cocktailName: "Stirred & Boozy",
                               glasswareType: .doubleOld,
                               garnish: [.orangePeel],
                               ice: .bigRock,
                               author:Author(person: AuthorNames.saydeeCanada.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                               spec: stirredAndBoozySpec,
                               buildOrder: nil,
                               tags: stirredAndBoozyTags,
                               collection: .williamsAndGraham)

var stirredAndBoozySpec  = [CocktailIngredient(.amari(.angosturaAmaro), value: 0.25),
                            CocktailIngredient(.amari(.jagerManifest), value: 0.5),
                            CocktailIngredient(.amari(.luxardoBitterBianco), value: 0.5),
                            CocktailIngredient(.whiskies(.talisker10), value: 1.5)]

var stirredAndBoozyTags = Tags(profiles: [.herbal, .punchy, .spiritForward, .complex],
                               styles: [.stirred, .negroni])
