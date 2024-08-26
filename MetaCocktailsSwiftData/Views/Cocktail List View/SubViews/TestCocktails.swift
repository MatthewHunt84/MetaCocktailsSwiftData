//
//  TestCocktails.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/5/24.
//

import Foundation


final class TestCocktails {
    static var textCocktail56 = Cocktail(
        cocktailName: "Albertsons",
        glasswareType: Glassware.buenaVistaIrish,
        spec: [
            Ingredient(ingredientBase: IngredientBase(name: "Test ingredient # 1", category: .amari, prep: nil), value: 1.5, unit: .barSpoon),
            Ingredient(ingredientBase: IngredientBase(name: "Test ingredient # 2", category: .agaves, prep: nil), value: 2, unit: .fluidOunces)
        ],
        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
        collection: .custom,
        isCustom: true
    )
    
    static var textCocktail25 = Cocktail(
        cocktailName: "King Soopers",
        glasswareType: Glassware.coupe,
        spec: [
            Ingredient(ingredientBase: IngredientBase(id: UUID(), name: "Fun Stuff", category: .amari, prep: nil), value: 1.5, unit: .barSpoon),
            Ingredient(ingredientBase: IngredientBase(id: UUID(), name: "Blam!", category: .agaves, prep: nil), value: 2, unit: .fluidOunces)
        ],
        tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
        collection: .custom,
        isCustom: true
    )
    
    static var textCocktail1 = Cocktail(cocktailName: "Reading Rainbow",
                                          glasswareType: Glassware.buenaVistaIrish,
                                          spec: [
                                            Ingredient(ingredientBase: IngredientBase(name: "Test ingredient # 12", category: .amari, prep: nil), value: 1.5, unit: .barSpoon),
                                            Ingredient(ingredientBase: IngredientBase(name: "Test ingredient # 23", category: .agaves, prep: nil), value: 2, unit: .fluidOunces)
                                          ] ,
                                          tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                          collection: .custom, isCustom: true)
      
      static var textCocktail2 = Cocktail(cocktailName: "I Can see colors",
                                          glasswareType: Glassware.coupe,
                                          spec: [Ingredient(ingredientBase: IngredientBase(name: "Test ingredient # 44", category: .amari, prep: nil), value: 1.5, unit: .barSpoon),
                                                 Ingredient(ingredientBase: IngredientBase(name: "Test ingredient # 36", category: .agaves, prep: nil), value: 2, unit: .fluidOunces)] ,
                                          tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                          collection: .custom, isCustom: true)
}
