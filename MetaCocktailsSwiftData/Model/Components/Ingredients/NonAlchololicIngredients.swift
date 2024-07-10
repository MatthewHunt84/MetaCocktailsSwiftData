//
//  NonAlchololicIngredients.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 12/26/23.
//

import Foundation


struct NAIngredients: Codable, Hashable, Equatable {

    var ingredientType: IngredientType
    var name: String

    init(_ ingredientType: IngredientType) {
        self.ingredientType = ingredientType
        self.name = ingredientType.name
    }
    
    static func == (lhs: NAIngredients, rhs: NAIngredients) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}
enum Juice: String, Codable, CaseIterable {
    case appleCider           = "Apple Cider"
    case carrotJuice          = "Carrot Juice"
    case cranberryJuice       = "Cranberry Juice"
    case donsMix              = "Don's Mix"
    case grapefruit           = "Grapefruit Juice"
    case lemon                = "Lemon Juice"
    case lime                 = "Lime Juice"
    case orange               = "Orange Juice"
    case pineappleJuice       = "Pineapple Juice"
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.juices(self)))
    }
    
    var tags: Tags {
        switch self {
        case .cranberryJuice:
            Tags(flavors: [.cranberry], nA: [NAIngredients(.juices(self))])
        case .lemon:
            Tags(flavors: [.lemon], profiles: [.citrusy], nA: [NAIngredients(.juices(self))])
        case .lime:
            Tags(flavors: [.lime,], profiles: [.citrusy], nA: [NAIngredients(.juices(self))])
        case .pineappleJuice:
            Tags(flavors: [.pineapple], profiles: [.fruity], nA: [NAIngredients(.juices(self))])
        case .grapefruit:
            Tags(flavors: [.grapefruit], profiles: [.fruity], nA: [NAIngredients(.juices(self))])
        case .orange:
            Tags(flavors: [.orange], profiles: [.fruity], nA: [NAIngredients(.juices(self))])
        case .donsMix:
            Tags(flavors: [.grapefruit, .cinnamon], profiles: [.fruity], nA: [NAIngredients(.juices(self))])
        case .carrotJuice:
            Tags(flavors: [.carrot], profiles: [.vegetal], nA: [NAIngredients(.juices(self))])
        case .appleCider:
            Tags(flavors: [.apple, .bakingSpices], nA: [NAIngredients(.juices(self))])
        }
    }
}

enum Syrup: String, Codable, CaseIterable { 
    
    case agaveSyrup              = "Agave Syrup"
    case agaveNectar             = "Agave Nectar"
    case cinnamonSyrup           = "Cinnamon Syrup"
    case clementineShrub         = "Clementine Shrub"
    case cocoLopez               = "Coco Lopez"
    case cucumberSyrup           = "Cucumber Syrup"
    case demSyrupOneToOne        = "Demerara Syrup (1:1)"
    case gingerSyrup             = "Ginger Syrup"
    case gommeSyrup              = "Gomme Syrup"
    case grapefruitShrub         = "Grapefruit Shrub"
    case grenadine               = "Grenadine"
    case honey                   = "Honey"
    case honeySyrup              = "Honey Syrup"
    case mapleSyrup              = "Maple Syrup"
    case morenthalersGingerSyrup = "Morgenthaler's Ginger Syrup"
    case orgeat                  = "Orgeat"
    case passionfruitSyrup       = "Passionfruit Syrup"
    case pineappleGumSyrup       = "Pineapple Gum Syrup"
    case richCinnamonAndVanill   = "Cinnamon/Vanilla Syrup"
    case richDem                 = "Rich Demerara Syrup"
    case richSimple              = "Rich Simple Syrup"
    case raspberrySyrup          = "Raspberry Syrup"
    case simple                  = "Simple Syrup"
    case vanilla                 = "Vanilla Syrup"
    case violetteSyrup           = "Violette Syrup"
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.syrups(self)))
    }
   
    var grenadineInfo: String {
        return "(Pomegranate Syrup)"
    }
    var richSyrupInfo: String {
        return "Rich 2:1 by weight syrup."
    }
    
    
    var tags: Tags {
        switch self {
        case .agaveSyrup:
            Tags(flavors: [.agave], nA: [NAIngredients(.syrups(self))])
        case .cucumberSyrup:
            Tags(flavors: [.cucumber], nA: [NAIngredients(.syrups(self))])
        case .demSyrupOneToOne:
            Tags()
        case .gingerSyrup:
            Tags(flavors: [.ginger], nA: [NAIngredients(.syrups(self))])
        case .grenadine:
            Tags(flavors: [.pomegranate], nA: [NAIngredients(.syrups(self))])
        case .honeySyrup:
            Tags(flavors: [.honey], nA: [NAIngredients(.syrups(self))])
        case .orgeat:
            Tags(flavors: [.almond], nA: [NAIngredients(.syrups(self))])
        case .passionfruitSyrup:
            Tags(flavors: [.passionfruit], nA: [NAIngredients(.syrups(self))])
        case .richDem:
            Tags(nA: [NAIngredients(.syrups(self))])
        case .simple:
            Tags(nA: [NAIngredients(.syrups(self))])
        case .raspberrySyrup:
            Tags(flavors: [.raspberry], nA: [NAIngredients(.syrups(self))])
        case .grapefruitShrub:
            Tags(flavors: [.grapefruit], nA: [NAIngredients(.syrups(self))])
        case .cinnamonSyrup:
            Tags(flavors: [.cinnamon], nA: [NAIngredients(.syrups(self))])
        case .richSimple:
            Tags(nA: [NAIngredients(.syrups(self))])
        case .vanilla:
            Tags(flavors: [.vanilla], nA: [NAIngredients(.syrups(self))])
        case .morenthalersGingerSyrup:
            Tags(flavors: [.ginger], nA: [NAIngredients(.syrups(self))])
        case .agaveNectar:
            Tags(flavors: [.agave], nA: [NAIngredients(.syrups(self))])
        case .cocoLopez:
            Tags(flavors: [.coconut], nA: [NAIngredients(.syrups(self))])
        case .pineappleGumSyrup:
            Tags(flavors: [.pineapple], nA: [NAIngredients(.syrups(self))])
        case .richCinnamonAndVanill:
            Tags(flavors: [.vanilla, .cinnamon], nA: [NAIngredients(.syrups(self))])
        case .clementineShrub:
            Tags(flavors: [.orange, .clementine], nA: [NAIngredients(.syrups(self))])
        case .violetteSyrup:
            Tags(profiles: [.floral], nA: [NAIngredients(.syrups(self))])
        case .honey:
            Tags(flavors: [.honey], nA: [NAIngredients(.syrups(self))])
        case .mapleSyrup:
            Tags(flavors: [.maple], nA: [NAIngredients(.syrups(self))])
        case .gommeSyrup:
            Tags(nA: [NAIngredients(.syrups(self))])
        }
    }
    
 
}

enum Herbs: String, Codable, CaseIterable {
    case basil                = "Basil Leaves"
    case cilantro             = "Cilantro Leaves"
    case mint                 = "Mint Leaves"
    case sage                 = "Sage Leaves"
    case tarragon             = "Tarragon Sprig"
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.herbs(self)))
    }
    var tags: Tags {
        switch self {
        case .mint:
            Tags(flavors: [.mint], profiles: [.herbal, .aromatic], nA: [NAIngredients(.herbs(self))])
        case .sage:
            Tags(flavors: [.sage], profiles: [.herbal, .aromatic], nA: [NAIngredients(.herbs(self))])
        case .basil:
            Tags(flavors: [.basil], profiles: [.herbal, .aromatic], nA: [NAIngredients(.herbs(self))])
        case .cilantro:
            Tags(flavors: [.cilantro], profiles: [.herbal, .aromatic], nA: [NAIngredients(.herbs(self))])
        case .tarragon:
            Tags(flavors: [.tarragon], profiles: [.herbal, .aromatic], nA: [NAIngredients(.herbs(self))])
        }
    }
}

enum Fruit: String, Codable, CaseIterable {
    case blackBerry           = "Blackberries"
    case cucumberSlices       = "Cucumber Slice(s)"
    case grapefruitPeel       = "Grapefruit Peel(s)"
    case guavaPure            = "Guava Puree"
    case lemonRibbon          = "long lemon ribbon"
    case lemons               = "Lemons"
    case limeHalf             = "Lime Half"
    case limeWedges           = "Lime wedge(s)"
    case orangeMoons          = "Orange Moons"
    case raspberries          = "Raspberries"
    case seasonalBerries      = "Seasonal Berries"
    case strawberryHalf       = "Strawberry Half"
    case pineapple            = "Pineapple Wedge"
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.fruit(self)))
    }
    var tags: Tags {
        switch self {
        case .blackBerry:
            Tags(flavors: [.blackberry], profiles: [.fruity], nA: [NAIngredients(.fruit(self))])
        case .raspberries:
            Tags(flavors: [.raspberry], profiles: [.fruity], nA: [NAIngredients(.fruit(self))])
        case .grapefruitPeel:
            Tags(flavors: [.grapefruit], nA: [NAIngredients(.fruit(self))])
        case .pineapple:
            Tags(flavors: [.pineapple], profiles: [.fruity], nA: [NAIngredients(.fruit(self))])
        case .cucumberSlices:
            Tags(flavors: [.cucumber], nA: [NAIngredients(.fruit(self))])
        case .seasonalBerries:
            Tags(profiles: [.fruity], nA: [NAIngredients(.fruit(self))])
        case .orangeMoons:
            Tags(profiles: [.fruity], nA: [NAIngredients(.fruit(self))])
        case .lemonRibbon:
            Tags(flavors: [.lemon], nA: [NAIngredients(.fruit(self))])
        case .guavaPure:
            Tags(flavors: [.guava], nA: [NAIngredients(.fruit(self))])
        case .limeHalf:
            Tags(flavors: [.lime], nA: [NAIngredients(.fruit(self))])
        case .strawberryHalf:
            Tags(flavors: [.strawberry], nA: [NAIngredients(.fruit(self))])
        case .limeWedges:
            Tags(flavors: [.lime], nA: [NAIngredients(.fruit(self))])
        case .lemons:
            Tags(flavors: [.lemon], nA: [NAIngredients(.fruit(self))])
        }
    }
}

enum Seasoning: String, Codable, CaseIterable {
    case nutmeg               = "Nutmeg (Spice)"
    case salt                 = "Kosher Salt"
    case saline               = "Saline 3:1"
    case mineralSaline        = "Mineral Saline"
    case pepper               = "Black Pepper"
   
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.seasoning(self)))
    }
    var tags: Tags {
        switch self {
        case .nutmeg:
            Tags(flavors: [.nutmeg], nA: [NAIngredients(.seasoning(self))])
        case .salt:
            Tags(nA: [NAIngredients(.seasoning(self))])
        case .saline:
            Tags(nA: [NAIngredients(.seasoning(self))])
        case .mineralSaline:
            Tags(nA: [NAIngredients(.seasoning(self))])
        case .pepper:
            Tags(flavors: [.blackPepper], nA: [NAIngredients(.seasoning(self))])
        }
    }
}

enum Soda: String, Codable, CaseIterable {
    
    case feverTreeAromatic    = "Fever Tree Aromatic Tonic"
    case gingerBeer           = "Ginger Beer"
    case grapefruitSoda       = "Grapefruit Soda"
    case lemonMintSoda        = "Lemon Mint San Pellegrino"
    case sodaWater            = "Soda Water"
    case sparklingWater       = "Sparkling Water"
    
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.soda(self)))
    }
    
    var tags: Tags {
        switch self {
        case .grapefruitSoda:
            Tags(flavors: [.grapefruit], profiles: [.fruity, .effervescent], nA: [NAIngredients(.soda(self))])
        case .sodaWater:
            Tags(profiles: [.effervescent], nA: [NAIngredients(.soda(self))])
        case .sparklingWater:
            Tags(profiles: [.effervescent], nA: [NAIngredients(.soda(self))])
        case .gingerBeer:
            Tags(flavors: [.ginger], profiles: [.sharp, .effervescent], nA: [NAIngredients(.soda(self))])
        case .lemonMintSoda:
            Tags(flavors: [.lemon, .mint], profiles: [.effervescent], nA: [NAIngredients(.soda(self))])
        case .feverTreeAromatic:
            Tags( profiles: [.effervescent], nA: [NAIngredients(.soda(self))])
        }
    }
}

enum OtherNA: String, Codable, CaseIterable {
    case bloodyMarryMixWnG    = "W&G Bloody Marry Mix"
    case bloodyMarryMix       = "Bloody marry mix"
    case butter               = "Butter"
    case celeryStrip          = "Celery strip"
    case cholula              = "Cholula hot sauce"
    case cocoaPowder          = "Cocoa Powder"
    case coconutCream         = "Coconut Cream"
    case coconutMilk          = "Coconut Milk"
    case coconutWater         = "Coconut Water"
    case coffee               = "Hot Coffee"
    case hotWater             = "Hot Water"
    case coldBrew             = "Strong Cold Brew"
    case cream                = "Heavy Cream"
    case demeraraSugarCube    = "Demerara Sugar Cube"
    case espressoShot         = "Espresso shot"
    case stiffCream           = "Lightly Whipped Cream"
    case eggWhites            = "Egg Whites"
    case eggWhole             = "One Egg"
    case eggYolk              = "Egg Yolk"
    case granulatedSugar      = "Granulated Sugar"
    case jalapenoSlice        = "Jalepeno slice"
    case angosturaCream       = "Angostura Cream"
    case mapleSugar           = "Maple Sugar"
    case nutmegGrated         = "Grated Nutmeg"
    case orangeConcentrate    = "Orange Concentrate"
    case orangeFlowerWater    = "Orange Flower Water"
    case powderedSugar        = "Powdered Sugar"
    case raspberryPreserves   = "Raspberry Preserves"
    case roseWater            = "Rose Water"
    case sesameOil            = "Sesame Oil"
    case springOnion          = "Spring Onion"
    case sugarCube            = "Demerara Sugar Cube(s)"
    case tobasco              = "Tobasco"
    case tomatoJuice          = "Tomato Juice"
    case vanillaExtract       = "Vanilla Extract"
    case whitePeachPure       = "White Peach Puree"
    case worcestershire       = "Worcestershire"
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.otherNonAlc(self)))
    }
    
    var tags: Tags {
        switch self {
        case .cream:
            Tags(profiles: [.creamy, .rich], nA: [NAIngredients(.otherNonAlc(self))])
        case .eggWhites:
            Tags(flavors: [.egg], profiles: [.silky, .light], nA: [NAIngredients(.otherNonAlc(self))])
        case .eggWhole:
            Tags(flavors: [.egg], profiles: [.rich, .silky], nA: [NAIngredients(.otherNonAlc(self))])
        case .granulatedSugar:
            Tags(profiles: [.unrefined], nA: [NAIngredients(.otherNonAlc(self))])
        case .orangeFlowerWater:
            Tags(flavors: [.whiteFlower], profiles: [.floral], nA: [NAIngredients(.otherNonAlc(self))])
        case .bloodyMarryMixWnG:
            Tags(flavors: [.tomato], profiles: [.vegetal], nA: [NAIngredients(.otherNonAlc(self))])
        case .bloodyMarryMix:
            Tags(flavors: [.tomato], profiles: [.vegetal], nA: [NAIngredients(.otherNonAlc(self))])
        case .tomatoJuice:
            Tags(flavors: [.tomato], profiles: [.vegetal], nA: [NAIngredients(.otherNonAlc(self))])
        case .tobasco:
            Tags(flavors: [.vinegar], profiles: [.spicy], nA: [NAIngredients(.otherNonAlc(self))])
        case .worcestershire:
            Tags(flavors: [.umami], profiles: [.savory], nA: [NAIngredients(.otherNonAlc(self))])
        case .sugarCube:
            Tags(nA: [NAIngredients(.otherNonAlc(self))])
        case .hotWater:
            Tags(nA: [NAIngredients(.otherNonAlc(self))])
        case .mapleSugar:
            Tags(flavors: [.maple], nA: [NAIngredients(.otherNonAlc(self))])
        case .coldBrew:
            Tags(flavors: [.coffee,.espresso], nA: [NAIngredients(.otherNonAlc(self))])
        case .cocoaPowder:
            Tags(flavors: [.chocolate], nA: [NAIngredients(.otherNonAlc(self))])
        case .angosturaCream:
            Tags(nA: [NAIngredients(.otherNonAlc(self))])
        case .coffee:
            Tags(flavors: [.coffee], nA: [NAIngredients(.otherNonAlc(self))])
        case .stiffCream:
            Tags(profiles: [.creamy, .rich], nA: [NAIngredients(.otherNonAlc(self))])
        case .demeraraSugarCube:
            Tags(nA: [NAIngredients(.otherNonAlc(self))])
        case .coconutCream:
            Tags(flavors: [.coconut], profiles: [.creamy], nA: [NAIngredients(.otherNonAlc(self))])
        case .vanillaExtract:
            Tags(flavors: [.vanilla], nA: [NAIngredients(.otherNonAlc(self))])
        case .coconutMilk:
            Tags(flavors: [.coconut], profiles: [.creamy], nA: [NAIngredients(.otherNonAlc(self))])
        case .sesameOil:
            Tags(flavors: [.sesame], nA: [NAIngredients(.otherNonAlc(self))])
        case .coconutWater:
            Tags(flavors: [.coconut], nA: [NAIngredients(.otherNonAlc(self))])
        case .butter:
            Tags(nA: [NAIngredients(.otherNonAlc(self))])
        case .orangeConcentrate:
            Tags(flavors: [.orange], nA: [NAIngredients(.otherNonAlc(self))])
        case .springOnion:
            Tags(flavors: [.springOnion], profiles: [.vegetal], nA: [NAIngredients(.otherNonAlc(self))])
        case .raspberryPreserves:
            Tags(flavors: [.raspberry], profiles: [.fruity], nA: [NAIngredients(.otherNonAlc(self))])
        case .cholula:
            Tags(flavors: [.cholula], profiles: [.spicy], nA: [NAIngredients(.otherNonAlc(self))])
        case .powderedSugar:
            Tags(nA: [NAIngredients(.otherNonAlc(self))])
        case .whitePeachPure:
            Tags(flavors: [.peach], profiles: [.fruity], nA: [NAIngredients(.otherNonAlc(self))])
        case .jalapenoSlice:
            Tags(flavors: [.jalapeño], profiles: [.spicy], nA: [NAIngredients(.otherNonAlc(self))])
        case .celeryStrip:
            Tags(flavors: [.celery], nA: [NAIngredients(.otherNonAlc(self))])
        case .roseWater:
            Tags(flavors: [.rose], nA: [NAIngredients(.otherNonAlc(self))])
        case .eggYolk:
            Tags(flavors: [.egg], profiles: [.rich, .silky], nA: [NAIngredients(.otherNonAlc(self))])
        case .espressoShot:
            Tags(flavors: [.coffee,.espresso], nA: [NAIngredients(.otherNonAlc(self))])
        case .nutmegGrated:
            Tags(flavors: [.nutmeg], nA: [NAIngredients(.otherNonAlc(self))])
        }
    }
}
