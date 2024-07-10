//
//  BrownDerby(OGRumVersion).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brownDerbyRum = Cocktail(cocktailName: "Brown Derby (Rum)",
                             glasswareType: .stemmedGlassware,
                             author: Author(person: "Esquire", place: "'Potables' column", year: "1939"),
                             spec: brownDerbyRumSpec,
                             tags: brownDerbyRumTags,
                             variation: .brownDerby,
                             collection: .originals)

var brownDerbyRumSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.rums(.rumDark), value: 2),
                                               OldCocktailIngredient(.juices(.lime), value: 1),
                                               OldCocktailIngredient(.otherNonAlc(.mapleSugar), value: 1, unit: .teaspoon)]

var brownDerbyRumTags = Tags(profiles: [.citrusy, .refreshing, .light],
                             styles: [.sour, .shaken])


