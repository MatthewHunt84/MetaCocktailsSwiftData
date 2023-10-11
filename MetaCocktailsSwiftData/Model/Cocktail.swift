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

    var id = UUID()
    var cocktailName: String
    var imageName: String
    //var background: Color//gotta fix
    var glasswareType: Glassware
    var garnish: Garnish
    var author: String?
    
    var spec: [CocktailIngredient]
    var buildOrder: Build?
    var tags: Tags
    
    init(name: String, imageName: String, glasswareType: Glassware, garnish: Garnish, author: String? = nil, spec: [CocktailIngredient], buildOrder: Build? = nil, tags: Tags) {
        self.cocktailName = name
        self.imageName = imageName
        //self.background = background
        self.glasswareType = glasswareType
        self.garnish = garnish
        self.author = author
        self.spec = spec
        self.buildOrder = buildOrder
        self.tags = tags
    }
}
