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
                       tags: jupiterTags,
                       collection: .williamsAndGraham)

var jupiterSpec  =  [OldCocktailIngredient(.bitters(.tikiBitters), value: 1, unit: .dashes),
                     OldCocktailIngredient(.juices(.lemon), value: 0.5),
                     OldCocktailIngredient(.syrups(.passionfruitSyrup), value: 0.5, prep: PrepBible.passionfruitSyrupPrep),
                     OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                     OldCocktailIngredient(.otherNonAlc(.coconutMilk), value: 0.5),
                     OldCocktailIngredient(.brandies(.pF1840), value: 2)]

var jupiterTags = Tags(flavors: [.mint],
                       profiles: [.citrusy, .fruity, .nutty, .tropical, .sweet, .refreshing],
                       styles: [.tiki, .shaken, .sour])
