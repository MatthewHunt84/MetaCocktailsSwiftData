//
//  Tags.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

struct Tags: Codable {
    var flavors: [Flavor]?
    var profiles: [Profile]?
    var textures: [Texture]?
    var styles: [Style]?
    var agave: [Spirit.Agave]?
    var amari: [Spirit.Amari]?
    var bitters: [Spirit.Bitters]?
    var brandy: [Spirit.Brandy]?
    var fortifiedWine: [Spirit.FortifiedWine]?
    var gin: [Spirit.Gin]?
    var liqueur: [Spirit.Liqueur]?
    var other: [Spirit.Other]?
    var rum: [Spirit.Rum]?
    var vodka: [Spirit.Vodka]?
    var whiskies: [Spirit.Whiskies]?
    var wine: [Spirit.Wine]?
    
    static func createComponentArray() ->  [CocktailComponent] {
        var array = [CocktailComponent]()
        for flavor in Flavor.allCases {
            array.append(CocktailComponent(for: flavor))
        }
//        for base in Booze.allCases {
//            array.append(CocktailComponent(for: base))
//        }
        for profile in Profile.allCases {
            array.append(CocktailComponent(for: profile))
        }
        for texture in Texture.allCases {
            array.append(CocktailComponent(for: texture))
        }
        for style in Style.allCases {
            array.append(CocktailComponent(for: style))
        }
        for liqueur in Spirit.Liqueur.allCases {
            array.append(CocktailComponent(for: liqueur, category: SpiritCategory.liqueur))
        }
        for agave in Spirit.Agave.allCases {
            array.append(CocktailComponent(for: agave, category: SpiritCategory.agave))
        }
        for amari in Spirit.Amari.allCases {
            array.append(CocktailComponent(for: amari, category: SpiritCategory.amari))
        }
        for bitters in Spirit.Bitters.allCases {
            array.append(CocktailComponent(for: bitters, category: SpiritCategory.bitters))
        }
        for brandy in Spirit.Brandy.allCases {
            array.append(CocktailComponent(for: brandy, category: SpiritCategory.brandy))
        }
        for fortifiedWine in Spirit.FortifiedWine.allCases {
            array.append(CocktailComponent(for: fortifiedWine, category: SpiritCategory.fortifiedWine))
        }
        for gin in Spirit.Gin.allCases {
            array.append(CocktailComponent(for: gin, category: SpiritCategory.gin))
        }
        for vodka in Spirit.Vodka.allCases {
            array.append(CocktailComponent(for: vodka, category: SpiritCategory.vodka))
        }
        for rum in Spirit.Rum.allCases {
            array.append(CocktailComponent(for: rum, category: SpiritCategory.rum))
        }
        for other in Spirit.Other.allCases {
            array.append(CocktailComponent(for: other, category: SpiritCategory.other))
        }
        for whiskies in Spirit.Whiskies.allCases {
            array.append(CocktailComponent(for: whiskies, category: SpiritCategory.whiskies))
        }
        for wine in Spirit.Wine.allCases {
            array.append(CocktailComponent(for: wine, category: SpiritCategory.wine))
        }
        return array
    }
    
   
}
