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

var trinidadSourSpec = [CocktailIngredient(.juices(.lemon), value: 0.75),
                        CocktailIngredient(.syrups(.orgeat), value: 1, prep: PrepBible.orgeat),
                        CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 0.5),
                        CocktailIngredient(.bitters(.angosturaBitters), value: 1.5)]
                        
var trinidadSourTags = Tags(flavors: [.almond, .lemon, .bakingSpices],
                            profiles: [.aromatic, .bitter, .silky, .complex],
                            styles: [.sour, .shaken])
