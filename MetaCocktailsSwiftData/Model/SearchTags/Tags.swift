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
        
        print("*** self.tags = \(self.booze)")
        
        print("*** new tags = \(tags.booze)")
        
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
        
        // remove duplicates:
        
        if let flavorsArrayThatMightHaveDuplicates = flavors {
            self.flavors = Array<Flavor>(Set(flavorsArrayThatMightHaveDuplicates))
            }
        
        if let boozeArrayThatMightHaveDuplicates = booze {
            self.booze = Array<Booze>(Set(boozeArrayThatMightHaveDuplicates))
            }
        
        if let profilesArrayThatMightHaveDuplicates = profiles {
            self.profiles = Array<Profile>(Set(profilesArrayThatMightHaveDuplicates))
            }
        
        if let texturesArrayThatMightHaveDuplicates = textures {
            self.textures = Array<Texture>(Set(texturesArrayThatMightHaveDuplicates))
            }
        
        
        if let stylesArrayThatMightHaveDuplicates = styles {
            self.styles = Array<Style>(Set(stylesArrayThatMightHaveDuplicates))
            }
        
        
        
        
        print("*** fininsh == \(self.booze)")
        print("*** fininsh == \(self.booze?.count)")
        print("**********************************************")
        print("**********************************************")
        print("**********************************************")
        print("**********************************************")
    }
}


