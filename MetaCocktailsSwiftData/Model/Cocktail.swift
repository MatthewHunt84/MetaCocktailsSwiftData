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
class Cocktail: Equatable, Hashable, Identifiable, Codable {
    static func == (lhs: Cocktail, rhs: Cocktail) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    #Index<Cocktail>([\.cocktailName], [\.collectionName], [\.cocktailName, \.collectionName])
    
    var id = UUID()
    @Attribute(.unique) var cocktailName: String
    var imageAsset: CocktailImage?
    var glasswareType: Glassware
    @Relationship(deleteRule: .nullify, inverse: \Garnish.cocktails) var garnish: [Garnish]
    var ice: Ice?
    var author: Author?
    @Relationship(deleteRule: .cascade) var spec: [Ingredient]
    var buildOrder: Build?
    var notes: String?
    @Transient var tags: Tags = Tags()
    var compiledTags: Tags = Tags()
    var variation: Variation?
    var variationName: String?
    var collection: CocktailCollection?
    var isCustomCocktail: Bool
    var collectionName: String
    var titleCocktail: Bool?
    var favorite: Bool

    init(id: UUID = UUID(), cocktailName: String, imageAsset: CocktailImage? = nil, glasswareType: Glassware, garnish: [GarnishList]? = nil, ice: Ice? = nil, author: Author? = nil, spec: [OldCocktailIngredient], buildOrder: Build? = nil, notes: String? = nil, tags: Tags, variation: Variation? = nil, variationName: String? = nil, collection: CocktailCollection? = nil, isCustomCocktail: Bool = false, titleCocktail: Bool = false, favorite: Bool = false) {

        self.id = id
        self.cocktailName = cocktailName
        self.imageAsset = imageAsset
        self.glasswareType = glasswareType
        self.garnish = {
            var newGarnishes: [Garnish] = []
            if let garnishes = garnish {
                for item in garnishes {
                    newGarnishes.append(Garnish(name: item.rawValue))
                }
            } else {
                return newGarnishes
            }
            return newGarnishes
        }()
        self.ice = ice
        self.author = author
        self.spec = spec.map { Ingredient(oldIngredient: $0) }
        self.buildOrder = buildOrder
        self.notes = notes 
        self.tags = tags
        self.variation = variation
        self.variationName = {
            if let variationName = variation {
                return variationName.rawValue
            }
            return nil
        }()
        self.collection = collection
        self.isCustomCocktail = collection == .custom
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
            for oldCocktailIngredient in spec {
                let currentCocktailIngredientMergedTags = tags.merge(with: oldCocktailIngredient.ingredient.tags)
                newCompiledTags = newCompiledTags.merge(with: currentCocktailIngredientMergedTags)
            }
            return newCompiledTags
        }()
        self.favorite = favorite
        
    }
    

    init(cocktailName: String, imageAsset: CocktailImage? = nil, glasswareType: Glassware, garnish: [Garnish] = [], ice: Ice? = nil, author: Author? = nil, spec: [Ingredient], buildOrder: Build? = nil, tags: Tags, variation: Variation? = nil, variationName: String? = nil, collection: CocktailCollection? = nil, isCustomCocktail: Bool = false, titleCocktail: Bool = false, favorite: Bool = false) {

        self.id = UUID()
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
        self.variationName = variationName
        self.collection = collection
        self.collectionName = {
            var name = "None"
            if let collection = collection {
                name = collection.collectionName
                return name
            }
            return name
        }()
        self.isCustomCocktail = isCustomCocktail
        self.titleCocktail = titleCocktail
        self.compiledTags = {
            // when we initialize each cocktail we immediately make a stored property of it's combined cocktail + ingredient tags
            var newCompiledTags = Tags()
            for oldCocktailIngredient in spec {
                let currentCocktailIngredientMergedTags = tags.merge(with: oldCocktailIngredient.ingredientBase.tags ?? Tags())
                newCompiledTags = newCompiledTags.merge(with: currentCocktailIngredientMergedTags)
            }
            return newCompiledTags
        }()
        self.favorite = favorite
    }
    
    // Codable (should probably be extension, but just so it works I'm putting it here. Also we need to remove imageAsset we dont use it)
    
    enum CodingKeys: String, CodingKey {
        case id, cocktailName, imageAsset, glasswareType, garnish, ice, author, spec, buildOrder, notes, compiledTags, variation, variationName, collection, isCustomCocktail, collectionName, titleCocktail, favorite
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        cocktailName = try container.decode(String.self, forKey: .cocktailName)
//        imageAsset = try container.decodeIfPresent(CocktailImage.self, forKey: .imageAsset)
        glasswareType = try container.decode(Glassware.self, forKey: .glasswareType)
        garnish = try container.decode([Garnish].self, forKey: .garnish)
        ice = try container.decodeIfPresent(Ice.self, forKey: .ice)
        author = try container.decodeIfPresent(Author.self, forKey: .author)
        spec = try container.decode([Ingredient].self, forKey: .spec)
        buildOrder = try container.decodeIfPresent(Build.self, forKey: .buildOrder)
        notes = try container.decodeIfPresent(String.self, forKey: .notes)
        compiledTags = try container.decode(Tags.self, forKey: .compiledTags)
        variation = try container.decodeIfPresent(Variation.self, forKey: .variation)
        variationName = try container.decodeIfPresent(String.self, forKey: .variationName)
        collection = try container.decodeIfPresent(CocktailCollection.self, forKey: .collection)
        isCustomCocktail = try container.decode(Bool.self, forKey: .isCustomCocktail)
        collectionName = try container.decode(String.self, forKey: .collectionName)
        titleCocktail = try container.decodeIfPresent(Bool.self, forKey: .titleCocktail)
        favorite = try container.decode(Bool.self, forKey: .favorite)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(cocktailName, forKey: .cocktailName)
//        try container.encodeIfPresent(imageAsset, forKey: .imageAsset)
        try container.encode(glasswareType, forKey: .glasswareType)
        try container.encode(garnish, forKey: .garnish)
        try container.encodeIfPresent(ice, forKey: .ice)
        try container.encodeIfPresent(author, forKey: .author)
        try container.encode(spec, forKey: .spec)
        try container.encodeIfPresent(buildOrder, forKey: .buildOrder)
        try container.encodeIfPresent(notes, forKey: .notes)
        try container.encode(compiledTags, forKey: .compiledTags)
        try container.encodeIfPresent(variation, forKey: .variation)
        try container.encodeIfPresent(variationName, forKey: .variationName)
        try container.encodeIfPresent(collection, forKey: .collection)
        try container.encode(isCustomCocktail, forKey: .isCustomCocktail)
        try container.encode(collectionName, forKey: .collectionName)
        try container.encodeIfPresent(titleCocktail, forKey: .titleCocktail)
        try container.encode(favorite, forKey: .favorite)
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

