//
//  Flavors.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

//"RawRepresentable where RawValue == String" is the conformance that says "The .rawValue of any enum that conforms to IngredientTagsProtocol is going to have a .rawValue of String.
// This allows us to access it easier in flavorIngredientsDictionary below as well as generateComplicatedPredicates later on.
// We also were able to remove "BoozeType" protocol with this because it was the same thing. Now we just have a universal one. 
protocol IngredientTagsProtocol: Codable, CaseIterable, RawRepresentable where RawValue == String {
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
        //create a dict filled with all keys (flavors) but empty values ( empty arrays that will later be filled with matching ingredient names as strings)
        // Dictionary(uniqueKeysWithValues: ) is how you initialize a dictionary, but it requires uniqueKeyValues. We pass in allCases.map { ($0, []) }. allCases referring to all the cases in this enum.
        var flavorDictionary: [Flavor: [String]] = Dictionary(uniqueKeysWithValues: allCases.map { ($0, []) })
        
        //This function takes in any enum with the IngredientTagsProtocol conformance
        func addIngredientsToDict(_ ingredients: [any IngredientTagsProtocol]) {
            //It checks all the ingredients for their flavor tags
            for ingredient in ingredients {
                if let flavors = ingredient.tags.flavors {
                    //if they have flavor tags, it checks to see which flavor matches a flavor in the dict we created. If it matches it, it assigns that ingredient name to the value (ingredient name array).
                    for flavor in flavors {
                        if let flavorEnum = Flavor(rawValue: flavor.rawValue) {
                            flavorDictionary[flavorEnum, default: []].append(ingredient.rawValue)
                            //this is where we needed the conformance "RawRepresentable where RawValue == String" in the protocol. 
                           
                        }
                    }
                }
            }
            //After it checks all of the ingredients and all the flavors of the ingredients, what we're left with is a dict with flavors and associated ingredient names to check in predicateFactory.
        }
        //Finally, take every ingredient enum and run them through addIngredientsToDict to populate with all of our ingredients.
        // N/A ingredients
        addIngredientsToDict(Juice.allCases)
        addIngredientsToDict(Syrup.allCases)
        addIngredientsToDict(Herbs.allCases)
        addIngredientsToDict(Fruit.allCases)
        addIngredientsToDict(Seasoning.allCases)
        addIngredientsToDict(Soda.allCases)
        addIngredientsToDict(OtherNA.allCases)
        
        // Booze ingredients
        addIngredientsToDict(Agave.allCases)
        addIngredientsToDict(Brandy.allCases)
        addIngredientsToDict(Gin.allCases)
        addIngredientsToDict(OtherAlcohol.allCases)
        addIngredientsToDict(Rum.allCases)
        addIngredientsToDict(Vodka.allCases)
        addIngredientsToDict(Whiskey.allCases)
        addIngredientsToDict(Liqueur.allCases)
        addIngredientsToDict(FortifiedWine.allCases)
        addIngredientsToDict(Wine.allCases)
        addIngredientsToDict(Bitters.allCases)
        addIngredientsToDict(Amaro.allCases)
        
        return flavorDictionary
    }
}
