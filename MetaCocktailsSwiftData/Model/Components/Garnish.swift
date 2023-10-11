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
    case lemonPeel
    case orangeOrLemon
    case limeWheel
    case cucumberSlices
    case skeweredBlackberryAndSage
    case lemonWheel
    case candiedGinger
    case noGarnish
    case halfOrangeWheel
    case mintBouquet
    case maraschinoCherry
    case pineappleFrond
    case pineappleWedge
    
    
    var asset: Garnish {
        switch self {
        case .orangePeel:
            Garnish(name: "Orange Peel", imageName: "circle.fill")
        case .limeWheel:
            Garnish(name:"Lime Wheel", imageName: "circle.fill")
        case .cucumberSlices:
            Garnish(name:"Cucumber Slices", imageName: "circle.fill")
        case .skeweredBlackberryAndSage:
            Garnish(name:"Skewered blackberry and sage leaf", image: Image(systemName: "circle.fill"))
        case .lemonWheel:
            Garnish(name: "Lemon Wheel", image: Image(systemName: "circle.fill"))
        case .candiedGinger:
            Garnish(name: "Candied Ginger", image: Image(systemName: "circle.fill"))
        case .noGarnish:
            Garnish(name: "No Garnish", image: Image(systemName: "circle.fill"))
        case .halfOrangeWheel:
            Garnish(name: "Half Orange Wheel", image: Image(systemName: "circle.fill"))
        case .mintBouquet:
            Garnish(name: "Mint Bouquet", image: Image(systemName: "circle.fill"))
        case .orangeOrLemon:
            Garnish(name: "Twist of Orange or Lemon.", image: Image(systemName: "circle.fill"))
        case .maraschinoCherry:
            Garnish(name: "Maraschino Cherry", image: Image(systemName: "circle.fill"))
        case .lemonPeel:
            Garnish(name: "Lemon Peel", image: Image(systemName: "circle.fill"))
        case .pineappleFrond:
            Garnish(name: "Pineapple Frond(s)", image: Image(systemName: "circle.fill"))
        case .pineappleWedge:
            Garnish(name: "Pineapple Wedge", image: Image(systemName: "circle.fill"))

        }
    }
}
