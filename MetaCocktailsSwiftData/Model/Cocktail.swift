//
//  Cocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import SwiftData
import SwiftUI

@Model
class Cocktail {
    
    @Attribute(.unique)
    var name: String
    var imageName: String
    var background: Color
    var glasswareType: Glassware
    var garnish: Garnish
    var author: String?
    
    var spec: [CocktailIngredient]
    var buildOrder: Build?
    var tags: Tags
    
    init(name: String, imageName: String, background: Color, glasswareType: Glassware, garnish: Garnish, author: String? = nil, spec: [CocktailIngredient], buildOrder: Build? = nil, tags: Tags) {
        self.name = name
        self.imageName = imageName
        self.background = background
        self.glasswareType = glasswareType
        self.garnish = garnish
        self.author = author
        self.spec = spec
        self.buildOrder = buildOrder
        self.tags = tags
    }
}
