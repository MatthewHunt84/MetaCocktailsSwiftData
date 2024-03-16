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
                              buildOrder: nil,
                              tags: tritterRickeyTags,
                              variation: nil,
                              collection: .milkAndHoney)

var tritterRickeySpec  = [CocktailIngredient(.juices(.lime), value: 1),
                          CocktailIngredient(.syrups(.simple), value: 0.75),
                          CocktailIngredient(.otherAlcohol(.absinthe), value: 1, unit: .glassRinse),
                          CocktailIngredient(.gins(.ginAny), value: 2),
                          CocktailIngredient(.soda(.sodaWater) , value: 1)]



var tritterRickeyTags   = Tags(profiles: [.citrusy, .effervescent, .light, .herbal],
                               styles: [.collins, .shaken])

