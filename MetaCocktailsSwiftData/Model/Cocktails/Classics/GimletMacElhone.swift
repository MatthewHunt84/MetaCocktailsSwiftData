//
//  GimletMacElhone.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var gimletMcElhone = Cocktail(cocktailName: "Gimlet",
                              glasswareType: .stemmedGlassware,
                              garnish: [.limeWheel],
                              ice: nil,
                              author: Author(person: AuthorNames.harryMcElhone.rawValue, place: AuthorPlaces.abcOfMixingCocktails.rawValue, year: "1923"),
                              spec: gimletMcElhoneSpec,
                              buildOrder: gimletMcElhoneBuild,
                              tags: gimletMcElhoneTags,
                              variation: .gimlet,
                              collection: .originals,
                              titleCocktail: true,
                              historicSpec: .gimlet)

var gimletMcElhoneSpec  = [OldCocktailIngredient(.syrups(.limeCordial), value: 1.5, prep: PrepBible.limeCordial),
                           OldCocktailIngredient(.gins(.plymouth), value: 1.5),]

var gimletMcElhoneTags = Tags(profiles: [.citrusy, .refreshing, .light],
                              styles: [.sour, .shaken, .stirred])

var gimletMcElhoneBuild = Build(instructions: [Instruction(step: 1, method: "Stir, and serve in same glass. Can be iced if desired. A very popular beverage of the Navy. -Harry McElhone")])
