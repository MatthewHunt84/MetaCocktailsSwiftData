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
    var bases: [Booze]?
    
    static func createComponentArray() ->  [CocktailComponent] {
        var array = [CocktailComponent]()
        for flavor in Flavor.allCases {
            array.append(CocktailComponent(for: flavor))
        }
        for base in Booze.allCases {
            array.append(CocktailComponent(for: base))
        }
        for profile in Profile.allCases {
            array.append(CocktailComponent(for: profile))
        }
        for style in Style.allCases {
            array.append(CocktailComponent(for: style))
        }
        return array
    }
}
