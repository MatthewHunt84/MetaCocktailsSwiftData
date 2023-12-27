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
    var imageAsset: CocktailImage?
    var glasswareType: Glassware
    var garnish: [Garnish]?
    var ice: Ice?
    var author: String?
    var spec: [CocktailIngredient]
    var buildOrder: Build?
    var tags: Tags
    var compiledTags: Tags
    
    init(id: UUID = UUID(), cocktailName: String, imageAsset: CocktailImage? = nil, glasswareType: Glassware, garnish: [Garnish]? = nil, ice: Ice? = nil, author: String? = nil, spec: [CocktailIngredient], buildOrder: Build? = nil, tags: Tags) {
        self.id = id
        self.cocktailName = cocktailName
        self.imageAsset = imageAsset
        self.glasswareType = glasswareType
        self.garnish = garnish
        self.ice = ice
        self.author = author
        self.spec = spec
        self.buildOrder = buildOrder
        self.tags = tags
        self.compiledTags = {
            // when we initialize each cocktail we immediately make a stored property of it's combined cocktail + ingredient tags
            var newCompiledTags = Tags()
            for cocktailIngredient in spec {
                newCompiledTags.merge(with: cocktailIngredient.ingredient.tags)
            }
            return newCompiledTags
        }()
    }
    
//    func compileTags() -> Tags {
//        for cocktailIngredient in self.spec {
//            self.tags.merge(with: cocktailIngredient.ingredient.tags)
//        }
//        return self.tags
//    }
}
