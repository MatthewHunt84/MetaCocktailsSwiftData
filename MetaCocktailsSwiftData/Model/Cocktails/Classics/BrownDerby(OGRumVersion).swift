//
//  BrownDerby(OGRumVersion).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brownDerbyRum = Cocktail(cocktailName: "Brown Derby (OG: Rum Version)",
                             glasswareType: .stemmedGlassware,
                             author: Author(person: "Esquire", place: "'Potables' column", year: "1939"),
                             spec: brownDerbyRumSpec,
                             tags: brownDerbyRumTags)

var brownDerbyRumSpec: [CocktailIngredient] = [CocktailIngredient(.rums(.rumDark), value: 2),
                                               CocktailIngredient(.juices(.lime), value: 1),
                                               CocktailIngredient(.otherNonAlc(.mapleSugar), value: 1, unit: .teaspoon)]

var brownDerbyRumTags = Tags(profiles: [.citrusy, .refreshing, .light],
                             styles: [.sour, .shaken])


