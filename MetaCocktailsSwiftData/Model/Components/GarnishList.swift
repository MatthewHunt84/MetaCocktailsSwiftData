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
    
    #Unique<Garnish>([\.name])
    var name: String
    var cocktails: [Cocktail]?
    
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
    case angoAndPeychaudsDeco      = "Angostura and Peychaud's bitters design over egg whites"
    case almonds                   = "Almonds"
    case assortedBerries230g       = "230g assorted berries"
    case babiesBreath              = "Babies breath"
    case basilSprig                = "Basil sprig"
    case bambooLeaf                = "Bamboo leaf swirled around the inside of the glass"
    case biscotti                  = "Biscotti cookie"
    case blackberry                = "Blackberry"
    case bloodOrangePeel           = "Blood orange peel"
    case celeryTop                 = "Leafy celery top"
    case chamomileFlowers          = "Chamomile flowers"
    case chineseFiveSpice          = "Dusted Chinese five spice over the top of the pebble ice"
    case chiliOil                  = "Chili oil on top of the pebble ice"
    case cinnamon                  = "Grated cinnamon"
    case cilantroSprig             = "Cilantro sprig"
    case cinnamonSticksAndCloves   = "12 cinnamon sticks and 12 cloves"
    case chocolateChips            = "3 chocolate chips"
    case cocoaPowder               = "Cocoa powder"
    case cocktailOnion             = "Cocktail onion"
    case coffeeBeans               = "3 coffee beans"
    case cucumberSlices            = "Cucumber slice(s)"
    case cucumberSliceLong         = "Long fancy cucumber"
    case dehydratedGrapefruitSlice = "Dehydrated grapefruit slice"
    case dehydratedOrangeWheel     = "Dehydrated orange wheel"
    case dehydratedOrangeBlack     = "Dehydrated orange slice soaked in black walnut liquor"
    case edibleFlower              = "Edible flower(s)"
    case flamedLemon               = "Flamed lemon"
    case flamedOrange              = "Flamed orange peel"
    case flamingLimeBoat           = "Hollowed out lime shell with overproof spirit thats on fire"
    case garnishAtWill             = "Garnish at will."
    case grapefruitExpression      = "Grapefruit expression (then discard)"
    case grapefruitPeel            = "Grapefruit peel"
    case grapeFruitNoExpress       = "Grapefruit Peel (no oil expression)"
    case grapefruitWedge           = "Grapefruit wedge"
    case goldLeaf                  = "Gold leaf"
    case halfOrangeWheel           = "Half orange wheel"
    case honeycomb                 = "Honeycomb"
    case lemonExpression           = "Lemon expression (then discard)"
    case lemonPeel                 = "Lemon peel"
    case limePeel                  = "Lime peel"
    case limeWedge                 = "Lime wedge"
    case limeDisc                  = "Lime butt disc"
    case nutmeg                    = "Grated nutmeg"
    case orangePeel                = "Orange peel"
    case orangePeelLong            = "Long orange peel"
    case orangeExpress             = "Orange expression then discard"
    case limeWheel                 = "Lime wheel"
    case limeHalf                  = "Half a lime, squeezed into the cocktail"
    case lemonWheel                = "Lemon wheel"
    case lemonWedge                = "Lemon wedge"
    case lemongrass                = "Lemongrass spears"
    case candiedGinger             = "Candied ginger"
    case noGarnish                 = "No garnish"
    case maraschinoCherry          = "Maraschino cherry"
    case mintBouquet               = "Mint bouquet"
    case mintSprig                 = "Mint sprig"
    case mintSprigPowdered         = "Mint sprig with powdered sugar"
    case mintLeaf                  = "Mint leaf"
    case mintLeaf2                 = "Two mint leaves"
    case olive                     = "Green olive"
    case orangeAndLemon            = "Twist of orange and lemon"
    case orangeFlag                = "Skewered orange half moon/maraschino cherry"
    case wholeOrangeSliced         = "One orange, sliced into wheels"
    case wholeLemonsSliced         = "2 lemons, sliced into wheels"
    case wholeLimesSliced          = "2 limes, sliced into wheels"
    case orangeOrLemon             = "Twist of orange or lemon"
    case orchid                    = "Orchid"
    case peaTendril                = "Pease tendril"
    case peychaudsDeco             = "Peychaud's bitters design over egg whites"
    case pineappleFrond            = "Pineapple frond"
    case pineappleFronds           = "Pineapple fronds"
    case pineappleWedge            = "Pineapple wedge"
    case pinchSalt                 = "Pinch of salt"
    case pinchSeaSalt              = "Pinch of sea salt"
    case pinchCayenne              = "Pinch of cayenne pepper"
    case pinchPepper               = "Pinch of fresh ground black pepper"
    case pirouette                 = "Pirouette cookie"
    case raspberry                 = "Raspberry"
    case raisins                   = "Raisins"
    case seasonalBerries           = "Seasonal berries"
    case sesameOil                 = "Sesame oil"
    case springOnions              = "Spring onion or ramp, trimmed"
    case stroopwaffle              = "Stroopwafel"
    case strawberryHalf            = "Strawberry half"
    case strawberryWhole           = "Strawberry"
    case thyme                     = "Thyme sprig"
    case rosePetals                = "Skewered rose petals"
    case rosemarySprig             = "Rosemary sprig"
    case skeweredBlackberryAndSage = "Skewered blackberry and sage leaf"
    case spentLimeShell            = "Spent lime shell"
    case spentLimeShellFlaming     = "Spent lime shell with Green Chartreuse on fire"
   
    
    
    
    
    
}
