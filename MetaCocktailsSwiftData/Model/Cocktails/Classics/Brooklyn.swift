//
//  Brooklyn.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brooklyn = Cocktail(cocktailName: "Brooklyn",
                        glasswareType: .stemmedGlassware,
                        garnish: [.lemonExpression],
                        author:Author(person: "Jacob A. Grohusko", place: "Jack's Manual, New York", year: "1908"),
                        spec: brooklynSpec,
                        tags: brooklynTags,
                        variation: .brooklyn,
                        collection: .originals,
                        titleCocktail: true)

var brooklynSpec     =  [OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 1, unit: .teaspoon),
                         OldCocktailIngredient(.amari(.amerPicon), value: 1, unit: .teaspoon),
                         OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1.5),
                         OldCocktailIngredient(.whiskies(.straightRye), value: 1.5)]

var brooklynTags     = Tags(flavors: [.lemon],
                            profiles: [.spiritForward, .rich, .complex, .bittersweet],
                            styles: [.manhattan, .stirred])

