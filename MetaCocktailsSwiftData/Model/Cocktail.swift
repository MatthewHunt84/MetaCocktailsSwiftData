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
    }
    
    func CompileTags() -> Tags {
        
        var compileTags = self.tags

//        for ingredient in self.spec {
//           
//            if let flavors = ingredient.ingredient.tags.flavors {
//                for flavor in flavors {
//                    
//                    if compileTags.flavors?.append(flavor) == nil {
//                        compileTags.flavors = [flavor]
//                    }
//                }
//                compileTags.flavors = Array(Set(compileTags.flavors!))
//            }
//            if let profiles = ingredient.ingredient.tags.profiles {
//                for profile in profiles {
//                    if compileTags.profiles?.append(profile) == nil {
//                        compileTags.profiles = [profile]
//                    }
//                }
//                compileTags.profiles = Array(Set(compileTags.profiles!))
//            }
//            if let styles =  ingredient.ingredient.tags.styles {
//                for style in styles {
//                    if compileTags.styles?.append(style) == nil {
//                        compileTags.styles = [style]
//                    }
//                }
//                compileTags.styles = Array(Set(compileTags.styles!))
//            }
//            if let textures = ingredient.ingredient.tags.textures {
//                for texture in textures {
//                    if compileTags.textures?.append(texture) == nil {
//                        compileTags.textures = [texture]
//                    }
//                }
//                compileTags.textures = Array(Set(compileTags.textures!))
//            }
//            
//            
//        }

        return compileTags
    }

}
