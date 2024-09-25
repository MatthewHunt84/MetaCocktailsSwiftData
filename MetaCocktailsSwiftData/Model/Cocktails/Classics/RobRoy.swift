////
////  RobRoy.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////
import SwiftUI



var robRoy = Cocktail(cocktailName: "Rob Roy",
                      glasswareType: .stemmedGlassware,
                      garnish: [.maraschinoCherry, .orangeExpress],
                      author: nil,
                      spec: robRoySpec,
                      notes: robRoyNotes,
                      tags: robRoyTags,
                      variation: .manhattan,
                      titleCocktail: false)

var robRoySpec     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                       OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                       OldCocktailIngredient(.whiskies(.scotchBlended), value: 2)]

var robRoyTags     = Tags(flavors: [.orange],
                          profiles: [.spiritForward, .punchy, .fruity],
                          styles: [.manhattan, .stirred])

var robRoyNotes = "The Manhattan, Rob Roy, and Emerald cocktails all emerged in the late 19th century, with the Manhattan serving as the inspiration for the other two. The Manhattan led to the creation of the Rob Roy, substituting Scotch whisky in place of American whiskey. The Emerald meanwhile features Irish whiskey instead."
