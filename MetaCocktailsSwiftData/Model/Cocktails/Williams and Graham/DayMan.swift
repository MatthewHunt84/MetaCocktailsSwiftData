//
//  DayMan.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/24/24.
//

import Foundation

var dayMan = Cocktail(cocktailName: "Day Man",
                      imageAsset: nil,
                      glasswareType: .doubleOld,
                      garnish: [.grapeFruitNoExpress],
                      ice: .bigRock,
                      author: Author(person: AuthorNames.jamesMenkal.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2024"),
                      spec: dayManSpec,
                      tags: dayManTags,
                      collection: .williamsAndGraham)

let dayManSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.seasoning(.saline), value: 4, unit: .drops, prep: PrepBible.fiveToOneSaline),
                                           OldCocktailIngredient(.otherAlcohol(.notSpicyJalapeñoTincture), value: 1, unit: .dashes, prep: PrepBible.notSpicyJalapenoTincture),
                                           OldCocktailIngredient(.otherAlcohol(.lavenderTincture), value: 1, unit: .dashes, prep: PrepBible.lavenderTincture),
                                           OldCocktailIngredient(.syrups(.cinnamonSyrup), value: 1, unit: .barSpoon, prep: PrepBible.cinnamonSyrup),
                                           OldCocktailIngredient(.fortifiedWines(.dolinBlanc), value: 1),
                                           OldCocktailIngredient(.amari(.suze), value: 1),
                                           OldCocktailIngredient(.whiskies(.larcenyBourbon), value: 1)]


let dayManTags = Tags(profiles: [.spiritForward, .complex, .vegetal, .floral, .punchy],
                      styles: [.negroni, .stirred])

