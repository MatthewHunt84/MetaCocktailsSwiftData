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
                               buildOrder: wprizefighterNo1Build,
                               tags: prizefighterNo1Tags)

let prizefighterNo1Spec: [OldCocktailIngredient] = [OldCocktailIngredient(.seasoning(.salt), value: 1, unit: .pinch),
                                                    OldCocktailIngredient(.herbs(.mint), value: 6, unit: .gentlyMuddled),
                                                    OldCocktailIngredient(.fruit(.lemonWedges), value: 3, unit: .gentlyMuddled),
                                                    OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                    OldCocktailIngredient(.fortifiedWines(.carpanoAntica), value: 1),
                                                    OldCocktailIngredient(.amari(.fernetBranca), value: 1)]


let prizefighterNo1Tags = Tags(profiles: [.refreshing, .herbal, .restorative],
                               styles: [.sour, .shaken])

let wprizefighterNo1Build =  Build(instructions: [Instruction(step: 1, method: "Muddle the mint and lemon wedges together with the simple, putting the force mostely on the lemon wedges. Try not to muddle the mint too much. If you'd rather just use lemon juice, just use 3/4 of an ounce while still shaking in the fresh mint."),
                                                  Instruction(step: 2, method: "Add all of the rest of the ingredients and shake."),
                                                  Instruction(step: 3, method: "Double strain the shaken cocktail into D.O.F. glass and top with crushed or cracked ice."),
                                                  Instruction(step: 4, method: "Garnish with a mint bouquet.")])

let prizeFighterNotes = "Simply named 'Prizefighter' when it debuted on the menu at Julie Reiner's Clover Club in Manhattan, the 'Prizefighter No. 1' designation was appended only after subsequent iterations of the drink found their way onto the menu."
