//
//  NonAlcoholic.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 12/22/23.
//

import Foundation

// 1. Okay we're here. We want to make NonAlcEnum conform to codable, then use it for booze as well so Ingredients can just have a nonAlcEnum property we can use when passing to Cocktails as all the info we need:

let example = CocktailIngredient(ingredient: NonAlcoholic(name: "Sparkling water", nonalcoholicCategory: .soda, isBooze: false, nonAlcEnum: NonAlcoholicEnum.Juices.pineappleJuice), value: 1)

// from that nonAlcEnum property we can get the name (raw value) and type, and tags from the .tags variable. It's pretty neat.

// But before you embark on that conversion, lets check out if there's a better way to take two tags objects and merge them together.
// In Cocktail right now we have a CompileTags() functions where we
// make an initial tags array
// then loop through each category (flavors, profiles, booze, etc) and append tags if they exist from each individual ingredient
// it would be SO COOL if we could just merge them together in a single line.

//maybe that's a dictionary? Maybe it can't be done. But worth looking into. A dictionary has a merge function, I think we would just create multiple instances of the same types but that would be okay.
// So Dictionary1 = [flavors: .pineappleSyrup, textures: .creamy] + Dictionary2 = [flavors: .lime, booze: .lightRum]
// But this won't work because there can only be one key....


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
