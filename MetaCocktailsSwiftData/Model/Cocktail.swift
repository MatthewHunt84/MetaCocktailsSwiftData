//
//  Cocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import SwiftData
import SwiftUI

@available(iOS 18, *)
@Model
class Cocktail: Equatable, Hashable {
    static func == (lhs: Cocktail, rhs: Cocktail) -> Bool {
        return lhs.cocktailName == rhs.cocktailName
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(cocktailName)
    }
    #Index<Cocktail>([\.cocktailName], [\.collectionName], [\.cocktailName, \.collectionName])
    
    var id = UUID()
    @Attribute(.unique) var cocktailName: String
    var imageAsset: CocktailImage?
    var glasswareType: Glassware
    var garnish: [Garnish]?
    var ice: Ice?
    var author: Author?
    var spec: [CocktailIngredient]
//    @Relationship(deleteRule: .cascade) var spec: [CocktailIngredient]
    var buildOrder: Build?
    @Transient var tags: Tags = Tags()
    var compiledTags: Tags = Tags()
    var variation: Variation?
    var collection: CocktailCollection?
    var collectionName: String
    var titleCocktail: Bool?
  
    
    
    init(id: UUID = UUID(), cocktailName: String, imageAsset: CocktailImage? = nil, glasswareType: Glassware, garnish: [Garnish]? = nil, ice: Ice? = nil, author: Author? = nil, spec: [CocktailIngredient], buildOrder: Build? = nil, tags: Tags, variation: Variation? = nil, collection: CocktailCollection? = nil, titleCocktail: Bool = false) {
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
        self.variation = variation
        self.collection = collection
        self.collectionName = {
            var name = "None"
            if let collection = collection {
                name = collection.collectionName
                return name
            }
            return name
        }()
        self.titleCocktail = titleCocktail
        self.compiledTags = {
            // when we initialize each cocktail we immediately make a stored property of it's combined cocktail + ingredient tags
            var newCompiledTags = Tags()
            for cocktailIngredient in spec {
                let currentCocktailIngredientMergedTags = tags.merge(with: cocktailIngredient.ingredient.tags)
                newCompiledTags = newCompiledTags.merge(with: currentCocktailIngredientMergedTags)
            }
            return newCompiledTags
        }()
        
    }
}


struct PreviewContainer {
    let container: ModelContainer
    
    init(_ types: [any PersistentModel.Type],
         isStoredInMemoryOnly: Bool = true) {
        
        let schema = Schema(types)
        let config = ModelConfiguration(isStoredInMemoryOnly: isStoredInMemoryOnly)
        
        self.container = try! ModelContainer(for: schema, configurations: [config])
        
    }
}
