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
    case mezcalAny            = "Mezcal (Any)"
    case mezcalSmokey         = "Mezcal (Smokey)"
    case mezcalNotSmokey      = "Mezcal (Not Smokey)"
    case tequilaAny           = "Tequila (Any)"
    case tequilaAnejo         = "Tequila Anejo"
    case tequilaBlanco        = "Tequila Blanco"
    case tequilaReposado      = "Tequila Reposado"
    
    
    var tags: Tags {
        switch self {
        case .mezcalSmokey:
            Tags(profiles: [.smokey], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny))])
        case .mezcalNotSmokey:
            Tags(booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny))])
        case .tequilaAnejo:
            Tags(booze: [Booze(.agaves(self)),Booze(.agaves(.tequilaAny))])
        case .tequilaBlanco:
            Tags(booze: [Booze(.agaves(self)),Booze(.agaves(.tequilaAny))])
        case .tequilaReposado:
            Tags(booze: [Booze(.agaves(self)),Booze(.agaves(.tequilaAny))])
        case .tequilaAny:
            Tags(booze: [Booze(.agaves(self))])
        case .mezcalAny:
            Tags(booze: [Booze(.agaves(self))])
        }
      
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.agaves(self)))
    }
    
}


enum Brandy: String, Codable, CaseIterable {
    case brandyAny            = "Brandy (Any)"
    case armagnac             = "Armagnac"
    case cognacVSOP           = "Cognac (VSOP)"
    case pisco                = "Pisco"
    
    var tags: Tags {
        return Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.brandies(self)))
    }
}

enum Gin: String, Codable, CaseIterable {
    case ginAny               = "Gin (Any)"
    case ginLondonDry         = "Gin (London Dry)"
    
    var tags: Tags {
        switch self {
        case .ginAny:
            Tags(flavors: [.juniper], booze: [Booze(.gins(self))])
        case .ginLondonDry:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.gins(self)))
    }
}

// Other can be Aquavit, Malort, Absinthe etc.
enum OtherAlcohol: String, Codable, CaseIterable {
    case absinthe             = "Absinthe"
   
    
    
    var tags: Tags {
        switch self {
        case .absinthe:
            Tags(flavors: [.anise], booze: [Booze(.otherAlcohol(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.otherAlcohol(self)))
    }
}

enum Rum: String, Codable, CaseIterable {
    case cachaca              = "Cachaca"
    case rum                  = "Rum"
    case rumAny               = "Rum (Any)"
    case rumAged              = "Rum (Aged)"
    case rumBlackStrap        = "Rum (Black Strap)"
    case rumDemerara          = "Rum (Demerara)"
    case rumJamaicanAged      = "Rum (Jamaican, Aged)"
    case rumWhite             = "Rum (White)"
    
    var tags: Tags {
        //return Tags(booze: [Booze(.rums(self))])
        switch self {
        case .cachaca:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rum:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumAged:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumBlackStrap:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumDemerara:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumJamaicanAged:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumWhite:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumAny:
            Tags(booze: [Booze(.rums(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.rums(self)))
    }
}

enum Vodka: String, Codable, CaseIterable {
    case peanutButterVodka    = "Vodka (Peanut Butter Infused)"
    case vodkaAny             = "Vodka(Any)"
    case vodkaCitrus          = "Vodka(Citrus Infused)"
    case zubrowka             = "Zubrowka Bison Grass Vodka"
    
    
    var tags: Tags {
        switch self {
        case .vodkaAny:
            Tags(booze: [Booze(.vodkas(self))])
        case .vodkaCitrus:
            Tags(flavors: [.lemon], booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        case .zubrowka:
            Tags(booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        case .peanutButterVodka:
            Tags(flavors: [.peanut], booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.vodkas(self)))
    }
}

enum Whiskey: String, Codable, CaseIterable {
    case whiskeyAny           = "Whisk(e)y (Any)"
    case bourbon              = "Bourbon"
    case irishWhiskey         = "Irish Whiskey"
    case ryeWhiskey           = "Rye Whiskey"
    case straightRyeOrBourbon = "Straight Rye or Bourbon (100 proof)"
    case scotchBlended        = "Scotch (Blended)"
    case scotchIsla           = "Scotch (Peated, From Isla)"
    case bourbon120           = "Bourbon (120 proof)"
    
    var tags: Tags {
        //return Tags(booze: [Booze(.whiskies(self))])
        switch self {
        case .bourbon:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .irishWhiskey:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .ryeWhiskey:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .straightRyeOrBourbon:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .scotchBlended:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .scotchIsla:
            Tags(flavors: [.peat], profiles: [.smokey], booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .bourbon120:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .whiskeyAny:
            Tags(booze: [Booze(.whiskies(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.whiskies(self)))
    }
}
enum Liqueur: String, Codable, CaseIterable {
    case cointreau            = "Cointreau"
    case cremeDeCacao         = "Creme de Cacao"
    case giffardPamplemousse  = "Giffard Creme de Pamplemousse"
    case giffardBanane        = "Giffard Banane Du Bresil"
    case greenChartreuse      = "Green Chartreuse"
    case licor43              = "Licor 43"
    case maraschinoLiqueur    = "Maraschino Liqueur"
    case orangeCuracao        = "Orange Curacao"
    case velvetFalernum       = "Velvet Falernum"
    case yellowChartreuse     = "Yellow Chartreuse"

    
    var tags: Tags {
        switch self {
        case .cointreau:
            Tags(flavors: [.orange, .whiteFlower], booze: [Booze(.liqueurs(self))])
        case .cremeDeCacao:
            Tags(flavors: [.chocolate], booze: [Booze(.liqueurs(self))])
        case .giffardPamplemousse:
            Tags(flavors: [.grapefruit], booze: [Booze(.liqueurs(self))])
        case .greenChartreuse:
            Tags(flavors: [.angelica], profiles: [.herbal, .botanical], booze: [Booze(.liqueurs(self))])
        case .maraschinoLiqueur:
            Tags(flavors: [.cherry], booze: [Booze(.liqueurs(self))])
        case .orangeCuracao:
            Tags(flavors: [.orange], booze: [Booze(.liqueurs(self))])
        case .velvetFalernum:
            Tags(flavors: [.clove, .almond], booze: [Booze(.liqueurs(self))])
        case .yellowChartreuse:
            Tags(flavors: [.angelica], profiles: [.herbal, .botanical], booze: [Booze(.liqueurs(self))])
        case .licor43:
            Tags(flavors: [.bakingSpices, .vanilla, .cinnamon, .clove], booze: [Booze(.liqueurs(self))])
        case .giffardBanane:
            Tags(flavors: [.banana], booze: [Booze(.liqueurs(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.liqueurs(self)))
    }

}
enum FortifiedWine: String, Codable, CaseIterable {
    case amontillado          = "Amontillado Sherry"
    case blancVermouth        = "Blanc Vermouth"
    case cocchiAmericano      = "Cocchi Americano"
    case dryVermouth          = "Dry Vermouth (French)"
    case lilletBlanc          = "Lillet Blanc"
    case puntEMes             = "Punt E Mes"
    case rougeVermouth        = "Rouge Vermouth (Fruit Forward)"
    case sweetVermouth        = "Sweet Vermouth"
    
    var tags: Tags {
        return Tags(booze: [Booze(.fortifiedWines(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.fortifiedWines(self)))
    }
}

enum Wine: String, Codable, CaseIterable {
    case champagne            = "Champagne (Chilled)"
    case prosecco             = "Prosecco (Chilled)"
    
    var tags: Tags {
        return Tags(booze: [Booze(.wines(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.wines(self)))
    }

}
enum Bitters: String, Codable, CaseIterable {
    case blackWalnut          = "Black Walnut Bitters (Fee Brothers)"
    case orangeBitters        = "Orange Bitters"
    case angosturaBitters     = "Angostura Bitters"
    case peychauds            = "Peychaud's Bitters"
    
    var tags: Tags {
        switch self {
        case .blackWalnut:
            Tags(flavors: [.walnut], booze: [Booze(.bitters(self))])
        case .orangeBitters:
            Tags(flavors: [.orange], booze: [Booze(.bitters(self))])
        case .angosturaBitters:
            Tags(flavors: [.bakingSpices], booze: [Booze(.bitters(self))])
        case .peychauds:
            Tags(flavors: [.tarragon, .cherry], booze: [Booze(.bitters(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.bitters(self)))
    }
}

enum Amaro: String, Codable, CaseIterable {
    case amaroAny             = "Amaro (Any)"
    case aperol               = "Aperol"
    case amaroMontenegro      = "Montenegro (Amaro)"
    case amaroNonino          = "Nonino (Amaro)"
    case becherovka           = "Becherovka"
    case campari              = "Campari"
    case fernetBranca         = "Fernet Branca"
    case fernetBrancaMenta    = "Fernet Branca Menta"
    case suze                 = "Suze"
    
    var tags: Tags {
        switch self {
        case .aperol:
            Tags(flavors: [.grapefruit, .rhubarb], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .amaroMontenegro:
            Tags(profiles: [.floral, .herbal], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .amaroNonino:
            Tags(profiles: [.herbal], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .becherovka:
            Tags(flavors: [.clove, .cinnamon], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .campari:
            Tags(profiles: [.bitter, .bittersweet], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .fernetBranca:
            Tags(flavors: [.anise], profiles: [.herbal, .medicinal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .fernetBrancaMenta:
            Tags(flavors: [.anise, .menthol, .mint], profiles: [.herbal, .medicinal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .suze:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .amaroAny:
            Tags(booze: [Booze(.amari(.amaroAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.amari(self)))
    }
}
