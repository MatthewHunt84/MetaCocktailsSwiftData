//
//  NonAlchololicIngredients.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 12/26/23.
//

import Foundation

enum Juice: String, Codable, CaseIterable {
    case cranberryJuice       = "Cranberry Juice"
    case lemon                = "Fresh Squeezed Lemon Juice"
    case lime                 = "Fresh Squeezed Lime Juice"
    case pineappleJuice       = "Fresh Pineapple Juice"
    
    var tags: Tags {
        switch self {
        case .cranberryJuice:
            Tags(flavors: [.cranberry])
        case .lemon:
            Tags(flavors: [.lemon], profiles: [.citrusy])
        case .lime:
            Tags(flavors: [.lime,], profiles: [.citrusy])
        case .pineappleJuice:
            Tags(flavors: [.pineapple], profiles: [.fruity])
        }
    }
}

enum Syrup: String, Codable, CaseIterable { 
    
    case agaveSyrup           = "Agave Syrup"
    case cucumberSyrup        = "Cucumber Syrup"
    case demSyrupOneToOne     = "Demerara Syrup 1:1"
    case gingerSyrup          = "Ginger Syrup"
    case grenadine            = "Grenadine (Pomegranate Syrup, Not Roses Grenadine)"
    case honeySyrup           = "Honey Syrup"
    case orgeat               = "Orgeat"
    case passionfruitSyrup    = "Passionfruit Syrup"
    case richDem              = "Rich Demerara Syrup (2:1)"
    case simple               = "Simple Syrup (1:1)"
    case raspberrySyrup       = "RaspberrySyrup"
    
    
    var tags: Tags {
        switch self {
        case .agaveSyrup:
            Tags(flavors: [.agave])
        case .cucumberSyrup:
            Tags(flavors: [.cucumber])
        case .demSyrupOneToOne:
            Tags()
        case .gingerSyrup:
            Tags(flavors: [.ginger])
        case .grenadine:
            Tags(flavors: [.pomegranate])
        case .honeySyrup:
            Tags(flavors: [.honey])
        case .orgeat:
            Tags(flavors: [.almond])
        case .passionfruitSyrup:
            Tags(flavors: [.passionfruit])
        case .richDem:
            Tags()
        case .simple:
            Tags()
        case .raspberrySyrup:
            Tags(flavors: [.raspberry])
        }
    }
}

enum Herb: String, Codable, CaseIterable {
    case mint                 = "Mint Leaves"
    case sage                 = "Sage"
    
    var tags: Tags {
        switch self {
        case .mint:
            Tags(flavors: [.mint], profiles: [.herbal, .aromatic])
        case .sage:
            Tags(flavors: [.sage], profiles: [.herbal, .aromatic])
        }
    }
}

enum Fruit: String, Codable, CaseIterable {
    case blackBerry           = "Blackberries"
    case raspberries          = "Raspberries"
    
    var tags: Tags {
        switch self {
        case .blackBerry:
            Tags(flavors: [.blackberry], profiles: [.fruity])
        case .raspberries:
            Tags(flavors: [.raspberry], profiles: [.fruity])
        }
    }
}

enum Seasoning: String, Codable, CaseIterable {
    case nutmeg               = "Nutmeg"
    case salt                 = "Salt"
    
    var tags: Tags {
        switch self {
        case .nutmeg:
            Tags(flavors: [.nutmeg])
        case .salt:
            Tags()
        }
    }
}

enum Soda: String, Codable, CaseIterable {
    case grapefruitSoda       = "Cold Grapefruit Soda"
    case sodaWater            = "Soda Water"
    case sparklingWater       = "Chilled Sparkling Water"
    
    var tags: Tags {
        switch self {
        case .grapefruitSoda:
            Tags(flavors: [.grapefruit], profiles: [.fruity], textures: [.effervescent])
        case .sodaWater:
            Tags(textures: [.effervescent])
        case .sparklingWater:
            Tags(textures: [.effervescent])
        }
    }
}

enum OtherNA: String, Codable, CaseIterable {
    case cream                = "Heavy Cream"
    case eggWhites            = "Egg Whites"
    case egg                  = "1 Egg"
    case granulatedSugar      = "Granulated Sugar"
    case orangeFlowerWater    = "Orange Flower Water"
    
    var tags: Tags {
        switch self {
        case .cream:
            Tags(flavors: [.cream], profiles: [.creamy], textures: [.rich, .creamy])
        case .eggWhites:
            Tags(flavors: [.eggWhite], textures: [.silky, .light])
        case .egg:
            Tags(flavors: [.eggWhole])
        case .granulatedSugar:
            Tags(textures: [.unrefined])
        case .orangeFlowerWater:
            Tags(flavors: [.whiteFlower], profiles: [.floral])
        }
    }
}
