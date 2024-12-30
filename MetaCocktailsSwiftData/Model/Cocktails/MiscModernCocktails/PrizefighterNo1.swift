//
//  PrizefighterNo1.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var prizefighterNo1 = Cocktail(cocktailName: "Prizefighter",
                               glasswareType: .doubleOld,
                               garnish: [.mintBouquet],
                               ice: .crackedIce,
                               author:Author(person: AuthorNames.nicholasJarrett.rawValue,
                                             place: "Clover Club, New York" ,
                                             year: "2011"),
                               spec: prizefighterNo1Spec,
                               buildOrder: prizefighterNo1Build,
                               tags: prizefighterNo1Tags)

let prizefighterNo1Spec: [OldCocktailIngredient] = [OldCocktailIngredient(.seasoning(.salt), value: 1, unit: .pinch),
                                                    OldCocktailIngredient(.herbs(.mint), value: 6, unit: .gentlyMuddled),
                                                    OldCocktailIngredient(.fruit(.lemonWedges), value: 3, unit: .gentlyMuddled),
                                                    OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                    OldCocktailIngredient(.fortifiedWines(.carpanoAntica), value: 1),
                                                    OldCocktailIngredient(.amari(.fernetBranca), value: 1)]


let prizefighterNo1Tags = Tags(profiles: [.refreshing, .herbal, .restorative],
                               styles: [.sour, .shaken])




