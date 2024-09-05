//
//  SubCategories.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/17/24.
//

import Foundation


enum UmbrellaCategory: String, Codable, CaseIterable  {
    
    case syrups            = "Syrups"
    case juices            = "Juice"
    case herbs             = "Herbs"
    case fruit             = "Fruit"
    case seasoning         = "Seasoning"
    case soda              = "Sodas"
    case otherNonAlc       = "Other N/A"
    case agaves            = "Agave Spirits"
    case brandies          = "Brandy"
    case gins              = "Gin"
    case otherAlcohol      = "Other Alcohol"
    case rums              = "Rum"
    case vodkas            = "Vodka"
    case whiskies          = "Whiskies"
    case liqueurs          = "Liqueurs"
    case fortifiedWines    = "Fortified Wine"
    case wines             = "Wine"
    case bitters           = "Bitters"
    case amari             = "Amaro"
    

}
enum SpiritsUmbrellaCategory: String, Codable, CaseIterable  {
    
    case agaves            = "Agave Spirits"
    case brandies          = "Brandy"
    case gins              = "Gin"
    case rums              = "Rum"
    case vodkas            = "Vodka"
    case whiskies          = "Whiskies"
    case liqueurs          = "Liqueurs"
    case fortifiedWines    = "Fortified Wine"
    case wines             = "Wine"
    case bitters           = "Bitters"
    case amari             = "Amaro"
    
    var subCategories: [String] {
        switch self {
        case .agaves:
            return Agave.allCases.map({$0.rawValue})
        case .brandies:
            return Brandy.allCases.map({$0.rawValue})
        case .gins:
            return Gin.allCases.map({$0.rawValue})
        case .rums:
            return Rum.allCases.map({$0.rawValue})
        case .vodkas:
            return Vodka.allCases.map({$0.rawValue})
        case .whiskies:
            return Whiskey.allCases.map({$0.rawValue})
        case .liqueurs:
            return Liqueur.allCases.map({$0.rawValue})
        case .fortifiedWines:
            return FortifiedWine.allCases.map({$0.rawValue})
        case .wines:
            return Wine.allCases.map({$0.rawValue})
        case .bitters:
            return Bitters.allCases.map({$0.rawValue})
        case .amari:
            return Amaro.allCases.map({$0.rawValue})
        }
    }
}

enum BaseCategory: String, Codable, CaseIterable {
    
    //Agave
    case mezcalAny                    = "Mezcal"
    case tequilaAny                   = "Tequila"
    
    //Brandy
    case appleBrandy                  = "Apple Brandy"
    case armagnac                     = "Armagnac"
    case cognac                       = "Cognac"
    case pisco                        = "Pisco"
    
    //Gin
    case ginLondonDry                 = "London Dry Gin"
    case navyStrengthGin              = "Navy Strength Gin"
    
    //Rum
    case cachaca                      = "Cachaca"
    case rumAged                      = "Aged Rum"
    case rumDemerara                  = "Demerara Rum"
    case rumDominican                 = "Dominican Rum"
    case rumPuertoRican               = "Puerto Rican Rum"
    case rumWhite                     = "White Rum"
    case rumDark                      = "Dark Rum"
    
    //Whisk(e)y
    case americanWhiskeyAny           = "American Whiskey"
    case canadianWhiskeyAny           = "Canadian Whiskey"
    case irishWhiskeyAny              = "Irish Whiskey"
    case japaneseWhiskeyAny           = "Japanese Whiskey"
    case scotchAny                    = "Scotch"
    
    //Fortified Wine
    case vermouthAny                  = "Vermouth"
    case sherryAny                    = "Sherry"
    case port                         = "Port"
    
    var baseCategoryIngredients: [String] {
        let categoryMap: [BaseCategory: [any IngredientTagsProtocol]] = [
            .mezcalAny: Agave.allCases,
            .tequilaAny: Agave.allCases,
            .appleBrandy: Brandy.allCases,
            .armagnac: Brandy.allCases,
            .cognac: Brandy.allCases,
            .pisco: Brandy.allCases,
            .ginLondonDry: Gin.allCases,
            .navyStrengthGin: Gin.allCases,
            .cachaca: Rum.allCases,
            .rumAged: Rum.allCases,
            .rumDemerara: Rum.allCases,
            .rumDominican: Rum.allCases,
            .rumPuertoRican: Rum.allCases,
            .rumWhite: Rum.allCases,
            .rumDark: Rum.allCases,
            .americanWhiskeyAny: Whiskey.allCases,
            .canadianWhiskeyAny: Whiskey.allCases,
            .irishWhiskeyAny: Whiskey.allCases,
            .japaneseWhiskeyAny: Whiskey.allCases,
            .scotchAny: Whiskey.allCases,
            .vermouthAny: FortifiedWine.allCases,
            .sherryAny: FortifiedWine.allCases,
            .port: FortifiedWine.allCases
        ]
        

        guard let boozeTypes = categoryMap[self] else { return [] }
        
        var baseCategoryStrings: [String] = []
        for booze in boozeTypes {
            if let tags = booze.tags.booze {
                if tags.map({ $0.name }).contains(self.rawValue) && booze.rawValue != self.rawValue {
                    baseCategoryStrings.append(booze.rawValue)
                }
            }
        }
        return baseCategoryStrings
    }

}
enum SpecialtyCategory: String, Codable, CaseIterable {
   
    
    //mezcalAny
    case mezcalEspadin                = "Mezcal Espadine"
    case mezcalSmokeyAny              = "Smokey Mezcal"
    case mezcalNotSmokeyAny           = "Not Smokey Mezcal"
    
    //tequilaAny
    case tequilaAnejo                 = "Tequila Anejo"
    case tequilaBlanco                = "Tequila Blanco"
    case tequilaReposado              = "Tequila Reposado"
    
    //rumAged
    case goldJamaicanRum              = "Gold Jamaican Rum"
    case goldPuertoRicanRum           = "Gold Puerto Rican Rum"
    case rumAgedCuban                 = "Aged Cuban Rum"
    case rumJamaicanAged              = "Aged Jamaican Rum"
    case rumBlackStrap                = "Black Strap Rum"
    
    //rumWhite
    case rumWhiteAgricole             = "White Agricole Rum"
    
    //americanWhiskeyAny
    case bourbonAny                   = "Bourbon"
    case ryeWhiskeyAny                = "Rye Whiskey"
    case straightRyeOrBourbon         = "Straight Rye or Bourbon"
    
    //scotchAny
    case scotchBlended                = "Blended Scotch"
    case scotchHighland               = "Highland Scotch"
    case scotchIsla                   = "Peated Scotch (Islay)"
    
    //sherryAny
    case amontillado                  = "Amontillado Sherry"
    case fino                         = "Fino Sherry"
    case oloroso                      = "Oloroso Sherry"
    
    //vermouthAny
    case blancVermouth                = "Blanc Vermouth"
    case dryVermouthAny               = "Dry Vermouth (French)"
    case sweetVermouthAny             = "Sweet Vermouth"
    
    //port
    case tawnyPort                    = "Tawny Port"
    
    var specialtyCategoryIngredients: [String] {
        let categoryMap: [SpecialtyCategory: [any IngredientTagsProtocol]] = [
            .mezcalEspadin: Agave.allCases,
            .mezcalSmokeyAny: Agave.allCases,
            .mezcalNotSmokeyAny: Agave.allCases,
            .tequilaBlanco: Agave.allCases,
            .tequilaReposado: Agave.allCases,
            .tequilaAnejo: Agave.allCases,
            .goldJamaicanRum: Rum.allCases,
            .goldPuertoRicanRum: Rum.allCases,
            .rumAgedCuban: Rum.allCases,
            .rumJamaicanAged: Rum.allCases,
            .rumBlackStrap: Rum.allCases,
            .rumWhiteAgricole: Rum.allCases,
            .bourbonAny: Whiskey.allCases,
            .ryeWhiskeyAny: Whiskey.allCases,
            .straightRyeOrBourbon: Whiskey.allCases,
            .scotchBlended: Whiskey.allCases,
            .scotchHighland: Whiskey.allCases,
            .scotchIsla: Whiskey.allCases,
            .amontillado: FortifiedWine.allCases,
            .fino: FortifiedWine.allCases,
            .oloroso: FortifiedWine.allCases,
            .blancVermouth: FortifiedWine.allCases,
            .dryVermouthAny: FortifiedWine.allCases,
            .sweetVermouthAny: FortifiedWine.allCases,
            .tawnyPort: FortifiedWine.allCases
        ]
        

        guard let boozeTypes = categoryMap[self] else { return [] }
        var specialtyCategoryStrings: [String] = []
        for booze in boozeTypes {
            if let tags = booze.tags.booze {
                if tags.map({ $0.name }).contains(self.rawValue) && booze.rawValue != self.rawValue {
                    specialtyCategoryStrings.append(booze.rawValue)
                }
            }
        }
        return specialtyCategoryStrings
    }
    
}
