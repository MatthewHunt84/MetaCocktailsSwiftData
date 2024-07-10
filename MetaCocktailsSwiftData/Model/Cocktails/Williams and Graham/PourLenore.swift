//
//  PourLenore.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation

var pourLenore  =  Cocktail(cocktailName: "Pour Lenore",
                            glasswareType: .doubleOld,
                            garnish: [.lemonExpression],
                            ice: .bigRock,
                            author:Author(person: "Alexander Hammes",
                                          place: AuthorPlaces.williamsAndGraham.rawValue, year: "Spring, 2022"),
                            spec: pourLenoreSpec,
                            buildOrder: nil,
                            tags: pourLenoreTags,
                            collection: .williamsAndGraham)

var pourLenoreSpec = [OldCocktailIngredient(.otherAlcohol(.burdockRootTincture), value: 1, unit: .dashes),
                      OldCocktailIngredient(.bitters(.blackWalnut), value: 1, unit: .dashes),
                      OldCocktailIngredient(.amari(.sfumato), value: 1, unit: .barSpoon),
                      OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 2, unit: .barSpoon),
                      OldCocktailIngredient(.liqueurs(.giffardBanane), value: 0.25),
                      OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 1.5)]

var pourLenoreTags = Tags(profiles: [.nutty, .bittersweet, .complex, .fruity],
                          styles: [.oldFashioned, .stirred])
