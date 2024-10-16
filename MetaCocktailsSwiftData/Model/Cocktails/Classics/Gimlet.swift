//
//  Gimlet.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/17/24.
//

import SwiftUI

var houseGimlet = Cocktail(cocktailName: "Gimlet" + houseTag,
                           glasswareType: .stemmedGlassware,
                           garnish: [.limeWheel],
                           ice: nil,
                           spec: gimletSpec,
                           buildOrder: nil,
                           tags: gimletTags,
                           variation: .gimlet,
                           collection: .house)

var gimletSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                   OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                   OldCocktailIngredient(.gins(.ginAny), value: 2),]

var gimletTags = Tags(profiles: [.citrusy, .refreshing, .light],
                      styles: [.sour, .shaken])

