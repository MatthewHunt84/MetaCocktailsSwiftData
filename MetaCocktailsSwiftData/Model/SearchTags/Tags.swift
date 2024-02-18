//
//  Tags.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Tags: Codable {
    var flavors: [Flavor]?
    var profiles: [Profile]?
    var styles: [Style]?
    var booze: [Booze]?
    var nA: [NAIngredients]?
    
    init(flavors: [Flavor]? = nil, profiles: [Profile]? = nil, styles: [Style]? = nil, booze: [Booze]? = nil, nA: [NAIngredients]? = nil) {
        self.flavors = flavors
        self.profiles = profiles
        self.styles = styles
        self.booze = booze
        self.nA = nA
    }
    
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
    
    // MARK: - @Model codable conformance
    
    enum CodingKeys: CodingKey {
        case flavors, profiles, styles, booze, nA
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.flavors = try container.decode([Flavor].self, forKey: .flavors)
        self.profiles = try container.decode([Profile].self, forKey: .profiles)
        self.styles = try container.decode([Style].self, forKey: .styles)
        self.booze = try container.decode([Booze].self, forKey: .booze)
        self.nA = try container.decode([NAIngredients].self, forKey: .nA)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(flavors, forKey: .flavors)
        try container.encode(profiles, forKey: .profiles)
        try container.encode(styles, forKey: .styles)
        try container.encode(booze, forKey: .booze)
        try container.encode(nA, forKey: .nA)
    }
}


