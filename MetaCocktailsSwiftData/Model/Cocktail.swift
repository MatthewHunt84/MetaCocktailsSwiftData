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
    
    func getTagSet() -> Tags  {
        // Start an object to append to from the cocktail tags
        let cocktailTags = self.tags
        
        
//        1.  loop over each ingredient
    
        print(self.garnish ?? "opps")
        print(self.glasswareType)
        
        print(self.spec)
        //2. for each ingredient, create an object from the tags variable connected to each ingredient
        //3. for each tags object, check if each array isn't nil, then append to cocktailTags
        // if let tags.flavors {
        //4. append flavors to the cocktail tags object

        //5. convert each array into a set

       //6. return a tags object with a collection of tags from each ingredient combined with the tags from the cocktail

        return cocktailTags
    }
}
