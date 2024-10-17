//
//  ElGeneralisimo.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/24/24.
//

import Foundation

var elGeneralisimo = Cocktail(cocktailName: "El Generalísimo",
                              glasswareType: .doubleOld,
                              garnish: [.orangePeel],
                              ice: .bigRock,
                              author: Author(person: AuthorNames.nicoleLaurita.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                              spec: elGeneralisimoSpec,
                              tags: elGeneralisimoTags,
                              collection: .williamsAndGraham)

let elGeneralisimoSpec = [OldCocktailIngredient(.liqueurs(.licor43), value: 0.5),
                          OldCocktailIngredient(.amari(.sfumato), value: 0.25),
                          OldCocktailIngredient(.rums(.cruzanBlackstrap), value: 0.5),
                          OldCocktailIngredient(.whiskies(.knob120), value: 1.5)]


let elGeneralisimoTags = Tags(flavors: [.orange],
                              profiles: [.punchy, .complex, .rich, .spiritForward, .bittersweet],
                              styles: [.oldFashioned, .stirred])



