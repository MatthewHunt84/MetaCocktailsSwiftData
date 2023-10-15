//
//  Garnish.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import SwiftUI


// This is where we store all our garnishes

enum Garnish: String, Codable {
    case orangePeel         = "Orange Peel"
    case lemonPeel          = "Lemon Peel"
    case orangeOrLemon      = "Twist of Orange or Lemon"
    case limeWheel          = "Lime Wheel"
    case cucumberSlices     = "Cucumber Slices"
    case skeweredBlackberryAndSage = "Skewered blackberry and sage leaf"
    case lemonWheel         = "Lemon Wheel"
    case candiedGinger      = "Candied Ginger"
    case noGarnish          = "No Garnish"
    case halfOrangeWheel    = "Half Orange Wheel"
    case mintBouquet        = "Mint Bouquet"
    case maraschinoCherry   = "Maraschino Cherry"
    case pineappleFrond     = "Pineapple Frond"
    case pineappleFronds    = "Pineapple Fronds"
    case pineappleWedge     = "Pineapple Wedge"
}
