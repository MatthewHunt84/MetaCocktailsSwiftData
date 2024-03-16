//
//  EskimosKiss.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation


var eskimosKiss = Cocktail(cocktailName: "Eskimo's Kiss",
                           imageAsset: nil,
                           glasswareType: .hurricaneGlass,
                           garnish: [.mintBouquet],
                           ice: .pebbleIce,
                           author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                          place: AuthorPlaces.milkAndHoney.rawValue,
                                          year: "2004"),
                           spec: eskimosKissSpec,
                           buildOrder: eskimosKissBuild,
                           tags: eskimosKissTags,
                           variation: nil,
                           collection: .milkAndHoney,
                           titleCocktail: true)

let eskimosKissSpec: [CocktailIngredient] = [CocktailIngredient(.otherNonAlc(.demeraraSugarCube), value: 2, unit: .muddled),
                                             CocktailIngredient(.herbs(.mint), value: 12, unit: .gentlyMuddled),
                                             CocktailIngredient(.juices(.lime), value: 2),
                                             CocktailIngredient(.syrups(.simple), value: 1.5),
                                             CocktailIngredient(.rums(.rumWhite), value: 4)]

let eskimosKissTags = Tags(profiles: [.herbal, .refreshing, .light, .effervescent],
                           styles: [.fizz, .shaken])

let eskimosKissBuild =  Build(instructions: [Instruction(step: 1, method: "Combine the mint leaves and sugar cubes in a cocktail shaker and soak the sugar in the lime juice and simple syrup."),
                                             Instruction(step: 1, method: "Then muddle gently —ideally crushing the sugar into a paste, without more than lightly bruising the mint."),
                                             Instruction(step: 2, method: "Add the rum and swirl the shaker to combine."),
                                             Instruction(step: 3, method: "Pour the drink into a large glass and fill to the top with chunky crushed ice."),
                                             Instruction(step: 4, method: "Garnish with a bouquet of mint sprigs, insert two straws, and drink with someone you want to touch noses with.")])


