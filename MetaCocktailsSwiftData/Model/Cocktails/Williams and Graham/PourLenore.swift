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

var pourLenoreSpec = [CocktailIngredient(.otherAlcohol(.burdockRootTincture), value: 1, unit: .dashes),
                      CocktailIngredient(.bitters(.blackWalnut), value: 1, unit: .dashes),
                      CocktailIngredient(.amari(.sfumato), value: 1, unit: .barSpoon),
                      CocktailIngredient(.syrups(.demSyrupOneToOne), value: 2, unit: .barSpoon),
                      CocktailIngredient(.liqueurs(.giffardBanane), value: 0.25),
                      CocktailIngredient(.whiskies(.rittenhouseRye), value: 1.5)]

var pourLenoreTags = Tags(profiles: [.nutty, .bittersweet, .complex, .fruity],
                          styles: [.oldFashioned, .stirred])
