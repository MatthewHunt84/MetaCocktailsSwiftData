//
//  TestCocktails.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/5/24.
//

import Foundation

final class TestCocktails {
    
    
    static var textCocktail1 = Cocktail(cocktailName: "Reading Rainbow",
                                        glasswareType: Glassware.buenaVistaIrish,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)] ,
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
    static var textCocktail4 = Cocktail(cocktailName: "I can go anywhere",
                                        glasswareType: Glassware.crustaGlass,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
    
    static var textCocktail2 = Cocktail(cocktailName: "Take a Look",
                                        glasswareType: Glassware.collins,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .daiquiri,
                                        collection: .custom)
    static var textCocktail3 = Cocktail(cocktailName: "It's in a Book",
                                        glasswareType: Glassware.copperMuleCup,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
   
    static var textCocktail5 = Cocktail(cocktailName: "Reading Rainbow #2",
                                        glasswareType: Glassware.flute,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
    static var textCocktail6 = Cocktail(cocktailName: "Test Cocktail #1",
                                        glasswareType: Glassware.buenaVistaIrish,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                        collection: .custom)
    static var textCocktail7 = Cocktail(cocktailName: "Test Cocktail #2",
                                        glasswareType: Glassware.collins,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .daiquiri,
                                        collection: .custom)
    static var textCocktail8 = Cocktail(cocktailName: "Test Cocktail #3",
                                        glasswareType: Glassware.copperMuleCup,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .saturn,
                                        collection: .custom)
    static var textCocktail9 = Cocktail(cocktailName: "Test Cocktail #4",
                                        glasswareType: Glassware.crustaGlass,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)],
                                        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .martinez,
                                        collection: .custom)
    static var textCocktail10 = Cocktail(cocktailName: "Test Cocktail #5",
                                        glasswareType: Glassware.flute,
                                        spec: [CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                               CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                               CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                               CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)],
                                         tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), variation: .mojito,
                                        collection: .custom)
    
    
    
}
