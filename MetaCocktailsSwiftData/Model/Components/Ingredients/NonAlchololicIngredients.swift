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
enum Juice: String, IngredientTagsProtocol {
    case appleCider           = "Apple cider"
    case carrotJuice          = "Carrot juice"
    case cranberryJuice       = "Cranberry juice"
    case donsMix              = "Don's mix"
    case grapefruit           = "Grapefruit juice"
    case lemon                = "Lemon juice"
    case lime                 = "Lime juice"
    case orange               = "Orange juice"
    case pineappleJuice       = "Pineapple juice"
    
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

enum Syrup: String, IngredientTagsProtocol {
    
    case agaveSyrup              = "Agave syrup"
    case agaveNectar             = "Agave nectar"
    case cinnamonSyrup           = "Cinnamon syrup"
    case clementineShrub         = "Clementine shrub"
    case cocoLopez               = "Coco Lopez"
    case cucumberSyrup           = "Cucumber syrup"
    case demSyrupOneToOne        = "Demerara syrup"
    case gingerSyrup             = "Ginger syrup"
    case gommeSyrup              = "Gomme syrup"
    case grapefruitShrub         = "Grapefruit shrub"
    case grenadine               = "Grenadine"
    case hibiscus                = "Hibiscus syrup"
    case honey                   = "Honey"
    case honeySyrup              = "Honey syrup"
    case limeCordial             = "Lime Cordial"
    case mapleSyrup              = "Maple syrup"
    case morenthalersGingerSyrup = "Morgenthaler's ginger syrup"
    case orgeat                  = "Orgeat"
    case passionfruitSyrup       = "Passionfruit syrup"
    case pineappleGumSyrup       = "Pineapple gomme syrup"
    case richCinnamonAndVanill   = "Cinnamon & vanilla syrup"
    case richDem                 = "Rich Demerara syrup"
    case richSimple              = "Rich simple syrup"
    case raspberrySyrup          = "Raspberry syrup"
    case simple                  = "Simple syrup"
    case vanilla                 = "Vanilla syrup"
    case violetteSyrup           = "Violette syrup"
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.syrups(self)))
    }
   
    var grenadineInfo: String {
        "(Pomegranate Syrup)"
    }
    
    var richSyrupInfo: String {
        "Rich 2:1 by weight syrup."
    }
    
    var hibiscusSyrup: String {
        "Hibiscus infused 1:1 turbinado syrup"
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
            Tags(flavors: [.almond],  profiles: [.nutty], nA: [NAIngredients(.syrups(self))])
        case .passionfruitSyrup:
            Tags(flavors: [.passionfruit], profiles: [.tropical], nA: [NAIngredients(.syrups(self))])
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
            Tags(flavors: [.coconut], profiles: [.tropical], nA: [NAIngredients(.syrups(self))])
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
        case .limeCordial:
            Tags(flavors: [.lime], nA: [NAIngredients(.syrups(self))])
        case .hibiscus:
            Tags(flavors: [.hibiscus])
        }
    }
    
 
}

enum Herbs: String, IngredientTagsProtocol {
    case basil                = "Basil leaves"
    case cilantro             = "Cilantro leaves"
    case mint                 = "Mint leaves"
    case sage                 = "Sage leaves"
    case tarragon             = "Tarragon sprig"
    
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

enum Fruit: String, IngredientTagsProtocol {
    
    case blackBerry           = "Blackberries"
    case cucumberSlices       = "Cucumber slice(s)"
    case grapefruitPeel       = "Grapefruit peel(s)"
    case guavaPure            = "Guava puree"
    case lemonRibbon          = "Long lemon ribbon"
    case lemons               = "Lemons"
    case lemonWedges          = "Lemon wedges"
    case limeHalf             = "Lime half"
    case limeWedges           = "Lime wedge(s)"
    case orangeMoons          = "Orange moons"
    case raspberries          = "Raspberries"
    case seasonalBerries      = "Seasonal berries"
    case strawberryHalf       = "Strawberry half"
    case pineapple            = "Pineapple wedge"
    
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
        case .lemonWedges:
            Tags(flavors: [.lemon], nA: [NAIngredients(.fruit(self))])
        }
    }
}

enum Seasoning: String, IngredientTagsProtocol {
    case nutmeg               = "Grated nutmeg"
    case salt                 = "Kosher salt"
    case saline               = "Saline (5:1)"
    case mineralSaline        = "Mineral saline"
    case pepper               = "Black pepper"
   
    
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

enum Soda: String, IngredientTagsProtocol {
    
    case feverTreeAromatic    = "Fever Tree aromatic tonic"
    case gingerBeer           = "Ginger beer"
    case grapefruitSoda       = "Grapefruit soda"
    case lemonMintSoda        = "Lemon mint San Pellegrino"
    case sodaWater            = "Soda water"
    case sparklingWater       = "Sparkling water"
    
    
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
            Tags(flavors: [.ginger], profiles: [.effervescent], nA: [NAIngredients(.soda(self))])
        case .lemonMintSoda:
            Tags(flavors: [.lemon, .mint], profiles: [.effervescent], nA: [NAIngredients(.soda(self))])
        case .feverTreeAromatic:
            Tags( profiles: [.effervescent], nA: [NAIngredients(.soda(self))])
        }
    }
}

enum OtherNA: String, IngredientTagsProtocol {
    case bloodyMarryMixWnG    = "W&G bloody marry mix"
    case bloodyMarryMix       = "Bloody marry mix"
    case butter               = "Butter"
    case celeryStrip          = "Celery strip"
    case cholula              = "Cholula hot sauce"
    case cocoaPowder          = "Cocoa powder"
    case coconutCream         = "Coconut cream"
    case coconutMilk          = "Coconut milk"
    case coconutWater         = "Coconut water"
    case coffee               = "Hot coffee"
    case hotWater             = "Hot water"
    case coldBrew             = "Strong cold brew"
    case cream                = "Heavy cream"
    case demeraraSugarCube    = "Demerara sugar sube"
    case dryVanilla           = "DRY Vanilla Botanical Bubbly"
    case espressoShot         = "Espresso shot"
    case stiffCream           = "Lightly whipped cream"
    case eggWhites            = "Egg whites"
    case eggWhole             = "One egg"
    case eggYolk              = "Egg yolk"
    case granulatedSugar      = "Granulated sugar"
    case jalapenoSlice        = "Jalapeño slice"
    case angosturaCream       = "Angostura cream"
    case mapleSugar           = "Maple sugar"
    case nutmegGrated         = "Grated sutmeg"
    case orangeConcentrate    = "Orange concentrate"
    case orangeFlowerWater    = "Orange flower water"
    case powderedSugar        = "Powdered sugar"
    case raspberryPreserves   = "Raspberry preserves"
    case roseWater            = "Rose water"
    case sesameOil            = "Sesame oil"
    case springOnion          = "Spring onion"
    case sugarCube            = "Demerara sugar cube(s)"
    case tobasco              = "Tobasco"
    case tomatoJuice          = "Tomato juice"
    case vanillaExtract       = "Vanilla extract"
    case whitePeachPure       = "White peach puree"
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
            Tags(nA: [NAIngredients(.otherNonAlc(self))])
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
        case .dryVanilla:
            Tags(flavors: [.vanilla], profiles: [.dry, .effervescent])
        }
    }
}
