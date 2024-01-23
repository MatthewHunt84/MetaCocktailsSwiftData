//
//  Garnish.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import SwiftUI


// This is where we store all our garnishes

enum Garnish: String, Codable {
    case flamedOrange              = "Flamed Orange Peel"
    case edibleFlower              = "Edible Flower(s)"
    case angoDeco                  = "Angostura bitters design over egg whites"
    case peychaudsDeco             = "Peychaud's bitters design over egg whites"
    case basilSprig                = "Basil Sprig"
    case dehydratedOrangeWheel     = "Dehydrated Orange Wheel"
    case dehydratedGrapefruitSlice = "Dehydrated grapefruit slice"
    case orangePeel                = "Orange Peel"
    case lemonPeel                 = "Lemon Peel"
    case orangeOrLemon             = "Twist of orange or lemon"
    case orangeAndLemon            = "Twist of orange and lemon"
    case limePeel                  = "Lime peel"
    case lemonExpression           = "Lemon Expression (then discard)"
    case grapefruitPeel            = "Grapefruit Peel"
    case grapefruitExpression      = "Grapefruit Expression (then discard)"
    case limeWheel                 = "Lime Wheel"
    case cucumberSlices            = "Cucumber Slices"
    case skeweredBlackberryAndSage = "Skewered blackberry and sage leaf"
    case lemonWheel                = "Lemon Wheel"
    case lemongrass                = "Lemongrass spears"
    case chineseFiveSpice          = "Dusted Chinese five spice over the top of the pebble ice"
    case candiedGinger             = "Candied Ginger"
    case noGarnish                 = "No Garnish"
    case halfOrangeWheel           = "Half Orange Wheel"
    case mintBouquet               = "Mint Bouquet"
    case maraschinoCherry          = "Maraschino Cherry"
    case pineappleFrond            = "Pineapple Frond"
    case pineappleFronds           = "Pineapple Fronds"
    case pineappleWedge            = "Pineapple Wedge"
    case orchid                    = "Orchid"
    case raspberry                 = "Raspberry"
    case rosePedals                = "Skewered Rose Pedals"
    case nutmeg                    = "Grated Nutmeg"
    case flamingLimeBoat           = "Hollowed out lime shell with overproof Spirit thats on fire"
    case celeryTop                 = "Leafy celery top"
    
    
}
