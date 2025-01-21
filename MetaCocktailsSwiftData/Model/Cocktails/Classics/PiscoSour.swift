////
////  PiscoSour.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI

var piscoSour = Cocktail(cocktailName: "Pisco Sour",
                         glasswareType: .stemmedGlassware,
                         ice: nil,
                         author:Author(person: "Morris' Bar", place: "Morris' Bar: Lima, Peru", year: "1924"),
                         spec: piscoSourSpec,
                         buildOrder: piscoSourBuild,
                         notes: piscoSourNote,
                         tags: piscoSourTags,
                         variation: .piscoSour,
                         titleCocktail: true)

var piscoSourSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                      OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                      OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                      OldCocktailIngredient(.brandies(.pisco), value: 2),
                      OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes)]

var piscoSourTags = Tags(profiles: [.light, .silky, .fruity, .refreshing],
                         styles: [.sour, .shaken])


