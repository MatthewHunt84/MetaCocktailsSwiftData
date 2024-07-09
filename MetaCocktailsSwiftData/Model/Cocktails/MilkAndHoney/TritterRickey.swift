//
//  TritterRickey.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var tritterRickey  = Cocktail(cocktailName: "Tritter Rickey",
                              glasswareType: .collins,
                              garnish: [.mintSprig],
                              ice: .koldDraft,
                              author: Author(person: AuthorNames.richardBoccato.rawValue,
                                             place: AuthorPlaces.milkAndHoney.rawValue,
                                             year: "Early 2000s"),
                              spec: tritterRickeySpec,
                              buildOrder: tritterRickeyBuild,
                              tags: tritterRickeyTags,
                              variation: nil,
                              collection: .milkAndHoney)

var tritterRickeySpec  = [OldCocktailIngredient(.juices(.lime), value: 1),
                          OldCocktailIngredient(.syrups(.simple), value: 0.75),
                          OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                          OldCocktailIngredient(.gins(.ginAny), value: 2),
                          OldCocktailIngredient(.soda(.sodaWater) , value: 1)]



var tritterRickeyTags   = Tags(profiles: [.citrusy, .effervescent, .light, .herbal],
                               styles: [.collins, .shaken])


var tritterRickeyBuild  = Build(instructions: [Instruction(step: 1, method: "Combine the lime juice, simple syrup, and gin in a cocktail shaker, add 1 large ice cube, and shake vigorously until the drink is sufficiently chilled."),
                                               Instruction(step: 2, method: "Put a large Collins ice cube in a chilled Collins glass and rinse with absinthe."),
                                               Instruction(step: 3, method: "Strain the cocktail into the glass and garnish with a mint sprig and top with soda.")])
