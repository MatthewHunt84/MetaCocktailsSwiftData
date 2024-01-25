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
    case cranberryJuice       = "Cranberry Juice"
    case grapefruit           = "Grapefruit Juice (Fresh)"
    case lemon                = "Lemon Juice (Fresh Squeezed) "
    case lime                 = "Lime Juice (Fresh Squeezed)"
    case orange               = "Orange Juice (Fresh Squeezed)"
    case pineappleJuice       = "Pineapple Juice (Fresh)"
    
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
        }
    }
}

enum Syrup: String, Codable, CaseIterable { 
    
    case agaveSyrup           = "Agave Syrup"
    case cinnamonSyrup        = "Cinnamon Syrup"
    case cucumberSyrup        = "Cucumber Syrup"
    case demSyrupOneToOne     = "Demerara Syrup"
    case gingerSyrup          = "Ginger Syrup"
    case grapefruitShrub      = "Grapefruit Shrub"
    case grenadine            = "Grenadine (Pomegranate Syrup, Not Roses Grenadine)"
    case honeySyrup           = "Honey Syrup"
    case orgeat               = "Orgeat"
    case passionfruitSyrup    = "Passionfruit Syrup"
    case richDem              = "Rich Demerara Syrup (2:1)"
    case richSimple           = "Rich Simple Syrup (2:1)"
    case simple               = "Simple Syrup"
    case raspberrySyrup       = "Raspberry Syrup"
    case vanilla              = "Vanilla Syrup"
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.syrups(self)))
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
        }
    }
}

enum Herbs: String, Codable, CaseIterable {
    case basil                = "Basil Leaves"
    case mint                 = "Mint Leaves"
    case sage                 = "Sage Leaves"
    
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
        }
    }
}

enum Fruit: String, Codable, CaseIterable {
    case blackBerry           = "Blackberries"
    case grapefruitPeel       = "Grapefruit Peel"
    case raspberries          = "Raspberries"
    
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
        }
    }
}

enum Seasoning: String, Codable, CaseIterable {
    case nutmeg               = "Nutmeg (Spice)"
    case salt                 = "Salt"
    case saline               = "Saline 3:1"
    
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
        }
    }
}

enum Soda: String, Codable, CaseIterable {
    case gingerBeer           = "Ginger Beer"
    case grapefruitSoda       = "Grapefruit Soda"
    case sodaWater            = "Soda Water"
    case sparklingWater       = "Sparkling Water"
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.soda(self)))
    }
    
    var tags: Tags {
        switch self {
        case .grapefruitSoda:
            Tags(flavors: [.grapefruit], profiles: [.fruity], textures: [.effervescent], nA: [NAIngredients(.soda(self))])
        case .sodaWater:
            Tags(textures: [.effervescent], nA: [NAIngredients(.soda(self))])
        case .sparklingWater:
            Tags(textures: [.effervescent], nA: [NAIngredients(.soda(self))])
        case .gingerBeer:
            Tags(flavors: [.ginger], profiles: [.sharp], textures: [.effervescent], nA: [NAIngredients(.soda(self))])
        }
    }
}

enum OtherNA: String, Codable, CaseIterable {
    case bloodyMarryMixWnG    = "Williams and Graham Bloody Marry Mix"
    case bloodyMarryMix       = "Home made bloody marry mix"
    case cocoaPowder          = "Cocoa Powder"
    case coldBrew             = "Strong Cold Brew"
    case cream                = "Heavy Cream"
    case eggWhites            = "Egg Whites"
    case eggWhole             = "One Egg"
    //case eggYolk              = "Egg Yolk"
    case granulatedSugar      = "Granulated Sugar"
    case hotWater             = "Hot Water"
    case espressoCream        = "Lightly whipped and sweetened cream with angostura bitters(See 'Espresso Cream' in prep)"
    case mapleSugar           = "Maple Sugar"
    case orangeFlowerWater    = "Orange Flower Water"
    case sugarCube            = "Sugar Cube"
    case tobasco              = "Tobasco"
    case tomatoJuice          = "Tomato Juice"
    case worcestershire       = "Worcestershire"
    
    var nAComponent: CocktailComponent {
        return CocktailComponent(for: NAIngredients(.otherNonAlc(self)))
    }
    
    var tags: Tags {
        switch self {
        case .cream:
            Tags(profiles: [.creamy], textures: [.rich, .creamy], nA: [NAIngredients(.otherNonAlc(self))])
        case .eggWhites:
            Tags(flavors: [.egg], textures: [.silky, .light], nA: [NAIngredients(.otherNonAlc(self))])
        case .eggWhole:
            Tags(flavors: [.egg], textures: [.rich, .silky], nA: [NAIngredients(.otherNonAlc(self))])
        case .granulatedSugar:
            Tags(textures: [.unrefined], nA: [NAIngredients(.otherNonAlc(self))])
        case .orangeFlowerWater:
            Tags(flavors: [.whiteFlower], profiles: [.floral], nA: [NAIngredients(.otherNonAlc(self))])
//        case .eggYolk:
//            Tags(textures: [.rich], nA: [NAIngredients(.otherNonAlc(self))])
        case .bloodyMarryMixWnG:
            Tags(flavors: [.tomato], profiles: [.vegetal], textures: [.rich], nA: [NAIngredients(.otherNonAlc(self))])
        case .bloodyMarryMix:
            Tags(flavors: [.tomato], profiles: [.vegetal], textures: [.rich], nA: [NAIngredients(.otherNonAlc(self))])
        case .tomatoJuice:
            Tags(flavors: [.tomato], profiles: [.vegetal], textures: [.rich], nA: [NAIngredients(.otherNonAlc(self))])
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
        case .espressoCream:
            Tags(nA: [NAIngredients(.otherNonAlc(self))])
        }
    }
}
