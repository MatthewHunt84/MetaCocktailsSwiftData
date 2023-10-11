//
//  Tags.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

struct Tags: Codable {
    var flavors: [Flavor]
    var profiles: [Profile]
    var textures: [Texture]
    var styles: [Style]
    var spirits: [Spirit]
    
    static func createComponentArray() ->  [CocktailComponent] {
        var array = [CocktailComponent]()
        for flavor in Flavor.allCases {
            array.append(CocktailComponent(for: flavor))
        }
        for spirit in Spirit.allCases {
            array.append(CocktailComponent(for: spirit))
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
