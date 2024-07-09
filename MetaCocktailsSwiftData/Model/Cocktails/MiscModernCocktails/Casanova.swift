//
//  Casanova.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var casanovaCocktail  =  Cocktail(cocktailName: "Casanova Cocktail",
                                  glasswareType: .doubleOldSmokedSalt,
                                  garnish: [.cilantroSprig],
                                  ice: .bigRock,
                                  author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                                place: "5280, The Cookbook. Pg. 140", year: "2014"),
                                  spec: casanovaCocktailSpec,
                                  buildOrder: nil,
                                  tags: casanovaCocktailTags)

var casanovaCocktailSpec = [OldCocktailIngredient(.herbs(.cilantro), value: 10, unit: .gentlyMuddled),
                            OldCocktailIngredient(.juices(.lime), value: 0.75),
                            OldCocktailIngredient(.syrups(.agaveSyrup), value: 0.75, prep: PrepBible.agaveSyrup),
                            OldCocktailIngredient(.otherNonAlc(.vanillaExtract), value: 4, unit: .drops),
                            OldCocktailIngredient(.otherAlcohol(.jalapeñoTincture), value: 2, unit: .dashes),
                            OldCocktailIngredient(.agaves(.tequilaFortalezaRepo), value: 2)]

var casanovaCocktailTags = Tags(profiles: [.refreshing, .herbal, .restorative, .spicy],
                                styles: [.sour, .shaken])
