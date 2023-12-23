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
    
}
