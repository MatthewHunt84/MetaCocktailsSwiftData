//
//  RegalAmburana.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation


var regalAmburana = Cocktail(cocktailName: "Regal Amburana",
                             glasswareType: .coupe,
                             garnish: [.limeWedge],
                             ice: nil,
                             author:Author(person: AuthorNames.gilBouhana.rawValue, place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                             spec: regalAmburanaSpec,
                             buildOrder: nil,
                             tags: regalAmburanaTags,
                             variation: .daiquiri,
                             collection: .milkAndHoney)

var regalAmburanaSpec  = [CocktailIngredient(.juices(.lime), value: 0.875),
                          CocktailIngredient(.syrups(.honeySyrup), value: 0.75),
                          CocktailIngredient(.fruit(.grapefruitPeel), value: 1, unit: .none),
                          CocktailIngredient(.rums(.avuaAmburana), value: 2)]

var regalAmburanaTags = Tags(profiles: [.light, .fruity, .refreshing],
                             styles: [.sour, .shaken])
