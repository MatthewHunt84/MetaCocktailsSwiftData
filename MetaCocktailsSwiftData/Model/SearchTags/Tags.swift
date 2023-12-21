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
    var agave: [BoozeEnums.Agave]?
    var amari: [BoozeEnums.Amari]?
    var bitters: [BoozeEnums.Bitters]?
    var brandy: [BoozeEnums.Brandy]?
    var fortifiedWine: [BoozeEnums.FortifiedWine]?
    var gin: [BoozeEnums.Gin]?
    var liqueur: [BoozeEnums.Liqueur]?
    var other: [BoozeEnums.Other]?
    var rum: [BoozeEnums.Rum]?
    var vodka: [BoozeEnums.Vodka]?
    var whiskies: [BoozeEnums.Whiskies]?
    var wine: [BoozeEnums.Wine]?
    
}
