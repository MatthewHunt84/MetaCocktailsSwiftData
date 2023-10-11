//
//  Tags.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

struct Tags: Codable {
    var flavors: [Flavor]
    var textures: [Texture]
    var styles: [Style]
    var baseComponents: [Ingredient]
}
