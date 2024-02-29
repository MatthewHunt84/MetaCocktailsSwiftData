//
//  Jupiter(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var jupiter = Cocktail(cocktailName: "Jupiter(W&G)",
                       glasswareType: .collins,
                       garnish: [.mintSprig, .halfOrangeWheel],
                       ice: .pebbleIce,
                       author: Author(person: AuthorNames.jamesMenkal.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                       spec: jupiterSpec,
                       tags: jupiterTags)

var jupiterSpec  =  [CocktailIngredient(.bitters(.tikiBitters), value: 1, unit: .dash),
                     CocktailIngredient(.juices(.lemon), value: 0.5),
                     CocktailIngredient(.syrups(.passionfruitSyrup), value: 0.5),
                     CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                     CocktailIngredient(.otherNonAlc(.coconutMilk), value: 0.5),
                     CocktailIngredient(.brandies(.pF1840), value: 2)]

var jupiterTags = Tags( profiles: [.citrusy, .fruity, .nutty, .tropical, .sweet, .refreshing],
                        styles: [.tiki, .shaken, .sour])
