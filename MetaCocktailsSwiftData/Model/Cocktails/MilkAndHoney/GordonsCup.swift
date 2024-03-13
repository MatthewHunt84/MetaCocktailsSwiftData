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

var gordonsCupSpec     =  [CocktailIngredient(.fruit(.cucumberSlices), value: 4, unit: .gentlyMuddled),
                           CocktailIngredient(.fruit(.limeWedges), value: 8, unit: .gentlyMuddled),
                           CocktailIngredient(.syrups(.simple), value: 0.75),
                           CocktailIngredient(.gins(.ginLondonDry), value: 2),]

var gordonsCupTags     = Tags(profiles: [.savory, .refreshing, .citrusy, .complex, .spicy, .restorative],
                              styles: [.sour, .shaken])

var gordonsCupBuild = Build(instructions: [Instruction(step: 1, method: "Combine the lime wedges, cucumber, simple syrup, and gin in a cocktail shaker and muddle to extract the juice from the lime without pulverizing the fruit."),
                                           Instruction(step: 2, method: "Fill the shaker with ice and give it 5 to 6 good shakes. "),
                                           Instruction(step: 3, method: "Open the shaker and pour its contents back and forth, separating the lime and cucumber slices from the ice and cocktail; pour the lime and cucumber into a frozen rocks glass, then top off with the ice and liquid. (The muddled lime and cucumber should be at the bottom of the glass; if need be, push the solids to the bottom.)"),
                                           Instruction(step: 4, method: "Add a cocktail straw and a sprinkling of salt and pepper. -Regarding Cocktails, Sasha Petraske")])
