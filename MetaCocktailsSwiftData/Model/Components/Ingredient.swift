//
//  Ingredient.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftData



@Model
class CocktailIngredient {

    let id = UUID()
    let ingredient: Ingredient
    let value: Double
    let unit: MeasurementUnit
    
    init(_ ingredient: Ingredient, value: Double, unit: MeasurementUnit = .fluidOunces) {
        self.ingredient = ingredient
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


enum Ingredient: String, Codable {
    // NA

    case lemon             = "Lemon Juice"
    case lime              = "Lime Juice"
    case cream             = "Heavy Cream"
    case simple            = "Simple Syrup (1:1)"
    case granulatedSugar   = "Granulated Sugar"
    case orangeFlowerWater = "Orange Flower Water"
    case sodaWater         = "Soda Water"
    case eggWhites         = "Egg Whites"
    case gingerSyrup       = "Ginger Syrup"
    case honeySyrup        = "Honey Syrup"
    case richDem           = "Rich Demerara Syrup (2:1)"
    case passionfruitSyrup = "Passionfruit Syrup"
    case cucumberSyrup     = "Cucumber Syrup"
    case orgeat            = "Orgeat"
    case cranberryJuice    = "Cranberry Juice"
    case granadine         = "Grenadine (Pomegranate Syrup, Not Roses Grenadine)"
    case pineappleJuice    = "Fresh Pineapple Juice"
    
    // FRUIT
    case blackBerry        = "Blackberry"
    case sage              = "Sage"
    
    //Herbs
    case mint              = "Mint Leaves"

    // SPIRITS
    case gin               = "Gin"
    case whiteRum          = "White Rum"
    case agedRum           = "Aged Rum"
    case blackStrapRum     = "Black Strap Rum"
    case agedJamaicanRum   = "Aged Jamaican Rum"
    case rum               = "Rum"
    case vodka             = "Vodka"
    case citrusVodka       = "Citrus Vodka"
    case ryeWhiskey        = "Rye Whiskey"
    case peatedScotch      = "Peated Scotch (From Isla)"
    case blendedScotch     = "Blended Scotch"
    case bourbon           = "Bourbon"
    case demeraraRum       = "Demerara Rum"
    case cachaca           = "Cachaca"
    case VSOPCognac        = "VSOP Cognac"

    // LIQEURS
    case orangeCuracao     = "Orange Curacao"
    case cointreau         = "Cointreau"

    // AMARI
    case aperol            = "Aperol"
    case amaroNonino       = "Amaro Nonino"
    case campari           = "Campari"

    //WINE
    case prosecco          = "Chilled Prosecco"
    case champagne         = "Chilled Champagne"

    //Fortified Wine
    case sweetVermouth     = "Sweet Vermouth"
    case blancVermouth     = "Blanc Vermouth"
    case dryVermouth       = "French Dry Vermouth"
    case puntEMes          = "Punt E Mes"
    case cocchiAmericano   = "Cocchi Americano"
    case amontillado       = "Amontillado Sherry"

    //Water
    case sparklingWater    = "Chilled Sparkling Water"
    

    //Bitters
    case orangeBitters     = "Orange Bitters"
    case angosturaBitters  = "Angostura Bitters"

    var tags: Tags {
        switch self {
        case .lemon:
            Tags(flavors: [.lemon], profiles: [.tart, .sour, .citrusy])
        case .lime:
            Tags(flavors: [.lime,], profiles: [.tart, .sour, .citrusy])
        case .cream:
            Tags(flavors: [.cream], profiles: [.creamy], textures: [.rich])
        case .simple:
            Tags()
        case .granulatedSugar:
            Tags(textures: [.grainy])
        case .orangeFlowerWater:
            Tags(flavors: [.orange, .whiteFlower], profiles: [.floral])
        case .sodaWater:
            Tags()
        case .eggWhites:
            Tags(textures: [.silky, .light])
        case .gingerSyrup:
            Tags(flavors: [.ginger], profiles: [.spicy, .sharp])
        case .honeySyrup:
            Tags(flavors: [.honey])
        case .richDem:
            Tags()
        case .passionfruitSyrup:
            Tags(flavors: [.passionfruit])
        case .cucumberSyrup:
            Tags(flavors: [.cucumber])
        case .orgeat:
            Tags(flavors: [.almond, .orange])
        case .cranberryJuice:
            Tags(flavors: [.cranberry])
        case .granadine:
            Tags(flavors: [.pomegranate])
        case .pineappleJuice:
            Tags(flavors: [.pineapple], profiles: [.fruity])
        case .blackBerry:
            Tags(flavors: [.blackberry], profiles: [.fruity])
        case .sage:
            Tags(flavors: [.sage], profiles: [.herbal, .aromatic])
        case .mint:
            Tags(flavors: [.mint], profiles: [.herbal, .aromatic])
        case .gin:
            Tags(flavors: [.juniper, .citrusPeel], profiles: [.floral, .aromatic])
        case .whiteRum:
            Tags()
        case .agedRum:
            Tags(flavors: [.vanilla])
        case .blackStrapRum:
            Tags(flavors: [.vanilla, .molasses])
        case .agedJamaicanRum:
            Tags(flavors: [.hogo, .vanilla, .funkyRum])
        case .rum:
            Tags()
        case .vodka:
            Tags()
        case .citrusVodka:
            Tags(flavors: [.citrusPeel], profiles: [.citrusy])
        case .ryeWhiskey:
            Tags(flavors: [.rye, .vanilla, .bakingSpices, .whiskey])
        case .peatedScotch:
            Tags(flavors: [.peat, .vanilla, .maltedBarley, .whiskey], profiles: [.smokey])
        case .blendedScotch:
            Tags(flavors: [.maltedBarley, .vanilla, .whiskey])
        case .bourbon:
            Tags(flavors: [.vanilla, .bakingSpices, .whiskey])
        case .demeraraRum:
            Tags(flavors: [.vanilla, .bakingSpices])
        case .cachaca:
            Tags(flavors: [.funkyRum, .hogo])
        case .VSOPCognac:
            Tags(flavors: [.vanilla], profiles: [.fruity])
        case .orangeCuracao:
            Tags(flavors: [.orange], profiles: [.medicinal])
        case .cointreau:
            Tags(flavors: [.orange, .whiteFlower])
        case .aperol:
            Tags(flavors: [.rhubarb, .orange, .grapefruit], profiles: [.bitter, .sweet])
        case .amaroNonino:
            Tags(profiles: [.herbal, .bitter, .sweet])
        case .campari:
            Tags(profiles: [.bitter, .sweet])
        case .prosecco:
            Tags(profiles: [.dry], textures: [.effervescent, .bubbly])
        case .champagne:
            Tags(profiles: [.dry, .sweet], textures: [.effervescent, .bubbly])
        case .sweetVermouth:
            Tags(profiles: [.bitter, .sweet, .herbal, .botanical])
        case .blancVermouth:
            Tags(profiles: [.sweet, .fruity])
        case .dryVermouth:
            Tags(profiles: [.dry, .fruity, .aromatic])
        case .puntEMes:
            Tags(profiles: [.bitter, .sweet, .herbal, .botanical])
        case .cocchiAmericano:
            Tags(profiles: [.dry, .fruity, .bitter, .sweet])
        case .amontillado:
            Tags(profiles: [.dry, .bright ], textures: [.thin])
        case .sparklingWater:
            Tags(textures: [.effervescent])
        case .orangeBitters:
            Tags(flavors: [.orange], profiles: [.bitter])
        case .angosturaBitters:
            Tags(flavors: [.bakingSpices], profiles: [.dry, .bitter, .aromatic])
        }
    }
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
    case ml             = "ml"
    case barspoon       = "Barspoon"
}
