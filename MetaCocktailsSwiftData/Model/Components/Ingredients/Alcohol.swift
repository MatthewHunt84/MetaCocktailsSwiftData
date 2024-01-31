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
    
    case elTesoroRepo              = "El Tesoro Reposado"
    case mezcalAny                 = "Mezcal"
    case mezcalDelMagueyChichicapa = "Mezcal Del Maguey Chichicapa"
    case mezcalDelMagueyVida       = "Mezcal Del Maguey Vida"
    case mezcalDelMagueySanLuis    = "Mezcal Del Maguey San Luis Del Rio"
    case mezcalSmokeyAny           = "Mezcal (Smokey)"
    case mezcalNotSmokeyAny        = "Mezcal (Not Smokey)"
    case tequilaAny                = "Tequila"
    case tequilaAnejo              = "Tequila Anejo"
    case tequilaBlanco             = "Tequila Blanco"
    case tequilaFortalezaRepo      = "Tequila Fortaleza Reposado"
    case tequilaOchoBlanco         = "Tequila Ocho Blanco"
    case tequilaReposado           = "Tequila Reposado"
    case tequilaSieteLeguasRepo    = "Tequila Siete Leguas Reposado"
    
    
    var tags: Tags {
        switch self {
        case .mezcalSmokeyAny:
            Tags(profiles: [.smokey], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny))])
        case .mezcalNotSmokeyAny:
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
        case .tequilaOchoBlanco:
            Tags(booze: [Booze(.agaves(self)),Booze(.agaves(.tequilaAny))])
        case .mezcalDelMagueyChichicapa:
            Tags(profiles: [.smokey], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny)), Booze(.agaves(.mezcalSmokeyAny))])
        case .mezcalDelMagueyVida:
            Tags(profiles: [.smokey], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny)), Booze(.agaves(.mezcalSmokeyAny))])
        case .tequilaSieteLeguasRepo:
            Tags(booze: [Booze(.agaves(self)), Booze(.agaves(.tequilaAny))])
        case .tequilaFortalezaRepo:
            Tags(booze: [Booze(.agaves(self)), Booze(.agaves(.tequilaAny))])
        case .elTesoroRepo:
            Tags(booze: [Booze(.agaves(self)), Booze(.agaves(.tequilaAny))])
        case .mezcalDelMagueySanLuis:
            Tags(profiles: [.smokey, .funky], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny)), Booze(.agaves(.mezcalSmokeyAny))])
        }
      
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.agaves(self)))
    }
    
}


enum Brandy: String, Codable, CaseIterable {
    case appleBrandy          = "Apple Brandy"
    case armagnac             = "Armagnac"
    case cognacVSOP           = "Cognac (VSOP)"
    case bondedApple          = "Bonded Apple Brandy"
    case boulardCalvados      = "Boulard Calvados V.S.O.P"
    case brandyAny            = "Brandy"
    case lairdsApplejack      = "Laird's Applejack"
    case lairdsBonded         = "Laird's Bonded Apple"
    case pFAmber              = "Pierre Ferrand Amber Cognac"
    case pF1840               = "Pierre Ferrand 1840 Cognac"
    case pisco                = "Pisco"
    
    var tags: Tags {
//        return Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        switch self {
        case .bondedApple:
            Tags(flavors: [.apple], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.appleBrandy))])
        case .brandyAny:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .armagnac:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .cognacVSOP:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .pisco:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .pFAmber:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .boulardCalvados:
            Tags(flavors: [.apple, .pear], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.appleBrandy))])
        case .lairdsApplejack:
            Tags(flavors: [.apple], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.appleBrandy))])
        case .pF1840:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .appleBrandy:
            Tags(flavors: [.apple], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .lairdsBonded:
            Tags(flavors: [.apple], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.brandies(self)))
    }
}

enum Gin: String, Codable, CaseIterable {
    
    case fordsGin             = "Fords Gin"
    case ginAny               = "Gin"
    case ginLondonDry         = "Gin (London Dry)"
    case geneverBols          = "Bols Genever"
    case haymansLondonDry     = "Hayman's London Dry Gin"
    case hendricks            = "Hendrick's Gin"
    case juinipero            = "Juinipero Gin"
    case monkey47             = "Monkey 47"
    case plymouth             = "Plymouth Gin"
    case ransomOldTom         = "Ransom Old Tom"
    case stGeorgeTerroir      = "St. George Terroir Gin"
    case tanqueray            = "Tanqueray"
    
    
    
    var tags: Tags {
        switch self {
        case .ginAny:
            Tags(flavors: [.juniper], booze: [Booze(.gins(self))])
        case .ginLondonDry:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .stGeorgeTerroir:
            Tags(flavors: [.juniper, .pine],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .juinipero:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .monkey47:
            Tags(flavors: [.juniper, .kaffirLimeLeaf],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .hendricks:
            Tags(flavors: [.juniper, .cucumber, .rose] ,booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .fordsGin:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny)), Booze(.gins(.ginLondonDry))])
        case .plymouth:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .ransomOldTom:
            Tags(booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .tanqueray:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny)), Booze(.gins(.ginLondonDry))])
        case .geneverBols:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .haymansLondonDry:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny)), Booze(.gins(.ginLondonDry))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.gins(self)))
    }
}

// Other can be Aquavit, Malort, Absinthe etc.
enum OtherAlcohol: String, Codable, CaseIterable {
    case absinthe             = "Absinthe"
    case jalapeñoTincture     = "Jalapeño Tincture"
    case lavenderTincture     = "Lavender Tincture"
   
    
    
    var tags: Tags {
        switch self {
        case .absinthe:
            Tags(flavors: [.anise], booze: [Booze(.otherAlcohol(self))])
        case .lavenderTincture:
            Tags(flavors: [.lavender], booze: [Booze(.otherAlcohol(self))])
        case .jalapeñoTincture:
            Tags(flavors: [.jalapeño], booze: [Booze(.otherAlcohol(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.otherAlcohol(self)))
    }
}

enum Rum: String, Codable, CaseIterable {
    case appletonEstateSignatureBlend = "Appleton Estate Signature Blend"
    case cachaca                      = "Cachaca"
    case captainMorgan                = "Captain Morgan"
    case cruzanBlackstrap             = "Cruzan Blackstrap Rum"
    case goslingsBlackSeal            = "Goslings Black Seal"
    case plantation3Star              = "Plantation 3 Star Rum"
    case plantationBarbados           = "Plantation Barbados 5 Year Rum"
    case pussersRum                   = "Pusser's Rum"
    case rumWhiteAgricole             = "Rum (White Agricole)"
    case rumAny                       = "Rum"
    case rumAged                      = "Rum (Aged)"
    case rumAgedCuban                 = "Rum (Aged Cuban Style)"
    case rumBlackStrap                = "Rum (Black Strap)"
    case rumDark                      = "Rum (Dark)"
    case rumDemerara                  = "Rum (Demerara)"
    case rumJamaicanAged              = "Rum (Jamaican, Aged)"
    case rumPuertoRican               = "Rum (Puerto Rican)"
    case rumWhite                     = "Rum (White)"
    case sailorJerry                  = "Sailor Jerry's Rum"
    case smithAndCross                = "Smith & Cross"
    case wrayAndNephew17              = "Wray & Nephew 17 year"
    
    var tags: Tags {
        
        switch self {
        case .cachaca:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumAged:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumBlackStrap:
            Tags(flavors: [.molasses], booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumDemerara:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumJamaicanAged:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumWhite:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumAny:
            Tags(booze: [Booze(.rums(self))])
        case .rumWhiteAgricole:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumAgedCuban:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .plantationBarbados:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumDark:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .sailorJerry:
            Tags(flavors: [.bakingSpices], booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .captainMorgan:
            Tags(flavors: [.bakingSpices], booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .goslingsBlackSeal:
            Tags(flavors: [.molasses], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumBlackStrap))])
        case .plantation3Star:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumPuertoRican:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .appletonEstateSignatureBlend:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumJamaicanAged))])
        case .cruzanBlackstrap:
            Tags(flavors: [.molasses], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumBlackStrap))])
        case .wrayAndNephew17:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumJamaicanAged)),])
        case .smithAndCross:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumJamaicanAged)),])
        case .pussersRum:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.rums(self)))
    }
}

enum Vodka: String, Codable, CaseIterable {
    case peanutButterVodka       = "Vodka (Peanut Butter Infused)"
    case roaringForkVodka        = "Roaring Fork Vodka"
    case stGeorgeGreenChileVodka = "St. George Green Chile Vodka"
    case vodkaAny                = "Vodka"
    case vodkaCitrus             = "Vodka(Citrus Infused)"
    case zubrowka                = "Zubrowka Bison Grass Vodka"
    
    
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
        case .stGeorgeGreenChileVodka:
            Tags(flavors: [.greenChile], booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        case .roaringForkVodka:
            Tags(booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.vodkas(self)))
    }
}

enum Whiskey: String, Codable, CaseIterable {
    case aberlourAbundah       = "Aberlour Abundah (High Proof Single Malt)"
    case Ardbeg                = "Ardbeg 10 year (Peated Scotch)"
    case americanWhiskeyAny    = "American Whiskey"
    case balvinieDW            = "Balvenie DoubleWood 12-year"
    case bourbon120            = "Bourbon (120 proof)"
    case bourbonAny            = "Bourbon"
    case bushmills12           = "Bushmills 12 year Single Malt"
    case compassBoxOrchard      = "Compass Box Orchard House"
    case elijahCraigSmallBatch = "Elijah Craig Small Batch Bourbon"
    case fourRosesYellowLabel  = "Four Roses Yellow Label"
    case glenfiddich12         = "Glanfiddich 12 year"
    case irishWhiskeyAny       = "Irish Whiskey"
    case jimBeamRye            = "Jim Beam Rye"
    case larcenyBourbon        = "Larceny Bourbon"
    case laphroaig10           = "Laphroaig 10 year"
    case monkeyShoulder        = "Monkey Shoulder Blended Scotch"
    case pendletonRye          = "Pendleton Rye"
    case rittenhouseRye        = "Rittenhouse Rye"
    case ryeWhiskeyAny         = "Rye Whiskey"
    case straightRye           = "Straight Rye"
    case straightRyeOrBourbon  = "Straight Rye or Bourbon (100 proof)"
    case scotchAny             = "Scotch"
    case scotchBlended         = "Scotch (Blended)"
    case scotchIsla            = "Scotch (Peated, From Isla)"
    case whiskeyAny            = "Whisk(e)y"
    
    var tags: Tags {
        switch self {
        case .bourbonAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny))])
        case .irishWhiskeyAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .ryeWhiskeyAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny))])
        case .straightRyeOrBourbon:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.bourbonAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .scotchBlended:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .scotchIsla:
            Tags(flavors: [.peat], profiles: [.smokey], booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .bourbon120:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.bourbonAny))])
        case .whiskeyAny:
            Tags(booze: [Booze(.whiskies(self))])
        case .Ardbeg:
            Tags(flavors: [.peat], profiles: [.smokey], booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .rittenhouseRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .scotchAny:
            Tags(booze: [Booze(.whiskies(self))])
        case .americanWhiskeyAny:
            Tags(booze: [Booze(.whiskies(self))])
        case .glenfiddich12:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .aberlourAbundah:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .straightRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .jimBeamRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .fourRosesYellowLabel:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny))])
        case .larcenyBourbon:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny))])
        case .bushmills12:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.irishWhiskeyAny))])
        case .elijahCraigSmallBatch:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny))])
        case .pendletonRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .laphroaig10:
            Tags(flavors: [.peat], profiles: [.smokey], booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .monkeyShoulder:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .compassBoxOrchard:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .balvinieDW:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.whiskies(self)))
    }
}
enum Liqueur: String, Codable, CaseIterable {
    case allspiceDram         = "Allspice Dram"
    case amaretto             = "Amaretto"
    case anchoVerde           = "Ancho Reyes Verde Poblano Chile Liquor"
    case apricotLiqueur       = "Apricot Liqeur"
    case benedictine          = "Benedictine"
    case borghetti            = "Borghetti Espresso Liqueur"
    case cointreau            = "Cointreau"
    case charaeu              = "Charaeu Aloe Liqueur"
    case cherryHeering        = "Cherry Heering"
    case clementCreole        = "Clement Creole Shrub"
    case cremeDeCacao         = "Creme De Cacao"
    case cremeDeCassis        = "Creme De Cassis"
    case cremeDeMenthe        = "Creme de Menthe"
    case cremeDeMure          = "Creme De Mure"
    case cremeDeViolette      = "Creme De Violette"
    case drambuie             = "Drambuie"
    case falernum             = "Falernum"
    case galliano             = "Galliano"
    case dryCuracao           = "Pierre Ferrand Dry Curacao"
    case giffardAbricot       = "Giffard Abricot"
    case giffardPamplemousse  = "Giffard Creme de Pamplemousse"
    case giffardBanane        = "Giffard Banane Du Bresil"
    case greenChartreuse      = "Green Chartreuse"
    case licor43              = "Licor 43"
    case luxardoCherry        = "Luxardo Sangue Morlacco Cherry"
    case maraschinoLiqueur    = "Maraschino Liqueur"
    case orangeCuracao        = "Orange Curacao"
    case pimms                = "Pimms No. 1"
    case plymouthSloeGin      = "Plymouth Sloe Gin"
    case salersAperitif       = "Salers Gentian Apéritif"
    case strega               = "Strega"
    case velvetFalernum       = "Velvet Falernum"
    case yellowChartreuse     = "Yellow Chartreuse"

    
    var tags: Tags {
        switch self {
        case .cointreau:
            Tags(flavors: [.orange, .whiteFlower], profiles: [.fruity], booze: [Booze(.liqueurs(self))])
        case .cremeDeCacao:
            Tags(flavors: [.chocolate], booze: [Booze(.liqueurs(self))])
        case .giffardPamplemousse:
            Tags(flavors: [.grapefruit], profiles: [.fruity], booze: [Booze(.liqueurs(self))])
        case .greenChartreuse:
            Tags(flavors: [.angelica], profiles: [.herbal, .botanical], booze: [Booze(.liqueurs(self))])
        case .maraschinoLiqueur:
            Tags(flavors: [.cherry], profiles: [.fruity], booze: [Booze(.liqueurs(self))])
        case .orangeCuracao:
            Tags(flavors: [.orange], profiles: [.fruity], booze: [Booze(.liqueurs(self))])
        case .velvetFalernum:
            Tags(flavors: [.clove, .almond], booze: [Booze(.liqueurs(self))])
        case .yellowChartreuse:
            Tags(flavors: [.angelica], profiles: [.herbal, .botanical], booze: [Booze(.liqueurs(self))])
        case .licor43:
            Tags(flavors: [.bakingSpices, .vanilla, .cinnamon, .clove], booze: [Booze(.liqueurs(self))])
        case .giffardBanane:
            Tags(flavors: [.banana], profiles: [.fruity], booze: [Booze(.liqueurs(self))])
        case .strega:
            Tags(flavors: [.anise], booze: [Booze(.liqueurs(self))])
        case .charaeu:
            Tags(flavors: [.aloe], booze: [Booze(.liqueurs(self))])
        case .anchoVerde:
            Tags(flavors: [.poblanoChile], profiles: [.spicy], booze: [Booze(.liqueurs(self))])
        case .dryCuracao:
            Tags(flavors: [.orange], booze: [Booze(.liqueurs(self))])
        case .drambuie:
            Tags(flavors: [.honey, .bakingSpices], booze: [Booze(.liqueurs(self))])
        case .clementCreole:
            Tags(flavors: [.orange], booze: [Booze(.liqueurs(self))])
        case .salersAperitif:
            Tags(flavors: [.gentian], booze: [Booze(.liqueurs(self))])
        case .benedictine:
            Tags(profiles: [.herbal], booze: [Booze(.liqueurs(self))])
        case .cherryHeering:
            Tags(flavors: [.cherry], profiles: [.fruity], booze: [Booze(.liqueurs(self))])
        case .amaretto:
            Tags(flavors: [.cherry, .almond], profiles: [.fruity, .nutty], booze: [Booze(.liqueurs(self))])
        case .cremeDeViolette:
            Tags(profiles: [.floral], booze: [Booze(.liqueurs(self))])
        case .luxardoCherry:
            Tags(flavors: [.cherry], booze: [Booze(.liqueurs(self))])
        case .cremeDeMure:
            Tags(flavors: [.blackberry], profiles: [.fruity], booze: [Booze(.liqueurs(self))])
        case .cremeDeCassis:
            Tags(flavors: [.currants], profiles: [.fruity], booze: [Booze(.liqueurs(self))])
        case .borghetti:
            Tags(flavors: [.coffee, .espresso], booze: [Booze(.liqueurs(self))])
        case .falernum:
            Tags(flavors: [.clove, .almond], booze: [Booze(.liqueurs(self))])
        case .cremeDeMenthe:
            Tags(flavors: [.menthol, .mint], booze: [Booze(.liqueurs(self))])
        case .galliano:
            Tags(flavors: [.anise], booze: [Booze(.liqueurs(self))])
        case .allspiceDram:
            Tags(flavors: [.bakingSpices], booze: [Booze(.liqueurs(self))])
        case .apricotLiqueur:
            Tags(flavors: [.apricot], booze: [Booze(.liqueurs(self))])
        case .giffardAbricot:
            Tags(flavors: [.apricot], booze: [Booze(.liqueurs(self))])
        case .plymouthSloeGin:
            Tags(flavors: [.sloeBerries], booze: [Booze(.liqueurs(self))])
        case .pimms:
            Tags(profiles: [.herbal, .botanical, .bittersweet], booze: [Booze(.liqueurs(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.liqueurs(self)))
    }

}
enum FortifiedWine: String, Codable, CaseIterable {
    case amontillado          = "Amontillado Sherry"
    case blancVermouth        = "Blanc Vermouth"
    case Byrrh                = "Byrrh Grand Quinquina Aperitif"
    case carpanoAntica        = "Carpano Antica"
    case cocchiAmericano      = "Cocchi Americano"
    case cocchiDeTorino       = "Cocchi Di Torino Sweet Vermouth"
    case dryVermouthAny       = "Dry Vermouth (French)"
    case dolinDry             = "Dolin Dry Vermouth"
    case dolinBlanc           = "Dolin Blanc Vermouth"
    case dolinRouge           = "Dolin Rouge Vermouth"
    case fino                 = "Fino Sherry"
    case lilletBlanc          = "Lillet Blanc Vermouth"
    case lustauAmontillado    = "Lustau Amontillado Sherry"
    case lustauPX             = "Lustau Pedro Ximénez Sherry"
    case puntEMes             = "Punt E Mes"
    case sandemanPort         = "Sandeman Port"
    case sweetVermouthAny     = "Sweet Vermouth"
    case vermouthAny          = "Vermouth"
    case sherryAny            = "Sherry"
    case sherryEastIndia      = "Sherry (East India Lustau)"
    case fortifiedWineAny     = "Fortified Wine"
    
    var tags: Tags {
        switch self {
        case .amontillado:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .blancVermouth:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .Byrrh:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .cocchiAmericano:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .cocchiDeTorino:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.sweetVermouthAny))])
        case .dryVermouthAny:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .dolinBlanc:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .dolinRouge:
            Tags(profiles: [.fruity], booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.sweetVermouthAny))])
        case .fino:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .lilletBlanc:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .puntEMes:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.sweetVermouthAny))])
        case .sweetVermouthAny:
            Tags(booze: [Booze(.fortifiedWines(self))])
        case .vermouthAny:
            Tags(booze: [Booze(.fortifiedWines(self))])
        case .sherryAny:
            Tags(booze: [Booze(.fortifiedWines(self))])
        case .fortifiedWineAny:
            Tags(booze: [Booze(.fortifiedWines(self))])
        case .dolinDry:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.dryVermouthAny)) ])
        case .carpanoAntica:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.sweetVermouthAny))])
        case .sandemanPort:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .sherryEastIndia:
            Tags(profiles: [.fruity], booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .lustauAmontillado:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .lustauPX:
            Tags(profiles: [.fruity], booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.fortifiedWines(self)))
    }
}

enum Wine: String, Codable, CaseIterable {
    case bourgogneAligote     = "Bourgogne Aligote (Chilled)"
    case champagne            = "Champagne (with a high Dosage) (Chilled)"
    case dryRedWine           = "Dry Red Wine"
    case prosecco             = "Prosecco (Chilled)"
    
    var tags: Tags {
        return Tags(booze: [Booze(.wines(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.wines(self)))
    }

}
enum Bitters: String, Codable, CaseIterable {
    case aromaticBitters      = "Aromatic Bitters"
    case angosturaBitters     = "Angostura Bitters"
    case blackWalnut          = "Black Walnut Bitters (Fee Brothers)"
    case hellfireBitters      = "Bittermans Hellfire Bitters"
    case celeryBitters        = "Celery Bitters"
    case chocolateMole        = "Chocolate Molé Bitters"
    case orangeBitters        = "Orange Bitters"
    case peychauds            = "Peychaud's Bitters"
    case pimentoBitters       = "Pimento Bitters (Dale Degroff's)"
    
    var tags: Tags {
        switch self {
        case .blackWalnut:
            Tags(flavors: [.walnut], booze: [Booze(.bitters(self))])
        case .orangeBitters:
            Tags(flavors: [.orange], booze: [Booze(.bitters(self))])
        case .angosturaBitters:
            Tags(flavors: [.bakingSpices], booze: [Booze(.bitters(self)), Booze(.bitters(.aromaticBitters))])
        case .peychauds:
            Tags(flavors: [.tarragon, .cherry], booze: [Booze(.bitters(self)), Booze(.bitters(.aromaticBitters))])
        case .pimentoBitters:
            Tags(flavors: [.pimento], booze: [Booze(.bitters(self)), Booze(.bitters(.aromaticBitters))])
        case .hellfireBitters:
            Tags(profiles: [.spicy], booze: [Booze(.bitters(self))])
        case .celeryBitters:
            Tags(flavors: [.celery], booze: [Booze(.bitters(self))])
        case .chocolateMole:
            Tags(flavors: [.chocolate, .molé], booze: [Booze(.bitters(self))])
        case .aromaticBitters:
            Tags(booze: [Booze(.bitters(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.bitters(self)))
    }
}

enum Amaro: String, Codable, CaseIterable {
    case amaroAny             = "Amaro"
    case amerPicon            = "Amer Picon"
    case angosturaAmaro       = "Angostura (Amaro)"
    case aperol               = "Aperol"
    case averna               = "Averna Amaroo"
    case amaroMontenegro      = "Montenegro (Amaro)"
    case amaroNonino          = "Nonino (Amaro)"
    case braulio              = "Braulio"
    case becherovka           = "Becherovka"
    case campari              = "Campari"
    case chinaChina           = "Bigallet China China Amer "
    case cynar                = "Cynar"
    case DellErborista        = "Varnelli Amaro Dell'Erborista"
    case fernetBranca         = "Fernet Branca"
    case fernetBrancaMenta    = "Fernet Branca Menta"
    case sfumato              = "Sfumato Rabarbaro"
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
            Tags(profiles: [.bittersweet], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .fernetBranca:
            Tags(flavors: [.anise], profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .fernetBrancaMenta:
            Tags(flavors: [.anise, .menthol, .mint], profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .suze:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .amaroAny:
            Tags(booze: [Booze(.amari(.amaroAny))])
        case .braulio:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .DellErborista:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .angosturaAmaro:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .sfumato:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .cynar:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .averna:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .amerPicon:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .chinaChina:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.amari(self)))
    }
}
