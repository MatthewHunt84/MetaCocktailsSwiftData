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
                          OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                          OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                          OldCocktailIngredient(.gins(.ginAny), value: 2),
                          OldCocktailIngredient(.soda(.sodaWater) , value: 1)]



var tritterRickeyTags   = Tags(flavors: [.mint],
                               profiles: [.citrusy, .effervescent, .light, .herbal],
                               styles: [.collins, .shaken])



