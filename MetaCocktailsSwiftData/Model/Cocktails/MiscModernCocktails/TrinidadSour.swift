////
////  TrinidadSour.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 9/26/23.
////

import SwiftUI


var trinidadSour = Cocktail(cocktailName: "Trinidad Sour",
                            glasswareType: .coupe,
                            garnish: [.noGarnish],
                            author: Author(person: AuthorNames.giuseppeGonzalas.rawValue),
                            spec: trinidadSourSpec,
                            buildOrder: nil,
                            tags: trinidadSourTags)

var trinidadSourSpec = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                        OldCocktailIngredient(.syrups(.orgeat), value: 1, prep: PrepBible.orgeat),
                        OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 0.5),
                        OldCocktailIngredient(.bitters(.angosturaBitters), value: 1.5)]
                        
var trinidadSourTags = Tags(flavors: [.almond, .lemon, .bakingSpices],
                            profiles: [.aromatic, .bitter, .silky, .complex],
                            styles: [.sour, .shaken])
