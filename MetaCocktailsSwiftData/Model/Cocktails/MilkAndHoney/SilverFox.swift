//
//  SilverFox.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var silverFox  = Cocktail(cocktailName: "Silver Fox",
                          glasswareType: .fizzGlass,
                          garnish: [.maraschinoCherry, .halfOrangeWheel],
                          ice: nil,
                          author: Author(person: AuthorNames.richardBoccato.rawValue,
                                         place: AuthorPlaces.milkAndHoney.rawValue,
                                         year: "Early 2000s"),
                          spec: silverFoxSpec,
                          buildOrder: silverFoxBuild,
                          tags: silverFoxTags,
                          variation: nil,
                          collection: .milkAndHoney)

var silverFoxSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                      OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                      OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1, unit: .whole),
                      OldCocktailIngredient(.gins(.ginAny), value: 1.5),
                      OldCocktailIngredient(.liqueurs(.amaretto), value: 0.5),
                      OldCocktailIngredient(.soda(.sodaWater) , value: 1.5)]



var silverFoxTags   = Tags(profiles: [.citrusy, .nutty, .light, .silky],
                           styles: [.fizz, .shaken])

