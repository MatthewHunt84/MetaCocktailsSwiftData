//
//  Brooklyn.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brooklyn = Cocktail(cocktailName: "Brooklyn Cocktail",
                         glasswareType: .stemmedGlassware,
                         garnish: [.lemonExpression],
                         author:Author(person: "Jacob A. Grohusko", place: "Jack's Manual, New York", year: "1908"),
                         spec: brooklynSpec,
                         tags: brooklynTags)

var brooklynSpec     =  [CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 1, unit: .teaspoon),
                         CocktailIngredient(.amari(.amerPicon), value: 1, unit: .teaspoon),
                         CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1.5),
                         CocktailIngredient(.whiskies(.straightRye), value: 1.5)]

var brooklynTags     = Tags(profiles: [.spiritForward],
                             textures: [.rich],
                             styles: [.manhattan, .stirred])
                        
