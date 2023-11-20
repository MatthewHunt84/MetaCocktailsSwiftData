//
//  Ingredient.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftData

struct CocktailIngredient: Codable, Hashable {

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
    case agaveSyrup           = "Agave Syrup"
    case cranberryJuice       = "Cranberry Juice"
    case cream                = "Heavy Cream"
    case cucumberSyrup        = "Cucumber Syrup"
    case demSyrupOneToOne     = "Demerara Syrup 1:1"
    case eggWhites            = "Egg Whites"
    case gingerSyrup          = "Ginger Syrup"
    case granulatedSugar      = "Granulated Sugar"
    case grenadine            = "Grenadine (Pomegranate Syrup, Not Roses Grenadine)"
    case honeySyrup           = "Honey Syrup"
    case lemon                = "Fresh Squeezed Lemon Juice"
    case lime                 = "Fresh Squeezed Lime Juice"
    case orangeFlowerWater    = "Orange Flower Water"
    case orgeat               = "Orgeat"
    case passionfruitSyrup    = "Passionfruit Syrup"
    case pineappleJuice       = "Fresh Pineapple Juice"
    case raspberrySyrup       = "RaspberrySyrup"
    case richDem              = "Rich Demerara Syrup (2:1)"
    case simple               = "Simple Syrup (1:1)"
    case sodaWater            = "Soda Water"
    case egg                  = "1 Egg"
    
    // FRUIT
    case blackBerry           = "Blackberries"
    case raspberries          = "Raspberries"
       
    //Herbs
    case mint                 = "Mint Leaves"
    case sage                 = "Sage"
    
    // SPIRITS
    case absinthe             = "Absinthe"
    case armagnac             = "Armagnac"
    case bourbon              = "Bourbon"
    case bourbon120Proof      = "120 proof Bourbon"
    case cachaca              = "Cachaca"
    case gin                  = "Gin"
    case ginLondonDry         = "Gin (London Dry)"
    case irishWhiskey         = "Irish Whiskey"
    case mezcalSmokey         = "Smokey Mezcal"
    case mezcalNotSmokey      = "Mazcal (Not Smokey)"
    case pisco                = "Pisco"
    case rum                  = "Rum"
    case rumAged              = "Rum (Aged)"
    case rumBlackStrap        = "Rum (Black Strap)"
    case rumDemerara          = "Rum (Demerara)"
    case rumJamaicanAged      = "Rum (Jamaican, Aged)"
    case rumWhite             = "Rum (White)"
    case ryeWhiskey           = "Rye Whiskey"
    case straightRyeOrBourbon = "Straight Rye or Bourbon (100 proof)"
    case scotchBlended        = "Scotch (Blended)"
    case scotchIsla           = "Scotch (Peated, From Isla)"
    case tequilaAnejo         = "Tequila Anejo"
    case tequilaBlanco        = "Tequila Blanco"
    case tequilaReposado      = "Tequila Reposado"
    case vodka                = "Vodka"
    case vodkaCitrus          = "Vodka(Citrus Infused"
    case cognacVSOP           = "Cognac (VSOP)"
    
   
    // LIQEURS
    case cointreau            = "Cointreau"
    case cremeDeCacao         = "Creme de Cacao"
    case giffardPamplemousse  = "Giffard Creme de Pamplemousse"
    case greenChartreuse      = "Green Chartreuse"
    case maraschinoLiqueur    = "Maraschino Liqueur"
    case orangeCuracao        = "Orange Curacao"
    case yellowChartreuse     = "Yellow Chartreuse"
    
   
    // AMARI
    case aperol               = "Aperol"
    case amaroMontenegro      = "Amaro Montenegro"
    case amaroNonino          = "Amaro Nonino"
    case becherovka           = "Becherovka"
    case campari              = "Campari"
    case fernetBranca         = "Fernet Branca"
    case fernetBrancaMenta    = "Fernet Branca Menta"
    case suze                 = "Suze"
   
    //WINE
    case champagne            = "Chilled Champagne"
    case prosecco             = "Chilled Prosecco"
    
   
    //Fortified Wine
    case amontillado          = "Amontillado Sherry"
    case blancVermouth        = "Blanc Vermouth"
    case cocchiAmericano      = "Cocchi Americano"
    case dryVermouth          = "French Dry Vermouth"
    case lilletBlanc          = "Lillet Blanc"
    case puntEMes             = "Punt E Mes"
    case rougeVermouth        = "Fruit Forward Rouge Vermouth"
    case sweetVermouth        = "Sweet Vermouth"
    
   
    //Carbonated
    case sparklingWater       = "Chilled Sparkling Water"
    case grapefruitSoda       = "Cold Grapefruit Soda"
       
   
    //Bitters
    case orangeBitters        = "Orange Bitters"
    case angosturaBitters     = "Angostura Bitters"
    case peychauds            = "Peychaud's Bitters"
    
    //Seasonings
    case salt                 = "Salt"
    case nutmeg               = "Nutmeg"

    var tags: Tags {
        switch self {
        case .lemon:
            Tags(flavors: [.lemon], profiles: [.citrusy])
        case .lime:
            Tags(flavors: [.lime,], profiles: [.citrusy])
        case .cream:
            Tags(flavors: [.cream], profiles: [.creamy], textures: [.rich, .creamy])
        case .simple:
            Tags()
        case .granulatedSugar:
            Tags(textures: [.unrefined])
        case .orangeFlowerWater:
            Tags(flavors: [.whiteFlower], profiles: [.floral])
        case .sodaWater:
            Tags()
        case .eggWhites:
            Tags(textures: [.silky, .light])
        case .gingerSyrup:
            Tags(flavors: [.ginger])
        case .honeySyrup:
            Tags(flavors: [.honey])
        case .richDem:
            Tags()
        case .passionfruitSyrup:
            Tags(flavors: [.passionfruit])
        case .cucumberSyrup:
            Tags(flavors: [.cucumber])
        case .orgeat:
            Tags(flavors: [.almond])
        case .cranberryJuice:
            Tags(flavors: [.cranberry])
        case .grenadine:
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
            Tags(flavors: [.juniper])
        case .rumWhite:
            Tags()
        case .rumAged:
            Tags()
        case .rumBlackStrap:
            Tags(flavors: [.molasses])
        case .rumJamaicanAged:
            Tags(flavors: [.funky])
        case .rum:
            Tags()
        case .vodka:
            Tags()
        case .vodkaCitrus:
            Tags(flavors: [.citrusPeel], profiles: [.citrusy])
        case .ryeWhiskey:
            Tags()
        case .scotchIsla:
            Tags(flavors: [.peat], profiles: [.smokey])
        case .scotchBlended:
            Tags()
        case .bourbon:
            Tags()
        case .rumDemerara:
            Tags()
        case .cachaca:
            Tags(flavors: [.funky])
        case .cognacVSOP:
            Tags()
        case .orangeCuracao:
            Tags(flavors: [.orange])
        case .cointreau:
            Tags(flavors: [.orange, .whiteFlower])
        case .aperol:
            Tags(flavors: [.rhubarb, .orange, .grapefruit], profiles: [.bittersweet])
        case .amaroNonino:
            Tags(profiles: [.herbal, .bittersweet])
        case .campari:
            Tags(profiles: [.bitter])
        case .prosecco:
            Tags(textures: [.effervescent])
        case .champagne:
            Tags(textures: [.effervescent])
        case .sweetVermouth:
            Tags(profiles: [.bittersweet, .botanical]) // change to bitterSweet
        case .blancVermouth:
            Tags()
        case .dryVermouth:
            Tags(profiles: [.dry])
        case .puntEMes:
            Tags(profiles: [.bittersweet, .herbal])
        case .cocchiAmericano:
            Tags(profiles: [.dry, .fruity, .bittersweet])
        case .amontillado:
            Tags(profiles: [.dry, .bright ], textures: [.thin])
        case .sparklingWater:
            Tags(textures: [.effervescent])
        case .orangeBitters:
            Tags(flavors: [.orange])
        case .angosturaBitters:
            Tags(flavors: [.bakingSpices])
        case .ginLondonDry:
            Tags(flavors: [.juniper])
        case .greenChartreuse:
            Tags(flavors: [.anise, .angelica], profiles: [.herbal])
        case .yellowChartreuse:
            Tags(flavors: [.anise, .angelica], profiles: [.herbal])
        case .maraschinoLiqueur:
            Tags(flavors: [.cherry])
        case .straightRyeOrBourbon:
            Tags()
        case .rougeVermouth:
            Tags()
        case .irishWhiskey:
            Tags()
        case .mezcalSmokey:
            Tags(profiles: [.smokey])
        case .mezcalNotSmokey:
            Tags()
        case .amaroMontenegro:
            Tags(flavors: [.rosewater], profiles: [.herbal, .bittersweet, .floral])
        case .giffardPamplemousse:
            Tags(flavors: [.grapefruit])
        case .lilletBlanc:
            Tags()
        case .cremeDeCacao:
            Tags(flavors: [.chocolate])
        case .agaveSyrup:
            Tags(flavors: [.agave])
        case .tequilaAnejo:
            Tags()
        case .tequilaBlanco:
            Tags()
        case .tequilaReposado:
            Tags()
        case .raspberries:
            Tags(flavors: [.raspberry])
        case .armagnac:
            Tags()
        case .suze:
            Tags(profiles: [.herbal, .floral])
        case .salt:
            Tags()
        case .grapefruitSoda:
            Tags(flavors: [.grapefruit], profiles: [.fruity], textures: [.effervescent])
        case .pisco:
            Tags()
        case .raspberrySyrup:
            Tags(flavors: [.raspberry])
        case .demSyrupOneToOne:
            Tags()
        case .bourbon120Proof:
            Tags()
        case .becherovka:
            Tags(flavors: [.cinnamon, .clove], profiles: [.bittersweet])
        case .fernetBranca:
            Tags(flavors: [.anise, .menthol], profiles: [.herbal])
        case .fernetBrancaMenta:
            Tags(flavors: [.mint, .anise, .menthol], profiles: [.herbal])
        case .nutmeg:
            Tags(flavors: [.nutmeg])
        case .egg:
            Tags()
        case .absinthe:
            Tags(flavors: [.anise])
        case .peychauds:
            Tags(flavors: [.tarragon])
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
    case pinch          = "Pinch"
    case whole          = "Whole (except the shell)"
    case sprays         = "Sprays in the glass (glass rinse)"
}
