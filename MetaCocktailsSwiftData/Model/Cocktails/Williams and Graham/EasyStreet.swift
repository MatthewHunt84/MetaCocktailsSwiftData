//
//  EasyStreet.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var easyStreet = Cocktail(cocktailName: "Easy Street",
                          glasswareType: .doubleOld,
                          garnish: [.mintSprig, .blackberry, .raspberry],
                          ice: .pebbleIce,
                          author: Author(person: AuthorNames.chadLarson.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue) ,
                          spec: easyStreetSpec,
                          buildOrder: easyStreetBuild,
                          tags: easyStreetTags,
                          collection: .williamsAndGraham)

let easyStreetSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                                            OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                            OldCocktailIngredient(.fruit(.blackBerry), value: 1, unit: .muddled),
                                            OldCocktailIngredient(.fruit(.raspberries), value: 1, unit: .muddled),
                                            OldCocktailIngredient(.fortifiedWines(.byrrh), value: 0.75),
                                            OldCocktailIngredient(.gins(.woodyCreekGin), value: 1.5),
                                            OldCocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                                            OldCocktailIngredient(.fortifiedWines(.sandemanPort), value: 0.25)]

let easyStreetTags = Tags(flavors: [.lemon, .mint],
                          profiles: [.fruity, .light, .herbal],
                          styles: [.sour, .shaken])



