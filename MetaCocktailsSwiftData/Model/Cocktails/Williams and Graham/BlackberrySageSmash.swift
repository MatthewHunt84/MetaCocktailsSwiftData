////
////  BlackberrySageSmash.swift
////  MetaCocktails
////
////  Created by Matt Hunt on 9/1/23.
////

import SwiftUI

var blackberrySageSmash = Cocktail(cocktailName: "Blackberry Sage Smash", 
                                   glasswareType: .doubleOld,
                                   garnish: [.skeweredBlackberryAndSage],
                                   ice: .koldDraft,
                                   author:Author(person: AuthorNames.seanKenyon.rawValue,
                                                 place: AuthorPlaces.williamsAndGraham.rawValue,
                                                 year: "2011") ,
                                   spec: blackberrySageSmashSpec,
                                   buildOrder: blackberrySageSmashBuild,
                                   tags: blackberrySageSmashTags,
                                   collection: .williamsAndGraham)

let blackberrySageSmashSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2),
                                                     OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                     OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                     OldCocktailIngredient(.fruit(.blackBerry), value: 4, unit: .muddled),
                                                     OldCocktailIngredient(.herbs(.sage), value: 4, unit: .gentlyMuddled)]

let blackberrySageSmashTags = Tags(flavors: [.lemon],
                                   profiles: [.fruity, .light, .herbal, .refreshing],
                                   styles: [.sour, .shaken])



