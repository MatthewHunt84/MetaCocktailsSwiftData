//
//  PiscoSour (W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var piscoSourWnG = Cocktail(cocktailName: "Pisco Sour" + wAndGTitleTag,
                            glasswareType: .coupe,
                            garnish: [.angoDeco],
                            ice: nil,
                            author:Author(place: AuthorPlaces.williamsAndGraham.rawValue, year: "2014"),
                            spec: piscoSourSpecWnG,
                            buildOrder: piscoSourBuildWnG,
                            tags: piscoSourTagsWnG,
                            variation: .piscoSour,
                            collection: .williamsAndGraham)

var piscoSourSpecWnG  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                         OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1, unit: .whole),
                         OldCocktailIngredient(.brandies(.peruvianMustoVerde), value: 1.5),
                         OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes)]

var piscoSourTagsWnG = Tags(profiles: [.light, .silky, .fruity, .refreshing],
                            styles: [.sour, .shaken])

