//
//  LavandulaRosa.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var lavandulaRosa = Cocktail(cocktailName: "Lavandula Rosa",
                             imageAsset: nil,
                             glasswareType: .martini,
                             garnish: [.raspberry],
                             ice: nil,
                             author: justWnG,
                             spec: lavandulaRosaSpec,
                             tags: lavandulaRosaTags,
                             collection: .williamsAndGraham)

let lavandulaRosaSpec = [CocktailIngredient(.fruit(.raspberries), value: 2, unit: .muddled),
                         CocktailIngredient(.juices(.lemon), value: 0.5),
                         CocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBible.honeySyrup),
                         CocktailIngredient(.bitters(.appleBitters), value: 1, unit: .dashes),
                         CocktailIngredient(.otherAlcohol(.lavenderTincture), value: 2, unit: .dashes),
                         CocktailIngredient(.fortifiedWines(.dolinBlanc), value: 0.5),
                         CocktailIngredient(.vodkas(.woodyCreekVodka), value: 1.5)]


let lavandulaRosaTags = Tags(profiles: [.fruity, .refreshing, .light],
                             styles: [.sour, .shaken])



