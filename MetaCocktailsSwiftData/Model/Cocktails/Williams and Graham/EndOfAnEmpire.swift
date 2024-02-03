//
//  EndOfAnEmpire.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var endOfAnEmpire = Cocktail(cocktailName: "End of an Empire",
                             imageAsset: nil,
                             glasswareType: .doubleOld,
                             garnish: [.orangePeel],
                             ice: .bigRock,
                             author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                             spec: endOfAnEmpireSpec,
                             tags: endOfAnEmpireTags)

let endOfAnEmpireSpec: [CocktailIngredient] = [CocktailIngredient(.fortifiedWines(.sherryEastIndia), value: 0.75),
                                               CocktailIngredient(.amari(.braulio), value: 0.75),
                                               CocktailIngredient(.whiskies(.balvinieDW), value: 1.5)]


let endOfAnEmpireTags = Tags(profiles: [.bittersweet, .spiritForward, .complex, .fruity],
                             styles: [.negroni, .stirred])

