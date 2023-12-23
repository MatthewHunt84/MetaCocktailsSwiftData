//
//  NonAlcoholic.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 12/22/23.
//

import Foundation

struct NonAlcoholic: Ingredient, Codable {
    var name: String
    var nonalcoholicCategory: NonalcoholicCategory
    var isBooze: Bool
}

protocol NonAlcoholicProtocol {
    var type: NonalcoholicCategory { get }
    var expressions: [String] { get }
}


var agaveSyrup = NonAlcoholic(name: "AgaveSyrup", nonalcoholicCategory: .syrups, isBooze: false)


enum NonalcoholicCategory: String, Codable {
    case syrups     = "Syrups"
    case juices     = "Juices"
    case herbs      = "Herbs"
    case fruit      = "Fresh Fruit"
    case sodas      = "Sodas"
    case seasoning  = "Seasoning"
    case soda       = "Soda"
    case other      = "Other"

}

struct Syrups: NonAlcoholicProtocol {
    var type: NonalcoholicCategory = .syrups
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in NonAlcoholicEnum.Syrups.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Juices: NonAlcoholicProtocol {
    var type: NonalcoholicCategory = .juices
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in NonAlcoholicEnum.Juices.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}
struct Herbs: NonAlcoholicProtocol {
    var type: NonalcoholicCategory = .herbs
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in NonAlcoholicEnum.Herbs.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}
struct Fruit: NonAlcoholicProtocol {
    var type: NonalcoholicCategory = .fruit
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in NonAlcoholicEnum.Fruit.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}
struct Seasoning: NonAlcoholicProtocol {
    var type: NonalcoholicCategory = .seasoning
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in NonAlcoholicEnum.Seasonings.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}
struct Soda: NonAlcoholicProtocol {
    var type: NonalcoholicCategory = .soda
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in NonAlcoholicEnum.Soda.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}
struct OtherNA: NonAlcoholicProtocol {
    var type: NonalcoholicCategory = .other
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in NonAlcoholicEnum.OtherNA.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}



struct NonAlcoholicEnum {
    
    
    enum Syrups: String, Codable, CaseIterable {
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
    }
    
    enum Juices: String, Codable, CaseIterable {
        case cranberryJuice       = "Cranberry Juice"
        case lemon                = "Fresh Squeezed Lemon Juice"
        case lime                 = "Fresh Squeezed Lime Juice"
        case pineappleJuice       = "Fresh Pineapple Juice"
        
    }
    
    enum Herbs: String, Codable, CaseIterable  {
        case mint                 = "Mint Leaves"
        case sage                 = "Sage"
    }
    
    enum Fruit: String, Codable, CaseIterable {
        case blackBerry           = "Blackberries"
        case raspberries          = "Raspberries"
    }
    
    enum Seasonings: String, Codable, CaseIterable {
        case salt                 = "Salt"
        case nutmeg               = "Nutmeg"
    }
    
    enum Soda: String, Codable, CaseIterable {
        case sparklingWater       = "Chilled Sparkling Water"
        case grapefruitSoda       = "Cold Grapefruit Soda"
        case sodaWater            = "Soda Water"
    }
    
    enum OtherNA: String, Codable, CaseIterable {
        case cream                = "Heavy Cream"
        case eggWhites            = "Egg Whites"
        case granulatedSugar      = "Granulated Sugar"
        case orangeFlowerWater    = "Orange Flower Water"
        case egg                  = "1 Egg"
    }

}

//enum Ingredient: String, Codable {
//    // NA

//
//
//    var tags: Tags {
//        switch self {
//        case .lemon:
//            Tags(flavors: [.lemon], profiles: [.citrusy])
//        case .lime:
//            Tags(flavors: [.lime,], profiles: [.citrusy])
//        case .cream:
//            Tags(flavors: [.cream], profiles: [.creamy], textures: [.rich, .creamy])
//        case .simple:
//            Tags()
//        case .granulatedSugar:
//            Tags(textures: [.unrefined])
//        case .orangeFlowerWater:
//            Tags(flavors: [.whiteFlower], profiles: [.floral])
//        case .sodaWater:
//            Tags()
//        case .eggWhites:
//            Tags(textures: [.silky, .light])
//        case .gingerSyrup:
//            Tags(flavors: [.ginger])
//        case .honeySyrup:
//            Tags(flavors: [.honey])
//        case .richDem:
//            Tags()
//        case .passionfruitSyrup:
//            Tags(flavors: [.passionfruit])
//        case .cucumberSyrup:
//            Tags(flavors: [.cucumber])
//        case .orgeat:
//            Tags(flavors: [.almond])
//        case .cranberryJuice:
//            Tags(flavors: [.cranberry])
//        case .grenadine:
//            Tags(flavors: [.pomegranate])
//        case .pineappleJuice:
//            Tags(flavors: [.pineapple], profiles: [.fruity])
//        case .blackBerry:
//            Tags(flavors: [.blackberry], profiles: [.fruity])
//        case .sage:
//            Tags(flavors: [.sage], profiles: [.herbal, .aromatic])
//        case .mint:
//            Tags(flavors: [.mint], profiles: [.herbal, .aromatic])
//        case .sparklingWater:
//            Tags(textures: [.effervescent])
//        case .agaveSyrup:
//            Tags(flavors: [.agave])
//        case .raspberries:
//            Tags(flavors: [.raspberry])
//        case .salt:
//            Tags()
//        case .grapefruitSoda:
//            Tags(flavors: [.grapefruit], profiles: [.fruity], textures: [.effervescent])
//        case .raspberrySyrup:
//            Tags(flavors: [.raspberry])
//        case .demSyrupOneToOne:
//            Tags()
//        case .nutmeg:
//            Tags(flavors: [.nutmeg])
//        case .egg:
//            Tags()
//        }
//    }
//}
