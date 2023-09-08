//
//  BasicSwiftDataModelRef.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/7/23.
//

import Foundation
import SwiftData
import SwiftUI


@Model
class Cocktail: Identifiable {
    
    let id = UUID()
    var name: String
    
    //var image: CocktailImage
    var background: BackgroundColor
    
    //    let glasswareType: Glassware
    let garnish: Garnish
    //
    let spec: [CocktailIngredient]
    //    let buildOrder: Build?
    //
    //    let attribution: String?
    //
    
        var flavor: SearchTags.Flavor
    //    let styles = [SearchTags.Style]()
    //    let textures = [SearchTags.Texture]()
    //     let profiles = [SearchTags.Profile]()
    
    init(name: String, background: BackgroundColor, garnish: Garnish, spec: [CocktailIngredient], flavor: SearchTags.Flavor) {
        self.name = name
        self.background = background
        self.garnish = garnish
        self.spec = spec
        self.flavor = flavor
    }
}


@Model
class CocktailIngredient: Identifiable {
    let id = UUID()
    let name: Ingredient
    let value: Double
    let unit: MeasurementUnit
    
    init(name: Ingredient, value: Double, unit: MeasurementUnit = .fluidOunces) {
        self.name = name
        self.value = value
        self.unit = unit
    }
    
    func localizedVolumetricString(location: Location) -> String {
        switch location {
        case .usa:
            return "\(value) \(unit)"
        case .world:
            return "\(self.value * 29.5735) mls"
        }
    }
    
}

enum Location {
    case usa
    case world
}

enum Ingredient: String, Codable {
    
    // NA

    case lemon             = "Lemon Juice"
    case lime              = "Lime Juice"
    case cream             = "Heavy Cream"
    case simple            = "Simple Syrup (1:1)"
    case orangeFlowerWater = "Orange Flower Water"
    case sodaWater         = "Soda Water"
    case eggWhites         = "Egg Whites"
    case gingerSyrup       = "Ginger Syrup"
    case honeySyrup        = "Honey Syrup"
    case richDem           = "Rich Demerara Syrup (2:1)"
    case passionfruitSyrup = "Passionfruit Syrup"
    case cucumberSyrup     = "Cucumber Syrup"
    case orgeat            = "Orgeat"
    
    // FRUIT
    case blackBerry        = "Blackberry"
    case sage              = "Sage"
    
    /// SPIRITS
    case gin            = "Gin"
    case whiteRum       = "White Rum"
    case agedRum        = "Aged Rum"
    case blackStrapRum  = "Black Strap Rum"
    case rum            = "Rum"
    case vodka          = "Vodka"
    case ryeWhiskey     = "Rye Whiskey"
}

enum MeasurementUnit: String, Codable {
    case grams          = "grams"
    case fluidOunces    = "oz"
    case teaspoons      = "tsp"
    case disc           = "disc, with flesh"
    case limeQuarters   = "lime, quartered"
    case slices         = "slices"
    case sliceOf        = "slice of"
    case dash           = "dash"
    case dashes         = "dashes"
    case berries        = "berries"
    case leaves         = "leaves"
}



@Model
class Garnish {
    let name: String
    let imageAsset: Image
    
    init(name: String, imageAsset: Image) {
        self.name = name
        self.imageAsset = imageAsset
    }
}

enum GarnishWrong: Codable {
    case orangePeel
    case limeWheel
    case cucumberSlices
    case skeweredBlackberryAndSage
    
    var name: String {
        switch self {
        case .orangePeel:
            "Orange Peel"
        case .limeWheel:
            "Lime Wheel"
        case .cucumberSlices:
            "Cucumber Slices"
        case .skeweredBlackberryAndSage:
            "Skewered blackberry and sage leaf"
        }
    }
    
    var imageAsset: Image {
        switch self {
        case .orangePeel:
            Image(systemName: "cirle.fill")
        case .limeWheel:
            Image(systemName: "cirle.fill")
        case .cucumberSlices:
            Image(systemName: "cirle.fill")
        case .skeweredBlackberryAndSage:
            Image(systemName: "cirle.fill")
        }
    }
}


struct SearchTags: Codable {
    
    enum Flavor: String, Codable {
        
        case lemon          = "Lemon"
        case lime           = "Lime"
        case cream          = "Heavy Cream"
        case orange         = "Orange"
        case eggWhites      = "Egg Whites"
        case ginger         = "Ginger"
        case honey          = "Honey"
        case passionfruit   = "Passionfruit"
        case cucumber       = "Cucumber"
        case almond         = "Almond"
        
    }
}



enum BackgroundColor: Codable {
    case orange
    case blue
    case pink
    
    var colors: Color {
        switch self {
        case .orange:
            return .orange
        case .blue:
            return .blue
        case .pink:
            return .pink
        }
    }
}

enum Spirt: Codable {
    case gin
    case whiskey
    case rum
    
    var example: String {
        switch self {
        case .gin:
            return "Beefeater"
        case .whiskey:
            return "Jack Daniels"
        case .rum:
            return "Bacardi"
        }
    }
    
    var flavors: [String] {
        switch self {
        case .gin:
            return ["herbaceous", "piney", "citrus"]
        case .whiskey:
            return ["herbaceous", "piney", "citrus"]
        case .rum:
            return ["herbaceous", "piney", "citrus"]
        }
    }
}
    

