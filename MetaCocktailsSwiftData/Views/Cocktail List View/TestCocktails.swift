//
//  TestCocktails.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/5/24.
//

import Foundation

final class TestCocktails {
    
    
    static var textCocktail1 = Cocktail(cocktailName: "Test Cocktail #1",
                                        glasswareType: Glassware.buenaVistaIrish,
                                        spec: [CocktailIngredient(.amari(.DellErborista), value: 2.0),
                                               CocktailIngredient(.agaves(.elTesoroRepo), value: 2.0),
                                               CocktailIngredient(.juices(.lemon), value: 2.0)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
    
    static var textCocktail2 = Cocktail(cocktailName: "Test Cocktail #2",
                                        glasswareType: Glassware.collins,
                                        spec: [CocktailIngredient(.amari(.DellErborista), value: 2.0),
                                               CocktailIngredient(.agaves(.elTesoroRepo), value: 2.0),
                                               CocktailIngredient(.juices(.lemon), value: 2.0)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .daiquiri,
                                        collection: .custom)
    static var textCocktail3 = Cocktail(cocktailName: "Test Cocktail #3",
                                        glasswareType: Glassware.copperMuleCup,
                                        spec: [CocktailIngredient(.amari(.DellErborista), value: 2.0),
                                               CocktailIngredient(.agaves(.elTesoroRepo), value: 2.0),
                                               CocktailIngredient(.juices(.lemon), value: 2.0)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
    static var textCocktail4 = Cocktail(cocktailName: "Test Cocktail #4",
                                        glasswareType: Glassware.crustaGlass,
                                        spec: [CocktailIngredient(.amari(.DellErborista), value: 2.0),
                                               CocktailIngredient(.agaves(.elTesoroRepo), value: 2.0),
                                               CocktailIngredient(.juices(.lemon), value: 2.0)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
    static var textCocktail5 = Cocktail(cocktailName: "Test Cocktail #5",
                                        glasswareType: Glassware.flute,
                                        spec: [CocktailIngredient(.amari(.DellErborista), value: 2.0),
                                               CocktailIngredient(.agaves(.elTesoroRepo), value: 2.0),
                                               CocktailIngredient(.juices(.lemon), value: 2.0)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
    
    static var textCocktail6 = Cocktail(cocktailName: "Test Cocktail #6",
                                        glasswareType: Glassware.buenaVistaIrish,
                                        spec: cloverClubSpec,
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
    
    static var textCocktail7 = Cocktail(cocktailName: "Test Cocktail #7",
                                        glasswareType: Glassware.collins,
                                        spec: irishCoffeeSpec,
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .daiquiri,
                                        collection: .custom)
    static var textCocktail8 = Cocktail(cocktailName: "Test Cocktail #8",
                                        glasswareType: Glassware.copperMuleCup,
                                        spec: fairAndWarmerSpec,
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .saturn,
                                        collection: .custom)
    static var textCocktail9 = Cocktail(cocktailName: "Test Cocktail #9",
                                        glasswareType: Glassware.crustaGlass,
                                        spec: cosmoSpec,
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .martinez,
                                        collection: .custom)
    static var textCocktail10 = Cocktail(cocktailName: "Test Cocktail #10",
                                        glasswareType: Glassware.flute,
                                        spec: blackberrySageSmashSpec,
                                         tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .mojito,
                                        collection: .custom)
    
    
    
}
