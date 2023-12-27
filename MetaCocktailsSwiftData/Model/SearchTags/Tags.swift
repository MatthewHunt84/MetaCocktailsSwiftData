//
//  Tags.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation
import SwiftUI

struct Tags: Codable {
    var flavors: [Flavor]?
    var profiles: [Profile]?
    var textures: [Texture]?
    var styles: [Style]?
    var booze: [Booze]?
    
    func merge(with newTags: Tags) -> Tags {
        
        var mergedTags = Tags()
        
        mergedTags.flavors = combine(newTags.flavors, self.flavors)
        mergedTags.profiles = combine(newTags.profiles, self.profiles)
        mergedTags.textures = combine(newTags.textures, self.textures)
        mergedTags.styles = combine(newTags.styles, self.styles)
        mergedTags.booze = combine(newTags.booze, self.booze)
        
        return mergedTags
        
    }
    
    func combine<T: Hashable>(_ arrays: Array<T>?...) -> Array<T> {
        return Array<T>(arrays.compactMap{$0}.compactMap{Set($0)}.reduce(Set<T>()){$0.union($1)})
    }
        

}


