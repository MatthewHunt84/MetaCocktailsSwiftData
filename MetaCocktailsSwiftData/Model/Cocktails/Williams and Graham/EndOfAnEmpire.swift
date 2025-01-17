//
//  EndOfAnEmpire.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var endOfAnEmpire = Cocktail(cocktailName: "End of an Empire",
                             glasswareType: .doubleOld,
                             garnish: [.orangePeel],
                             ice: .bigRock,
                             author: Author(person: AuthorNames.samJohnson.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                             spec: endOfAnEmpireSpec,
                             tags: endOfAnEmpireTags,
                             collection: .williamsAndGraham)

let endOfAnEmpireSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fortifiedWines(.sherryEastIndia), value: 0.75),
                                               OldCocktailIngredient(.amari(.braulio), value: 0.75),
                                               OldCocktailIngredient(.whiskies(.balvinieDW), value: 1.5)]


let endOfAnEmpireTags = Tags(flavors: [.orange],
                             profiles: [.bittersweet, .spiritForward, .complex, .fruity],
                             styles: [.negroni, .stirred])

