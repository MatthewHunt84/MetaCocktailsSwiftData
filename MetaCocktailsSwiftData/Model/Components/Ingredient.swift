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
            Tags(flavors: [.lemon], profiles: [.tart, .sour, .citrusy])
        case .lime:
            Tags(flavors: [.lime,], profiles: [.tart, .sour, .citrusy])
        case .cream:
            Tags(flavors: [.lactic], profiles: [.creamy], textures: [.rich])
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
            Tags(flavors: [.juniper, .citrusPeel], profiles: [.floral, .aromatic])
        case .rumWhite:
            Tags()
        case .rumAged:
            Tags(flavors: [.vanilla])
        case .rumBlackStrap:
            Tags(flavors: [.vanilla, .molasses])
        case .rumJamaicanAged:
            Tags(flavors: [.hogo, .vanilla, .funkyRum])
        case .rum:
            Tags()
        case .vodka:
            Tags()
        case .vodkaCitrus:
            Tags(flavors: [.citrusPeel], profiles: [.citrusy])
        case .ryeWhiskey:
            Tags(flavors: [.rye, .vanilla, .bakingSpices, .whiskey])
        case .scotchIsla:
            Tags(flavors: [.peat, .vanilla, .maltedBarley, .whiskey], profiles: [.smokey])
        case .scotchBlended:
            Tags(flavors: [.maltedBarley, .vanilla, .whiskey])
        case .bourbon:
            Tags(flavors: [.vanilla, .bakingSpices, .whiskey])
        case .rumDemerara:
            Tags(flavors: [.vanilla, .bakingSpices])
        case .cachaca:
            Tags(flavors: [.funkyRum, .hogo])
        case .cognacVSOP:
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
        case .ginLondonDry:
            Tags(flavors: [.juniper, .citrusPeel], profiles: [.floral, .aromatic, .dry])
        case .greenChartreuse:
            Tags(flavors: [.anise, .angelica], profiles: [.sweet, .herbal])
        case .yellowChartreuse:
            Tags(flavors: [.anise, .angelica], profiles: [.sweet, .herbal])
        case .maraschinoLiqueur:
            Tags(flavors: [.cherry], profiles: [.sweet])
        case .straightRyeOrBourbon:
            Tags(flavors: [.vanilla, .bakingSpices, .whiskey])
        case .rougeVermouth:
            Tags(profiles: [.sweet, .fruity])
        case .irishWhiskey:
            Tags(flavors: [.vanilla, .bakingSpices, .whiskey])
        case .mezcalSmokey:
            Tags(flavors: [.agave], profiles: [.smokey])
        case .mezcalNotSmokey:
            Tags(flavors: [.agave])
        case .amaroMontenegro:
            Tags(profiles: [.herbal, .bitter, .sweet, .floral])
        case .giffardPamplemousse:
            Tags(flavors: [.grapefruit])
        case .lilletBlanc:
            Tags(profiles: [.fruity, .floral])
        case .cremeDeCacao:
            Tags(flavors: [.chocolate])
        case .agaveSyrup:
            Tags(flavors: [.agave], profiles: [.sweet])
        case .tequilaAnejo:
            Tags(flavors: [.tequila, .vanilla, .bakingSpices])
        case .tequilaBlanco:
            Tags(flavors: [.tequila])
        case .tequilaReposado:
            Tags(flavors: [.tequila, .vanilla])
        case .raspberries:
            Tags(flavors: [.raspberry])
        case .armagnac:
            Tags(flavors: [.vanilla], profiles: [.fruity])
        case .suze:
            Tags(profiles: [.bitter, .herbal, .floral])
        case .salt:
            Tags()
        case .grapefruitSoda:
            Tags(flavors: [.grapefruit], profiles: [.fruity], textures: [.effervescent])
        case .pisco:
            Tags(profiles: [.fruity])
        case .raspberrySyrup:
            Tags(flavors: [.raspberry])
        case .demSyrupOneToOne:
            Tags()
        case .bourbon120Proof:
            Tags(flavors: [.whiskey])
        case .becherovka:
            Tags(flavors: [.cinnamon], profiles: [.herbal, .bitter])
        case .fernetBranca:
            Tags(flavors: [.anise], profiles: [.herbal, .bitter])
        case .fernetBrancaMenta:
            Tags(flavors: [.mint, .anise], profiles: [.herbal, .bitter])
        case .nutmeg:
            Tags(flavors: [.nutmeg])
        case .egg:
            Tags()
        case .absinthe:
            Tags(flavors: [.anise], profiles: [.herbal])
        case .peychauds:
            Tags()
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
