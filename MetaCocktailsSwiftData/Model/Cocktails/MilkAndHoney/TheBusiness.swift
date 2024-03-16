//
//  TheBusiness.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var theBusiness  = Cocktail(cocktailName: "The Business",
                            glasswareType: .coupe,
                            garnish: nil,
                            author: Author(person: AuthorNames.sashaPetraske.rawValue, place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                            spec: theBusinessSpec,
                            tags: theBusinessTags,
                            variation: .beesKnees,
                            collection: .milkAndHoney)

var theBusinessSpec  = [CocktailIngredient(.juices(.lime), value: 1),
                        CocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                        CocktailIngredient(.gins(.ginAny) , value: 2)]


var theBusinessTags   = Tags(profiles: [.citrusy, .refreshing, .light],
                             styles: [.shaken, .sour])

