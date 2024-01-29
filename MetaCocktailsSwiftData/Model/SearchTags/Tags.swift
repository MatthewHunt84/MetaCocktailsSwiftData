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
    var styles: [Style]?
    var booze: [Booze]?
    var nA: [NAIngredients]?
    
    func merge(with newTags: Tags) -> Tags {
        
        var mergedTags = Tags()
        
        mergedTags.flavors = combine(newTags.flavors, self.flavors)
        mergedTags.profiles = combine(newTags.profiles, self.profiles)
        mergedTags.styles = combine(newTags.styles, self.styles)
        mergedTags.booze = combine(newTags.booze, self.booze)
        mergedTags.nA = combine(newTags.nA, self.nA)
        
        return mergedTags
        
    }
    
    func combine<T: Hashable>(_ arrays: Array<T>?...) -> Array<T> {
        return Array<T>(arrays.compactMap{$0}
                              .compactMap{Set($0)}
                              .reduce(Set<T>()){$0.union($1)})
    }
}


