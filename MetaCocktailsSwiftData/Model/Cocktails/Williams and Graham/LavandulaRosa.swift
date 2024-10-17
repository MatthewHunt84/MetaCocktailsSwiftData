//
//  LavandulaRosa.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var lavandulaRosa = Cocktail(cocktailName: "Lavandula Rosa",
                             glasswareType: .martini,
                             garnish: [.raspberry],
                             ice: nil,
                             author: Author(person: AuthorNames.jasonPatz.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                             spec: lavandulaRosaSpec,
                             tags: lavandulaRosaTags,
                             collection: .williamsAndGraham)

let lavandulaRosaSpec = [OldCocktailIngredient(.fruit(.raspberries), value: 2, unit: .muddled),
                         OldCocktailIngredient(.juices(.lemon), value: 0.5),
                         OldCocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBible.honeySyrup),
                         OldCocktailIngredient(.bitters(.appleBitters), value: 1, unit: .dashes),
                         OldCocktailIngredient(.otherAlcohol(.lavenderTincture), value: 2, unit: .dashes, prep: PrepBible.lavenderTincture),
                         OldCocktailIngredient(.fortifiedWines(.dolinBlanc), value: 0.5),
                         OldCocktailIngredient(.vodkas(.woodyCreekVodka), value: 1.5)]


let lavandulaRosaTags = Tags(profiles: [.fruity, .refreshing, .light],
                             styles: [.sour, .shaken])



