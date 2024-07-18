//
//  SubCategories.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/17/24.
//

import Foundation


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
