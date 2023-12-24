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
    var nonAlcEnum: NonAlcEnum
}

protocol NonAlcoholicProtocol {
    var type: NonalcoholicCategory { get }
    var expressions: [String] { get }
}

protocol NonAlcEnum {
    var tags: Tags { get }
}

enum NonalcoholicCategory: String, Codable {
    case syrups     = "Syrups"
    case juices     = "Juices"
    case herbs      = "Herbs"
    case fruit      = "Fresh Fruit"
    case seasoning  = "Seasoning"
    case soda       = "Soda"
    case other      = "Other"
}

var butt = NonAlcoholicEnum.Syrups.agaveSyrup

struct NonAlcoholicEnum {
    
    enum Syrups: String, Codable, CaseIterable, NonAlcEnum {
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
    
    enum Juices: String, Codable, CaseIterable, NonAlcEnum {
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
    
    enum Herbs: String, Codable, CaseIterable, NonAlcEnum {
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
    
    enum Fruit: String, Codable, CaseIterable, NonAlcEnum {
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
    
    enum Seasonings: String, Codable, CaseIterable, NonAlcEnum {
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
    
    enum Soda: String, Codable, CaseIterable, NonAlcEnum {
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
    
    enum OtherNA: String, Codable, CaseIterable, NonAlcEnum {
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
                Tags(textures: [.silky, .light])
            case .egg:
                Tags()
            case .granulatedSugar:
                Tags(textures: [.unrefined])
            case .orangeFlowerWater:
                Tags(flavors: [.whiteFlower], profiles: [.floral])
            }
        }
    }
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
