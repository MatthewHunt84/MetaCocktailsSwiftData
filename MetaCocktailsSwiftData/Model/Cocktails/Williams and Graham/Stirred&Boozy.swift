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

var stirredAndBoozySpec  = [OldCocktailIngredient(.amari(.angosturaAmaro), value: 0.25),
                            OldCocktailIngredient(.amari(.jagerManifest), value: 0.5),
                            OldCocktailIngredient(.amari(.luxardoBitterBianco), value: 0.5),
                            OldCocktailIngredient(.whiskies(.talisker10), value: 1.5)]

var stirredAndBoozyTags = Tags(flavors: [.orange],
                               profiles: [.herbal, .punchy, .spiritForward, .complex],
                               styles: [.stirred, .negroni])
