//
//  Flavors.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

protocol IngredientTaggable: CaseIterable, RawRepresentable where RawValue == String {
    var tags: Tags { get }
}



enum Flavor: String, Codable, CaseIterable {
    case agave          = "Agave Nectar"
    case almond         = "Almond"
    case aloe           = "Aloe"
    case allspice       = "Allspice"
    case angelica       = "Angelica"
    case anise          = "Anise"
    case apple          = "Apple"
    case apricot        = "Apricot"
    case bakingSpices   = "Baking Spices"
    case banana         = "Banana"
    case basil          = "Basil"
    case blackPepper    = "Black Pepper"
    case blackberry     = "Blackberry"
    case burdockRoot    = "Burdock Root"
    case bergamot       = "Bergamot"
    case caraway        = "Caraway"
    case carrot         = "Carrot"
    case celery         = "Celery"
    case clementine     = "Clementine"
    case cherry         = "Cherry"
    case cholula        = "Cholula"
    case chestnut       = "Chestnut"
    case chocolate      = "Chocolate"
    case cilantro       = "Cilantro"
    case cinnamon       = "Cinnamon"
    case citrusPeel     = "Citrus Peel"
    case clove          = "Clove"
    case coconut        = "Coconut"
    case coffee         = "Coffee"
    case coriander      = "Coriander"
    case cranberry      = "Cranberry"
    case cucumber       = "Cucumber"
    case currants       = "Currant"
    case elderflower    = "Elderflower"
    case egg            = "Egg"
    case espresso       = "Espresso"
    case gentian        = "Gentian"
    case ginger         = "Ginger"
    case grapefruit     = "Grapefruit"
    case greenChile     = "Green Chile"
    case guava          = "Guava"
    case honey          = "Honey"
    case jalapeño       = "Jalapeño"
    case juniper        = "Juniper"
    case kaffirLimeLeaf = "Kaffir Lime Leaf"
    case lavender       = "Lavender"
    case lemon          = "Lemon"
    case lime           = "Lime"
    case malt           = "Malt"
    case maple          = "Maple"
    case menthol        = "Menthol"
    case mint           = "Mint"
    case melon          = "Melon"
    case molasses       = "Molasses"
    case molé           = "Molé"
    case nutmeg         = "Nutmeg"
    case orange         = "Orange"
    case passionfruit   = "Passionfruit"
    case peanut         = "Peanut"
    case pear           = "Pear"
    case peach          = "Peach"
    case peat           = "Peat"
    case pimento        = "Pimento"
    case pine           = "Pine"
    case pineapple      = "Pineapple"
    case poblanoChile   = "Poblano Chile"
    case pomegranate    = "Pomegranate"
    case raspberry      = "Raspberry"
    case rhubarb        = "Rhubarb"
    case rose           = "Rose"
    case sage           = "Sage"
    case serrano        = "Serrano"
    case sesame         = "Sesame"
    case sloeBerries    = "Sloe Berries (Blackthorn)"
    case strawberry     = "Strawberry"
    case springOnion    = "Ramps (Spring Onion)"
    case tarragon       = "Tarragon"
    case tea            = "Tea"
    case tomato         = "Tomato"
    case umami          = "Umami"
    case vanilla        = "Vanilla"
    case vinegar        = "Vinegar"
    case walnut         = "Walnut"
    case whiteFlower    = "White Flower"

    static var flavorIngredientsDictionary: [Flavor: [String]] {
           let allIngredientTypes: [Any.Type] = [
               Juice.self, Syrup.self, Herbs.self, Fruit.self, Seasoning.self, Soda.self, OtherNA.self,
               Agave.self, Brandy.self, Gin.self, OtherAlcohol.self, Rum.self, Vodka.self, Whiskey.self,
               Liqueur.self, FortifiedWine.self, Wine.self, Bitters.self, Amaro.self
           ]
           
           var flavorDictionary: [Flavor: [String]] = Dictionary(uniqueKeysWithValues: allCases.map { ($0, []) })
           
           func addIngredientsToDictionary<T: IngredientTaggable>(_ type: T.Type) {
               for ingredient in T.allCases {
                   if let flavors = ingredient.tags.flavors {
                       for flavor in flavors {
                           if let flavorEnum = Flavor(rawValue: flavor.rawValue) {
                               flavorDictionary[flavorEnum, default: []].append(ingredient.rawValue)
                           }
                       }
                   }
               }
           }
           
           for ingredientType in allIngredientTypes {
               switch ingredientType {
               case is Juice.Type: addIngredientsToDictionary(Juice.self)
               case is Syrup.Type: addIngredientsToDictionary(Syrup.self)
               case is Herbs.Type: addIngredientsToDictionary(Herbs.self)
               case is Fruit.Type: addIngredientsToDictionary(Fruit.self)
               case is Seasoning.Type: addIngredientsToDictionary(Seasoning.self)
               case is Soda.Type: addIngredientsToDictionary(Soda.self)
               case is OtherNA.Type: addIngredientsToDictionary(OtherNA.self)
               case is Agave.Type: addIngredientsToDictionary(Agave.self)
               case is Brandy.Type: addIngredientsToDictionary(Brandy.self)
               case is Gin.Type: addIngredientsToDictionary(Gin.self)
               case is OtherAlcohol.Type: addIngredientsToDictionary(OtherAlcohol.self)
               case is Rum.Type: addIngredientsToDictionary(Rum.self)
               case is Vodka.Type: addIngredientsToDictionary(Vodka.self)
               case is Whiskey.Type: addIngredientsToDictionary(Whiskey.self)
               case is Liqueur.Type: addIngredientsToDictionary(Liqueur.self)
               case is FortifiedWine.Type: addIngredientsToDictionary(FortifiedWine.self)
               case is Wine.Type: addIngredientsToDictionary(Wine.self)
               case is Bitters.Type: addIngredientsToDictionary(Bitters.self)
               case is Amaro.Type: addIngredientsToDictionary(Amaro.self)
               default: break
               }
           }
           
           return flavorDictionary
       }
}
