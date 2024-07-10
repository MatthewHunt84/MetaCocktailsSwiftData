//
//  Garnish.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import SwiftUI
import SwiftData


@Model
class Garnish: Codable, Hashable {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Garnish, rhs: Garnish) -> Bool {
        lhs.name > rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    enum CodingKeys: CodingKey {
        case garnish
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .garnish)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .garnish)
    }
}


// This is where we store all our garnishes
enum GarnishList: String, Codable, CaseIterable {
    
    case angoDeco                  = "Angostura bitters design over egg whites"
    case almonds                   = "Almonds"
    case assortedBerries230g       = "230g assorted berries"
    case babiesBreath              = "Babies Breath"
    case basilSprig                = "Basil Sprig"
    case biscotti                  = "Biscotti Cookie"
    case blackberry                = "Blackberry"
    case bloodOrangePeel           = "Blood Orange Peel"
    case celeryTop                 = "Leafy celery top"
    case chamomileFlowers          = "Chamomile FLowers"
    case chineseFiveSpice          = "Dusted Chinese five spice over the top of the pebble ice"
    case chiliOil                  = "Chili Oil on top of the pebble ice"
    case cinnamon                  = "Grated Cinnamon"
    case cilantroSprig             = "Cilantro Sprig"
    case cinnamonSticksAndCloves   = "12 cinnamon sticks and 12 cloves"
    case chocolateChips            = "3 Chocolate chips"
    case cocoaPowder               = "Cocoa Powder"
    case cocktailOnion             = "Cocktail Onion"
    case coffeeBeans               = "3 Coffee Beans"
    case cucumberSlices            = "Cucumber Slice(s)"
    case cucumberSliceLong         = "Long Fancy Cucumber"
    case dehydratedGrapefruitSlice = "Dehydrated grapefruit slice"
    case dehydratedOrangeWheel     = "Dehydrated Orange Wheel"
    case dehydratedOrangeBlack     = "Dehydrated Orange Slice Soaked in Black Walnut"
    case edibleFlower              = "Edible Flower(s)"
    case flamedLemon               = "Flamed Lemon"
    case flamedOrange              = "Flamed Orange Peel"
    case flamingLimeBoat           = "Hollowed out lime shell with overproof Spirit thats on fire"
    case garnishAtWill             = "Garnish at will."
    case grapefruitExpression      = "Grapefruit Expression (then discard)"
    case grapefruitPeel            = "Grapefruit Peel"
    case grapefruitWedge           = "Grapefruit Wedge"
    case goldLeaf                  = "Gold Leaf"
    case halfOrangeWheel           = "Half Orange Wheel"
    case honeycomb                 = "Honeycomb"
    case lemonExpression           = "Lemon Expression (then discard)"
    case lemonPeel                 = "Lemon Peel"
    case limePeel                  = "Lime peel"
    case limeWedge                 = "Lime Wedge"
    case limeDisc                  = "Lime butt disc"
    case nutmeg                    = "Grated Nutmeg"
    case orangePeel                = "Orange Peel"
    case orangePeelLong            = "Long Orange Peel"
    case orangeExpress             = "Orange expression then discard"
    case limeWheel                 = "Lime Wheel"
    case limeHalf                  = "Half a lime, squeezed into the cocktail."
    case lemonWheel                = "Lemon Wheel"
    case lemonWedge                = "Lemon Wedge"
    case lemongrass                = "Lemongrass spears"
    case candiedGinger             = "Candied Ginger"
    case noGarnish                 = "No Garnish"
    case maraschinoCherry          = "Maraschino Cherry"
    case mintBouquet               = "Mint Bouquet"
    case mintSprig                 = "Mint Sprig"
    case mintSprigPowdered         = "Mint sprig with powdered sugar"
    case mintLeaf                  = "Mint Leaf"
    case mintLeaf2                 = "Two Mint Leafs"
    case olive                     = "Green Olive"
    case orangeAndLemon            = "Twist of orange and lemon"
    case orangeFlag                = "Skewered orange half moon/Maraschino cherry"
    case wholeOrangeSliced         = "One orange, sliced into wheels"
    case wholeLemonsSliced         = "2 lemons, sliced into wheels"
    case wholeLimesSliced          = "2 limes, sliced into wheels"
    case orangeOrLemon             = "Twist of orange or lemon"
    case orchid                    = "Orchid"
    case peaTendril                = "Pease Tendril"
    case peychaudsDeco             = "Peychaud's bitters design over egg whites"
    case pineappleFrond            = "Pineapple Frond"
    case pineappleFronds           = "Pineapple Fronds"
    case pineappleWedge            = "Pineapple Wedge"
    case pinchSalt                 = "Pinch of salt"
    case pinchSeaSalt              = "Pinch of Sea Salt"
    case pinchCayenne               = "Pinch of cayenne pepper"
    case pinchPepper               = "Pinch of fresh ground black pepper"
    case pirouette                 = "Pirouette Cookie"
    case raspberry                 = "Raspberry"
    case raisins                   = "Raisins"
    case seasonalBerries           = "Seasonal Berries"
    case sesameOil                 = "Sesame Oil"
    case springOnions              = "Spring onion or ramp, trimmed"
    case stroopwaffle              = "Stroopwafel"
    case strawberryHalf            = "Strawberry Half"
    case strawberryWhole           = "Strawberry (Whole)"
    case thyme                     = "Thyme Sprig"
    case rosePetals                = "Skewered Rose Petals"
    case rosemarySprig             = "Rosemary Sprig"
    case skeweredBlackberryAndSage = "Skewered blackberry and sage leaf"
    case spentLimeShell            = "Spent Lime Shell"
    case spentLimeShellFlaming     = "Spent Lime Shell with Green Chartreuse on fire"
   
    
    
    
    
    
}
