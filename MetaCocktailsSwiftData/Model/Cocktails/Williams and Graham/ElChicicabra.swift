//
//  ElChicicabra.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var elChicicabra = Cocktail(cocktailName: "El Chicicabra",
                            glasswareType: .doubleOld,
                            garnish: [.flamedOrange],
                            ice: .bigRock,
                            author: Author(person: "Jimmy Kenyon",
                                           place: AuthorPlaces.williamsAndGraham.rawValue,
                                           year: "2019"),
                            spec: elChicicabraSpec,
                            tags: elChicicabraTags,
                            collection: .williamsAndGraham)

let elChicicabraSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.liqueurs(.anchoVerde), value: 0.25),
                                              OldCocktailIngredient(.amari(.suze), value: 0.25),
                                              OldCocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                                              OldCocktailIngredient(.amari(.aperol), value: 0.25),
                                              OldCocktailIngredient(.agaves(.mezcalDelMagueyChichicapa), value: 1.5)]


let elChicicabraTags = Tags(flavors: [.orange],
                            profiles: [.spiritForward, .rich, .smokey, .bittersweet],
                            styles: [.stirred])

