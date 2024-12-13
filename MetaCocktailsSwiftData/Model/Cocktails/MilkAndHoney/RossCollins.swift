//
//  RossCollins.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var rossCollins  = Cocktail(cocktailName: "Ross Collins",
                            glasswareType: .collins,
                            garnish: [.maraschinoCherry, .halfOrangeWheel],
                            ice: .koldDraft,
                            author: Author(person: AuthorNames.samRoss.rawValue,
                                           place: AuthorPlaces.milkAndHoney.rawValue,
                                           year: "Early 2000s"),
                            spec: rossCollinsSpec,
                            buildOrder: rossCollinsBuild,
                            tags: rossCollinsTags,
                            variation: nil,
                            collection: .milkAndHoney)

var rossCollinsSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                        OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                        OldCocktailIngredient(.fruit(.orangeMoons), value: 2, unit: .muddled),
                        OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                        OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2),
                        OldCocktailIngredient(.soda(.sodaWater) , value: 1.5)]



var rossCollinsTags   = Tags(profiles: [.citrusy, .effervescent, .light, .refreshing],
                             styles: [.collins, .shaken])

