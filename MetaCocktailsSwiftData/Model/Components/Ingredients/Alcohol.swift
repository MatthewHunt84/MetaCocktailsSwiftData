//
//  Alcohol.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 12/26/23.
//

import Foundation

struct Booze: Codable, Hashable, Equatable {
    
    var ingredientType: IngredientType
    var name: String
    
    init(_ ingredientType: IngredientType) {
        self.ingredientType = ingredientType
        self.name = ingredientType.name
    }
    
    static func == (lhs: Booze, rhs: Booze) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

enum Agave: String, Codable, CaseIterable {
    case mezcalSmokey         = "Mezcal (Smokey)"
    case mezcalNotSmokey      = "Mezcal (Not Smokey)"
    case tequilaAnejo         = "Tequila Anejo"
    case tequilaBlanco        = "Tequila Blanco"
    case tequilaReposado      = "Tequila Reposado"
    
    var tags: Tags {
        return Tags(booze: [Booze(.agaves(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.agaves(self)))
    }
}


enum Brandy: String, Codable, CaseIterable {
    case armagnac             = "Armagnac"
    case cognacVSOP           = "Cognac (VSOP)"
    case pisco                = "Pisco"
    
    var tags: Tags {
        return Tags(booze: [Booze(.brandies(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.brandies(self)))
    }
}

enum Gin: String, Codable, CaseIterable {
    case gin                  = "Gin"
    case ginLondonDry         = "Gin (London Dry)"
    
    var tags: Tags {
        return Tags(booze: [Booze(.gins(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.gins(self)))
    }
}

// Other can be Aquavit, Malort, Absinthe etc.
enum OtherAlcohol: String, Codable, CaseIterable {
    case absinthe             = "Absinthe"
    
    var tags: Tags {
        return Tags(booze: [Booze(.otherAlcohol(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.otherAlcohol(self)))
    }
}

enum Rum: String, Codable, CaseIterable {
    case cachaca              = "Cachaca"
    case rum                  = "Rum"
    case rumAged              = "Rum (Aged)"
    case rumBlackStrap        = "Rum (Black Strap)"
    case rumDemerara          = "Rum (Demerara)"
    case rumJamaicanAged      = "Rum (Jamaican, Aged)"
    case rumWhite             = "Rum (White)"
    
    var tags: Tags {
        return Tags(booze: [Booze(.rums(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.rums(self)))
    }
}

enum Vodka: String, Codable, CaseIterable {
    case vodka                = "Vodka"
    case vodkaCitrus          = "Vodka(Citrus Infused)"
    
    
    var tags: Tags {
        return Tags(booze: [Booze(.vodkas(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.vodkas(self)))
    }
}

enum Whiskey: String, Codable, CaseIterable {
    case bourbon              = "Bourbon"
    case irishWhiskey         = "Irish Whiskey"
    case ryeWhiskey           = "Rye Whiskey"
    case straightRyeOrBourbon = "Straight Rye or Bourbon (100 proof)"
    case scotchBlended        = "Scotch (Blended)"
    case scotchIsla           = "Scotch (Peated, From Isla)"
    case bourbon120           = "Bourbon (120 proof)"
    
    var tags: Tags {
        return Tags(booze: [Booze(.whiskies(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.whiskies(self)))
    }
}
enum Liqueur: String, Codable, CaseIterable {
    case cointreau            = "Cointreau"
    case cremeDeCacao         = "Creme de Cacao"
    case giffardPamplemousse  = "Giffard Creme de Pamplemousse"
    case greenChartreuse      = "Green Chartreuse"
    case maraschinoLiqueur    = "Maraschino Liqueur"
    case orangeCuracao        = "Orange Curacao"
    case velvetFalernum       = "Velvet Falernum"
    case yellowChartreuse     = "Yellow Chartreuse"
    
    var tags: Tags {
        return Tags(booze: [Booze(.liqueurs(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.liqueurs(self)))
    }

}
enum FortifiedWine: String, Codable, CaseIterable {
    case amontillado          = "Amontillado Sherry"
    case blancVermouth        = "Blanc Vermouth"
    case cocchiAmericano      = "Cocchi Americano"
    case dryVermouth          = "French Dry Vermouth"
    case lilletBlanc          = "Lillet Blanc"
    case puntEMes             = "Punt E Mes"
    case rougeVermouth        = "Fruit Forward Rouge Vermouth"
    case sweetVermouth        = "Sweet Vermouth"
    
    var tags: Tags {
        return Tags(booze: [Booze(.fortifiedWines(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.fortifiedWines(self)))
    }
}

enum Wine: String, Codable, CaseIterable {
    case champagne            = "Chilled Champagne"
    case prosecco             = "Chilled Prosecco"
    
    var tags: Tags {
        return Tags(booze: [Booze(.wines(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.wines(self)))
    }

}
enum Bitters: String, Codable, CaseIterable {
    case orangeBitters        = "Orange Bitters"
    case angosturaBitters     = "Angostura Bitters"
    case peychauds            = "Peychaud's Bitters"
    
    var tags: Tags {
        return Tags(booze: [Booze(.bitters(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.bitters(self)))
    }
}

enum Amaro: String, Codable, CaseIterable {
    case aperol               = "Aperol"
    case amaroMontenegro      = "Amaro Montenegro"
    case amaroNonino          = "Amaro Nonino"
    case becherovka           = "Becherovka"
    case campari              = "Campari"
    case fernetBranca         = "Fernet Branca"
    case fernetBrancaMenta    = "Fernet Branca Menta"
    case suze                 = "Suze"
    
    var tags: Tags {
        return Tags(booze: [Booze(.amari(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.amari(self)))
    }
}
