//
//  SingaporeSling(1910).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var singaporeSling = Cocktail(cocktailName: "Singapore Sling",
                              glasswareType: .collins,
                              ice: .koldDraft,
                              author: Author(person: AuthorNames.ngiamTong.rawValue, place: "Raffles Hotel, Singapore", year: "1899-1915"),
                              spec: singaporeSlingSpec,
                              notes: singSlingNotes,
                              tags: singaporeSlingTags,
                              variation: .singaporeSling,
                              collection: .originals,
                              titleCocktail: true)

var singaporeSlingSpec  = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                           OldCocktailIngredient(.syrups(.grenadine), value: 2, unit: .teaspoon, prep: PrepBible.grenadine),
                           OldCocktailIngredient(.juices(.pineappleJuice), value: 4),
                           OldCocktailIngredient(.juices(.lime), value: 0.5),
                           OldCocktailIngredient(.liqueurs(.cherryHeering), value: 0.5),
                           OldCocktailIngredient(.liqueurs(.cointreau), value: 0.25),
                           OldCocktailIngredient(.liqueurs(.benedictine), value: 0.25),
                           OldCocktailIngredient(.gins(.ginAny), value: 1)]

var singaporeSlingTags = Tags(profiles: [.refreshing, .fruity],
                              styles: [.sour, .shaken])

var singSlingNotes = "There's a ton of controversy with the origional recipe here. So we're using what the Raffles hotel claims to be the original recipe."
