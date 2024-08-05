//
//  SubCategories.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/17/24.
//

import Foundation

// DELETE ME!
enum SubCategories: String, Codable, CaseIterable {
    //Agave
    case mezcalAny                    = "Mezcal"
    case mezcalEspadin                = "Mezcal Espadine"
    case mezcalSmokeyAny              = "Mezcal (Smokey)"
    case mezcalNotSmokeyAny           = "Mezcal (Not Smokey)"
    case tequilaAny                   = "Tequila"
    case tequilaAnejo                 = "Tequila Anejo"
    case tequilaBlanco                = "Tequila Blanco"
    case tequilaReposado              = "Tequila Reposado"
    
    //Brandy
    case appleBrandy                  = "Apple Brandy"
    case armagnac                     = "Armagnac"
    case cognacVSOP                   = "Cognac (VSOP)"
    case bondedApple                  = "Bonded Apple Brandy"
    case brandyAny                    = "Brandy"
    case pisco                        = "Pisco"
    case peruvianMustoVerde           = "Peruvian Musto Verde Pisco"
    
    //Gin
    case ginAny                       = "Gin"
    case ginLondonDry                 = "Gin (London Dry)"
    case navyStrengthGin              = "Navy Strength Gin"
    
    //Other Alcohol
    //case absinthe                 = "Absinthe"
    //any cocktail we have with Absinthe is just Absinthe in all loaded cocktails. There are no variations in the app.
    
    //Rum
    case cachaca                      = "Cachaca"
    case goldJamaicanRum              = "Gold Jamaican Rum"
    case goldPuertoRicanRum           = "Gold Puerto Rican Rum"
    case rumWhiteAgricole             = "Rum (White Agricole)"
    case rumAny                       = "Rum"
    case rumAged                      = "Rum (Aged)"
    case rumAgedCuban                 = "Rum (Aged Cuban Style)"
    case rumBlackStrap                = "Rum (Black Strap)"
    case rumDark                      = "Rum (Dark)"
    case rumDemerara                  = "Rum (Demerara)"
    case rumDominican                 = "Rum (Dominican)"
    case rumJamaicanAged              = "Rum (Jamaican, Aged)"
    case rumPuertoRican               = "Rum (Puerto Rican)"
    case rumWhite                     = "Rum (White)"
    
    //Vodka
    case vodkaAny                     = "Vodka"
    
    //Whisk(e)y
    case americanWhiskeyAny           = "American Whiskey"
    case bourbonAny                   = "Bourbon"
    case canadianWhiskeyAny           = "Canadian Whiskey"
    case irishWhiskeyAny              = "Irish Whiskey"
    case japaneseWhiskeyAny           = "Japanese Whiskey"
    case ryeWhiskeyAny                = "Rye Whiskey"
    case scotchAny                    = "Scotch"
    case scotchBlended                = "Scotch (Blended)"
    case scotchHighland               = "Scotch (Highland)"
    case scotchSpeyside               = "Scotch (Speyside)"
    case scotchIsla                   = "Scotch (Peated, From Isla)"
    case whiskeyAny                   = "Whisk(e)y"
    
    //Fortified Wine
    case amontillado                  = "Amontillado Sherry"
    case blancVermouth                = "Blanc Vermouth"
    case dryVermouthAny               = "Dry Vermouth (French)"
    case fino                         = "Fino Sherry"
    case oloroso                      = "Oloroso Sherry"
    case sweetVermouthAny             = "Sweet Vermouth"
    case tawnyPort                    = "Tawny Port"
    case vermouthAny                  = "Vermouth"
    case sherryAny                    = "Sherry"
    case fortifiedWineAny             = "Fortified Wine"
    
    //Bitters
    case bitters                      = "Bitters"
    
    //Amaro
    case amaroAny                     = "Amaro"
}
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
    case amari             = "Amari"
    

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
    case amari             = "Amari"
    
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
    case ginLondonDry                 = "Gin (London Dry)"
    case navyStrengthGin              = "Navy Strength Gin"
    
    //Rum
    case cachaca                      = "Cachaca"
    case rumAged                      = "Rum (Aged)"
    case rumDemerara                  = "Rum (Demerara)"
    case rumDominican                 = "Rum (Dominican)"
    case rumPuertoRican               = "Rum (Puerto Rican)"
    case rumWhite                     = "Rum (White)"
    case rumDark                      = "Rum (Dark)"
    
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
        let categoryMap: [BaseCategory: [any BoozeType]] = [
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
    case mezcalSmokeyAny              = "Mezcal (Smokey)"
    case mezcalNotSmokeyAny           = "Mezcal (Not Smokey)"
    
    //tequilaAny
    case tequilaAnejo                 = "Tequila Anejo"
    case tequilaBlanco                = "Tequila Blanco"
    case tequilaReposado              = "Tequila Reposado"
    
    //rumAged
    case goldJamaicanRum              = "Gold Jamaican Rum"
    case goldPuertoRicanRum           = "Gold Puerto Rican Rum"
    case rumAgedCuban                 = "Rum (Aged Cuban Style)"
    case rumJamaicanAged              = "Rum (Jamaican, Aged)"
    case rumBlackStrap                = "Rum (Black Strap)"
    
    //rumWhite
    case rumWhiteAgricole             = "Rum (White Agricole)"
    
    //americanWhiskeyAny
    case bourbonAny                   = "Bourbon"
    case ryeWhiskeyAny                = "Rye Whiskey"
    case straightRyeOrBourbon         = "Straight Rye or Bourbon"
    
    //scotchAny
    case scotchBlended                = "Scotch (Blended)"
    case scotchHighland               = "Scotch (Highland)"
    case scotchIsla                   = "Scotch (Peated, From Isla)"
    
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
        let categoryMap: [SpecialtyCategory: [any BoozeType]] = [
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
