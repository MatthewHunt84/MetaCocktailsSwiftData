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
    
    func getTagSet() -> Set<String>  {
        
        var tags: Set<String> = []
        
        guard let flavorsTags = self.tags.flavors else {
            return ["Default"]
        }
        
        for flavors in flavorsTags {
          tags.insert(flavors.rawValue)
        }
        
        guard let boozeTags = self.tags.bases else {
            return ["Default"]
        }
        
        for booze in boozeTags {
            tags.insert(booze.rawValue)
        }
        
        guard let profileTags = self.tags.profiles else {
            return ["Default"]
        }
        for profiles in profileTags {
            tags.insert(profiles.rawValue)
        }
        
        guard let styleTags = self.tags.profiles else {
            return ["Default"]
        }
        for styles in styleTags {
            tags.insert(styles.rawValue)
        }
        guard let textureTags = self.tags.profiles else {
            return ["Default"]
        }
        for textures in textureTags {
            tags.insert(textures.rawValue)
        }
        
        return tags
    }
}
