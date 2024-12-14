////
////  Caipirinha.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/8/23.
////

import SwiftUI

var caipirinha   = Cocktail(cocktailName: "Caipirinha",
                            glasswareType: .doubleOld,
                            ice: .koldDraft,
                            author:Author(place: "Brazil"),
                            spec: caipirinhaSpec,
                            buildOrder: caipirnhaBuild,
                            notes: caipirnhaNotes,
                            tags: caipirnhaTags)


var caipirinhaSpec = [OldCocktailIngredient(.fruit(.limeHalf), value: 1, unit: .none),
                      OldCocktailIngredient(.otherNonAlc(.granulatedSugar), value: 2, unit: .barSpoon),
                      OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                      OldCocktailIngredient(.rums(.cachaca), value: 2)]
                      
                      



var caipirnhaTags  = Tags(flavors: [.lime],
                          profiles: [.sweet, .citrusy, .light],
                          styles: [.sour, .shaken])
