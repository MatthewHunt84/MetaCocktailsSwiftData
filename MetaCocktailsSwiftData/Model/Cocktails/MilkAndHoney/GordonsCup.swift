//
//  GordonsCup.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation


var gordonsCup = Cocktail(cocktailName: "Gordon's Cup",
                          glasswareType: .doubleOld,
                          garnish: [.pinchSalt, .pinchPepper],
                          ice: .koldDraft,
                          author:Author(person: AuthorNames.sashaPetraske.rawValue ,place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                          spec: gordonsCupSpec,
                          buildOrder: gordonsCupBuild,
                          tags: gordonsCupTags,
                          collection: .milkAndHoney)

var gordonsCupSpec     =  [OldCocktailIngredient(.fruit(.cucumberSlices), value: 4, unit: .gentlyMuddled),
                           OldCocktailIngredient(.fruit(.limeWedges), value: 8, unit: .gentlyMuddled),
                           OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                           OldCocktailIngredient(.gins(.ginLondonDry), value: 2),]

var gordonsCupTags     = Tags(flavors: [.blackPepper],
                              profiles: [.savory, .refreshing, .citrusy, .complex, .spicy, .restorative],
                              styles: [.sour, .shaken])


