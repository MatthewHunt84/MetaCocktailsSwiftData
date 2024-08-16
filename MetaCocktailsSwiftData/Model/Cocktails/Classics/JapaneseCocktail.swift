//
//  JapaneseCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation


var japaneseCocktail  = Cocktail(cocktailName: "Japanese Cocktail",
                                 glasswareType: .stemmedGlassware,
                                 garnish: [.lemonPeel],
                                 author: jerryThomas,
                                 spec: japaneseCocktailSpec,
                                 tags: japaneseCocktailTags,
                                 variation: .japanese,
                                 collection: .originals,
                                 titleCocktail: true)

var japaneseCocktailSpec  = [OldCocktailIngredient(.bitters(.aromaticBitters), value: 2, unit: .dashes),
                             OldCocktailIngredient(.syrups(.orgeat), value: 1, prep: PrepBible.orgeat),
                             OldCocktailIngredient(.brandies(.brandyAny) , value: 2)]


var japaneseCocktailTags   = Tags(flavors: [.lemon],
                                  profiles: [.nutty, .sweet, .spiritForward],
                                  styles: [.stirred, .oldFashioned])

