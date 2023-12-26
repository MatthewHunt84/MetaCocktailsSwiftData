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
    
    mutating func merge(with tags: Tags) {
        
        if let newFlavors = tags.flavors {
            if self.flavors == nil {
                self.flavors = tags.flavors
            } else {
                self.flavors?.append(contentsOf: newFlavors)
            }
        }
        
        if let newProfiles = tags.profiles {
            if self.profiles == nil {
                self.profiles = tags.profiles
            } else {
                self.profiles?.append(contentsOf: newProfiles)
            }
        }
        
        if let newBooze = tags.booze {
            if self.booze == nil {
                self.booze = tags.booze
            } else {
                self.booze?.append(contentsOf: newBooze)
            }
        }
        
        if let newTextures = tags.textures  {
            if self.textures == nil {
                self.textures = tags.textures
            } else {
                self.textures?.append(contentsOf: newTextures)
            }
            
            if let newStyles = tags.styles {
                if self.styles == nil {
                    self.styles = tags.styles
                } else {
                    self.styles?.append(contentsOf: newStyles)
                }
            }
        }
    }
}


