//
//  Garnish.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import SwiftUI
import SwiftData

@Model
class Garnish {
    let name: String
    let imageName: String?
    
    //This class has two initializers, this is known as 'initializer overloading'. It means we can create garnish objects in different ways depending on the circumstances.
    //For instance, if we're adding cocktails and we have already created the garnish, it should exist in the GarnishCatalog enum. We just grab it from there.

    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    // However, if the user adds a garnish, we allow them to give it a name and use it in their recipes, but there will be no picture of it they can use.
    init(customName: String) {
        self.name = customName
        self.imageName = nil
    }
}

// This is where we store all our garnishes

enum GarnishCatalog: Codable {
    case orangePeel
    case limeWheel
    case cucumberSlices
    case skeweredBlackberryAndSage
    
    var asset: Garnish {
        switch self {
        case .orangePeel:
            Garnish(name: "Orange Peel", imageName: "circle.fill")
        case .limeWheel:
            Garnish(name:"Lime Wheel", imageName: "circle.fill")
        case .cucumberSlices:
            Garnish(name:"Cucumber Slices", imageName: "circle.fill")
        case .skeweredBlackberryAndSage:
            Garnish(name:"Skewered blackberry and sage leaf", imageName: "circle.fill")
        }
    }
}
