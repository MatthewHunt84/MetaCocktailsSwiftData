//
//  Brancolada.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/9/24.
//


import Foundation

var brancolada  = Cocktail(cocktailName: "Brancolada",
                           glasswareType: .collins,
                           garnish: [.halfOrangeWheel, .mintBouquet],
                           ice: .pebbleIce,
                           author: Author(person: "Jeremy Oertel" , place: "Donna. Brooklyn, New York"),
                           spec: brancoladaSpec,
                           tags: brancoladaTags,
                           variation: .pinaColada)

var brancoladaSpec  = [OldCocktailIngredient(.amari(.fernetBrancaMenta), value: 1),
                       OldCocktailIngredient(.rums(.appletonEstateSignatureBlend), value: 1),
                       OldCocktailIngredient(.juices(.pineappleJuice), value: 1.5),
                       OldCocktailIngredient(.juices(.orange), value: 0.25),
                       OldCocktailIngredient(.syrups(.cocoLopez), value: 0.75),
                       OldCocktailIngredient(.otherNonAlc(.coconutWater), value: 0.25)]


var brancoladaTags   = Tags(flavors: [.mint, .coconut], profiles: [.creamy, .tropical], styles: [.flip, .shaken])

