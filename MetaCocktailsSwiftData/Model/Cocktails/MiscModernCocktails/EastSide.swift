//
//  EastSide.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation


var eastSide = Cocktail(cocktailName: "East Side",
                        imageAsset: nil,
                        glasswareType: .collins,
                        garnish: [.mintBouquet, .cucumberSlices],
                        ice: .koldDraft,
                        author: Author(person: AuthorNames.georgeDelgado.rawValue,
                                       place: AuthorPlaces.libation.rawValue,
                                       year: "2004"),
                        spec: eastSideSpec,
                        buildOrder: eastSideBuild,
                        tags: eastSideTags,
                        variation: .eastSide,
                        titleCocktail: true)

let eastSideSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.cucumberSlices), value: 3, unit: .muddled),
                                          OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                          OldCocktailIngredient(.juices(.lime), value: 0.75),
                                          OldCocktailIngredient(.syrups(.richSimple), value: 0.5, prep: PrepBible.richSimple),
                                          OldCocktailIngredient(.gins(.haymansLondonDry), value: 2),
                                          OldCocktailIngredient(.soda(.sparklingWater), value: 2)]

let eastSideTags = Tags(profiles: [.herbal, .refreshing, .light, .effervescent],
                        styles: [.fizz, .shaken])

let eastSideBuild =  Build(instructions: [Instruction(step: 1, method: "Muddle the cucumber in a tin. If you have large cubed ice like Kold Draft, you can shake in the mint, otherwaise give the mind a gentle muddle."),
                                          Instruction(step: 1, method: "Shake all of the ingredients except for the soda in a tin."),
                                          Instruction(step: 2, method: "Add the ice then soda to the glass. Try not to pour the soda directly over the ice"),
                                          Instruction(step: 3, method: "Double strain the shaken cocktail over the soda and ice."),
                                          Instruction(step: 4, method: "Garnish with a mint bouquet. Serve with a straw.")])


