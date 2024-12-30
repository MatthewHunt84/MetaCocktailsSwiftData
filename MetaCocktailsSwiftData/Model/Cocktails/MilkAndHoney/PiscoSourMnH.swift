//
//  PiscoSourMnH.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var piscoSourMnH = Cocktail(cocktailName: "Pisco Sour" + mAndHVersionTag,
                            glasswareType: .coupe,
                            garnish: [.cinnamon],
                            ice: nil,
                            author:Author(place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                            spec: piscoSourSpecMnH,
                            buildOrder: piscoSourBuildMnH,
                            tags: piscoSourTagsMnH,
                            variation: .piscoSour,
                            collection: .milkAndHoney)

var piscoSourSpecMnH  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                         OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1, unit: .whole),
                         OldCocktailIngredient(.brandies(.pisco), value: 2),
                         OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes)]

var piscoSourTagsMnH = Tags(flavors: [.cinnamon],
                            profiles: [.light, .silky, .fruity, .refreshing],
                            styles: [.sour, .shaken])



