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


enum Agave: String, IngredientTagsProtocol {
    
    case elTesoroRepo              = "El Tesoro Reposado"
    case mezcalAny                 = "Mezcal"
    case mezcalDelMagueyChichicapa = "Chichicapa"
    case mezcalDelMagueyJabali     = "Wild Jabali"
    case mezcalDelMagueyVida       = "Vida"
    case mezcalDelMagueySanLuis    = "San Luis Del Rio"
    case mezcalEspadin             = "Mezcal Espadine"
    case mezcalSmokeyAny           = "Smokey Mezcal"
    case mezcalNotSmokeyAny        = "Not Smokey Mezcal"
    case puebloViejoBlanco104      = "Blanco 104"
    case tanteoJalepeno            = "Tanteo Jalapenno Tequila"
    case tapatioTequilaBlanco      = "Tapatio Tequila Blanco"
    case tequilaAny                = "Tequila"
    case tequilaAnejo              = "Tequila Anejo"
    case tequilaBlanco             = "Tequila Blanco"
    case tequilaFortalezaRepo      = "Tequila Fortaleza Reposado"
    case tequilaOchoBlanco         = "Tequila Ocho Blanco"
    case tequilaReposado           = "Tequila Reposado"
    case tequilaSieteLeguasBlanco  = "Tequila Siete Leguas Blanco"
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
            Tags(booze: [Booze(.agaves(self)),Booze(.agaves(.tequilaAny)), Booze(.agaves(.tequilaBlanco))])
        case .mezcalDelMagueyChichicapa:
            Tags(profiles: [.smokey], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny)), Booze(.agaves(.mezcalSmokeyAny))])
        case .mezcalDelMagueyVida:
            Tags(profiles: [.smokey], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny)), Booze(.agaves(.mezcalSmokeyAny))])
        case .tequilaSieteLeguasRepo:
            Tags(booze: [Booze(.agaves(self)), Booze(.agaves(.tequilaAny)), Booze(.agaves(.tequilaReposado))])
        case .tequilaFortalezaRepo:
            Tags(booze: [Booze(.agaves(self)), Booze(.agaves(.tequilaAny)), Booze(.agaves(.tequilaReposado))])
        case .elTesoroRepo:
            Tags(booze: [Booze(.agaves(self)), Booze(.agaves(.tequilaAny)), Booze(.agaves(.tequilaReposado))])
        case .mezcalDelMagueySanLuis:
            Tags(profiles: [.smokey, .funky], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny)), Booze(.agaves(.mezcalSmokeyAny))])
        case .puebloViejoBlanco104:
            Tags(booze: [Booze(.agaves(self)),Booze(.agaves(.tequilaAny)), Booze(.agaves(.tequilaBlanco))])
        case .tequilaSieteLeguasBlanco:
            Tags(booze: [Booze(.agaves(self)), Booze(.agaves(.tequilaAny)), Booze(.agaves(.tequilaBlanco))])
        case .tanteoJalepeno:
            Tags(flavors: [.jalapeño], booze: [Booze(.agaves(self)), Booze(.agaves(.tequilaAny))])
        case .mezcalDelMagueyJabali:
            Tags(profiles: [.smokey, .funky], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny)), Booze(.agaves(.mezcalSmokeyAny))])
        case .tapatioTequilaBlanco:
            Tags(booze: [Booze(.agaves(self)),Booze(.agaves(.tequilaAny)), Booze(.agaves(.tequilaBlanco))])
        case .mezcalEspadin:
            Tags(profiles: [.smokey], booze: [Booze(.agaves(self)),Booze(.agaves(.mezcalAny)), Booze(.agaves(.mezcalSmokeyAny))])
        }
      
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.agaves(self)))
    }
    
}


enum Brandy: String, IngredientTagsProtocol {
    case appleBrandy          = "Apple brandy"
    case armagnac             = "Armagnac"
    case cognac               = "Cognac"
    case cognacVSOP           = "V.S.O.P. Cognac"
    case bondedApple          = "Bonded apple brandy"
    case boulardCalvados      = "Boulard Calvados V.S.O.P"
    case brandyAny            = "Brandy"
    case clearCreekPearBrandy = "Clear Creek Pear Brandy"
    case domCafoBrandy        = "Caffo Brandy Domenique"
    case hineCognac           = "Hine V.S.O.P"
    case lairdsApplejack      = "Laird's Applejack"
    case lairdsBonded         = "Laird's Bonded Apple"
    case lairdsJersey         = "Laird's Jersey Lightning"
    case pFAmber              = "Pierre Ferrand Amber Cognac"
    case pF1840               = "Pierre Ferrand 1840 Cognac"
    case pisco                = "Pisco"
    case peruvianMustoVerde   = "Peruvian Musto Verde Pisco"
    
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
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.cognac))])
        case .pisco:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .pFAmber:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.cognac))])
        case .boulardCalvados:
            Tags(flavors: [.apple, .pear], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.appleBrandy))])
        case .lairdsApplejack:
            Tags(flavors: [.apple], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.appleBrandy))])
        case .pF1840:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.cognac))])
        case .appleBrandy:
            Tags(flavors: [.apple], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .lairdsBonded:
            Tags(flavors: [.apple], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .domCafoBrandy:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .clearCreekPearBrandy:
            Tags(flavors: [.pear], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .peruvianMustoVerde:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.pisco))])
        case .lairdsJersey:
            Tags(flavors: [.apple], booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.brandyAny))])
        case .cognac:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny))])
        case .hineCognac:
            Tags(booze: [Booze(.brandies(self)), Booze(.brandies(.brandyAny)), Booze(.brandies(.cognac))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.brandies(self)))
    }
}

enum Gin: String, IngredientTagsProtocol {
    
    case agedBolsGenever      = "Bols Genever Barrel Aged"
    case aviation             = "Aviation Gin"
    case fordsGin             = "Fords Gin"
    case ginAny               = "Gin"
    case ginLondonDry         = "London Dry Gin"
    case geneverBols          = "Bols Genever"
    case haymansLondonDry     = "Hayman's London Dry Gin"
    case hendricks            = "Hendrick's Gin"
    case hendricksOrbium      = "Hendrick's Orbium Gin"
    case juinipero            = "Juinipero Gin"
    case juniperJones         = "Juniper Jones"
    case leopoldNavy          = "Leopold's Navy Strength"
    case leopoldAmericanSBGin = "American Small Batch Gin"
    case monkey47             = "Monkey 47"
    case plymouth             = "Plymouth Gin"
    case ransomOldTom         = "Ransom Old Tom"
    case stGeorgeBotanivore   = "St. George Botnivore Gin"
    case stGeorgeTerroir      = "St. George Terroir Gin"
    case tanqueray            = "Tanqueray"
    case woodyCreekGin        = "Woody Creek Gin"
    case woodyCreekGinJasmine = "Jasmine tea gin"
    case navyStrengthGin      = "Navy Strength Gin"
    
    
    
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
        case .hendricksOrbium:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .woodyCreekGin:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .agedBolsGenever:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .stGeorgeBotanivore:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .leopoldNavy:
            Tags(flavors: [.juniper, .kaffirLimeLeaf],booze: [Booze(.gins(self)), Booze(.gins(.ginAny)), Booze(.gins(.navyStrengthGin))])
        case .juniperJones:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .leopoldAmericanSBGin:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .navyStrengthGin:
            Tags(flavors: [.juniper],booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .woodyCreekGinJasmine:
            Tags(flavors: [.juniper, .tea, .citrusPeel] ,booze: [Booze(.gins(self)), Booze(.gins(.ginAny))])
        case .aviation:
            Tags(flavors: [.juniper] ,booze: [Booze(.gins(self)), Booze(.gins(.ginLondonDry))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.gins(self)))
    }
}

// Other can be Aquavit, Malort, Absinthe etc.
enum OtherAlcohol: String, IngredientTagsProtocol {
    case absinthe                 = "Absinthe"
    case bataviaArrack            = "Batavia Arrack"
    case burdockRootTincture      = "Burdock root tincture"
    case jalapeñoTincture         = "Jalapeño tincture"
    case lavenderTincture         = "Lavender tincture"
    case leftHandMilkStout        = "Left Hand Nitro Milk Stout"
    case linieAquavit             = "Linie Aquavit"
    case notSpicyJalapeñoTincture = "Not spicy jalapeño tincture"
    case pernod                   = "Pernod anise liquor"
    case serranoTincture          = "Serrano tincture"
    case stGeorgeAbsinthe         = "St. George Absinthe"
    case trakal                   = "Trakal"
   
    
    
    var tags: Tags {
        switch self {
        case .absinthe:
            Tags(flavors: [.anise], booze: [Booze(.otherAlcohol(self))])
        case .lavenderTincture:
            Tags(flavors: [.lavender], booze: [Booze(.otherAlcohol(self))])
        case .jalapeñoTincture:
            Tags(flavors: [.jalapeño], profiles: [.spicy], booze: [Booze(.otherAlcohol(self))])
        case .pernod:
            Tags(flavors: [.anise], booze: [Booze(.otherAlcohol(self))])
        case .linieAquavit:
            Tags(flavors: [.caraway], booze: [Booze(.otherAlcohol(self))])
        case .trakal:
            Tags(profiles: [ .herbal], booze: [Booze(.otherAlcohol(self))])
        case .bataviaArrack:
            Tags(profiles: [ .funky], booze: [Booze(.otherAlcohol(self))])
        case .leftHandMilkStout:
            Tags(flavors: [.chocolate, .malt], booze: [Booze(.otherAlcohol(self))])
        case .burdockRootTincture:
            Tags(flavors: [.burdockRoot], booze: [Booze(.otherAlcohol(self))])
        case .stGeorgeAbsinthe:
            Tags(flavors: [.anise], booze: [Booze(.otherAlcohol(self))])
        case .serranoTincture:
            Tags(flavors: [.serrano], booze: [Booze(.otherAlcohol(self))])
        case .notSpicyJalapeñoTincture:
            Tags(flavors: [.jalapeño], booze: [Booze(.otherAlcohol(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.otherAlcohol(self)))
    }
}

enum Rum: String, IngredientTagsProtocol {
    case appletonEstateSignatureBlend = "Appleton Estate Signature Blend"
    case appleton12                   = "Appleton 12 year"
    case avuaPrata                    = "Avua Prata Cachaca"
    case avuaAmburana                 = "Avua Amburana Cachaca"
    case banks5                       = "Banks 5 Island Rum"
    case bacardi                      = "Bacardi Rum"
    case cachaca                      = "Cachaca"
    case captainMorgan                = "Captain Morgan"
    case corubaDark                   = "Coruba Dark Jamaican Rum"
    case cruzanBlackstrap             = "Cruzan Blackstrap Rum"
    case clementBleue                 = "Clement Rhum Blanc Agricole"
    case diplomaticoExclusivaRum      = "Diplomatico Reserva Exclusiva"
    case goldJamaicanRum              = "Gold Jamaican Rum"
    case goldPuertoRicanRum           = "Gold Puerto Rican Rum"
    case goslingsBlackSeal            = "Goslings Black Seal"
    case havanaClubAnjeo              = "Havana Club Anejo"
    case lemonHeart151                = "Lemon Heart 151 Demerara Rum"
    case plantation3Star              = "Planteray 3 Star Rum"
    case plantationBarbados           = "Planteray Barbados 5 Year Rum"
    case plantationBarbadosXO         = "Planteray Barbados XO"
    case plantationJamaicaRum         = "Planteray Jamaica Rum"
    case plantationOFTD               = "Planteray OFTD Rum"
    case plantationPineapple          = "Planteray Pineapple Rum"
    case probitasRum                  = "Probitas Rum"
    case pussersRum                   = "Pusser's Rum"
    case ronMutusalemRumClassico      = "Ron Matusalem Rum Classico"
    case rumWhiteAgricole             = "White Agricole Rum"
    case rumAny                       = "Rum"
    case rumAged                      = "Aged Rum"
    case rumAgedCuban                 = "Aged Cuban Rum"
    case rumBlackStrap                = "Black Strap Rum"
    case rumDark                      = "Dark Rum"
    case rumDemerara                  = "Demerara Rum"
    case rumDominican                 = "Dominican Rum"
    case rumFire                      = "Rum Fire"
    case rumJamaicanAged              = "Aged Jamaican Rum"
    case rumPuertoRican               = "Puerto Rican Rum"
    case rumWhite                     = "White Rum"
    case sailorJerry                  = "Sailor Jerry's Rum"
    case smithAndCross                = "Smith & Cross"
    case uruapanAnejo                 = "Charanda Uruapan Anejo"
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
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .rumWhite:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .rumAny:
            Tags(booze: [Booze(.rums(self))])
        case .rumWhiteAgricole:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumWhite))])
        case .rumAgedCuban:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .plantationBarbados:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .rumDark:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .sailorJerry:
            Tags(flavors: [.bakingSpices], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .captainMorgan:
            Tags(flavors: [.bakingSpices], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .goslingsBlackSeal:
            Tags(flavors: [.molasses, .malt], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumBlackStrap)), Booze(.rums(.rumAged))])
        case .plantation3Star:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumWhite))])
        case .rumPuertoRican:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .appletonEstateSignatureBlend:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumJamaicanAged)), Booze(.rums(.rumAged))])
        case .cruzanBlackstrap:
            Tags(flavors: [.molasses, .malt], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumBlackStrap)), Booze(.rums(.rumAged))])
        case .wrayAndNephew17:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumJamaicanAged)), Booze(.rums(.rumAged))])
        case .smithAndCross:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumJamaicanAged)), Booze(.rums(.rumAged))])
        case .pussersRum:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .clementBleue:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumWhite))])
        case .lemonHeart151:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .goldPuertoRicanRum:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .goldJamaicanRum:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .havanaClubAnjeo:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .plantationJamaicaRum:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .appleton12:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumJamaicanAged)), Booze(.rums(.rumAged))])
        case .avuaPrata:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.cachaca))])
        case .plantationBarbadosXO:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .banks5:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .plantationPineapple:
            Tags(flavors: [.pineapple], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .diplomaticoExclusivaRum:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .avuaAmburana:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.cachaca))])
        case .plantationOFTD:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .rumFire:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumWhite))])
        case .uruapanAnejo:
            Tags(profiles: [.funky], booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .corubaDark:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumJamaicanAged)), Booze(.rums(.rumAged))])
        case .ronMutusalemRumClassico:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumAged))])
        case .rumDominican:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny))])
        case .probitasRum:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumWhite))])
        case .bacardi:
            Tags(booze: [Booze(.rums(self)), Booze(.rums(.rumAny)), Booze(.rums(.rumWhite)), Booze(.rums(.rumAgedCuban))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.rums(self)))
    }
}

enum Vodka: String, IngredientTagsProtocol {
    case peanutButterVodka       = "Peanut Butter Infused Vodka"
    case roaringForkVodka        = "Roaring Fork Vodka"
    case stGeorgeGreenChileVodka = "St. George Green Chile Vodka"
    case stoli100                = "Stoli 100 Vodka"
    case vodkaAny                = "Vodka"
    case vodkaCitrus             = "Citrus infused vodka"
    case woodyCreekVodka         = "Woody Creek Vodka"
    case reyka                   = "Reyka Vodka"
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
            Tags(flavors: [.peanut],profiles: [.nutty], booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        case .stGeorgeGreenChileVodka:
            Tags(flavors: [.greenChile], booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        case .roaringForkVodka:
            Tags(booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        case .stoli100:
            Tags(booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        case .woodyCreekVodka:
            Tags(booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        case .reyka:
            Tags(booze: [Booze(.vodkas(self)), Booze(.vodkas(.vodkaAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.vodkas(self)))
    }
}

enum Whiskey: String, IngredientTagsProtocol {
    case aberlourAbundah       = "Aberlour Abundah"
    case Ardbeg                = "Ardbeg 10"
    case americanWhiskeyAny    = "American Whiskey"
    case balconesRye           = "Balcones 100 Proof Rye Whisky"
    case balvinieDW            = "Balvenie DoubleWood 12-year"
    case bourbon120            = "120 proof Bourbon"
    case bourbonAny            = "Bourbon"
    case bourbonOverproof      = "Overproof Bourbon"
    case bowmore12             = "Bowmore 12 year"
    case portCharlotte         = "Bruichladdich Port Charlotte"
    case buffaloTrace          = "Buffalo Trace Bourbon"
    case bushmills             = "Bushmills Irish Whiskey"
    case bushmills12           = "Bushmills 12 year Single Malt"
    case canadianWhiskeyAny    = "Canadian Whiskey"
    case compassBoxOrchard     = "Compass Box Orchard House"
    case compassBoxOakCross    = "Compass Box Oak Cross"
    case eagleRare10           = "Eagle Rare 10 year Bourbon"
    case elijahCraigSmallBatch = "Elijah Craig Small Batch"
    case fourRosesYellowLabel  = "Four Roses Yellow Label"
    case glenfiddich12         = "Glenfiddich 12 year"
    case hibikiHarmony         = "Hibiki Japanese Harmony"
    case hirschBourbon         = "Hirsch Horizon Bourbon"
    case irishWhiskeyAny       = "Irish Whiskey"
    case japaneseWhiskeyAny    = "Japanese Whiskey"
    case jimBeamRye            = "Jim Beam Rye"
    case johnnyDrum            = "Johnny Drum Bourbon"
    case knob120               = "Knob Creek 120 proof Bourbon"
    case larcenyBourbon        = "Larceny Bourbon"
    case laphroaig10           = "Laphroaig 10 year"
    case monongahelaRye        = "Monongahela Rye Whiskey"
    case monkeyShoulder        = "Monkey Shoulder"
    case oGD114                = "Old Grand-Dad 114"
    case pendletonRye          = "Pendleton Rye"
    case powersIrish           = "Powers Irish Whiskey"
    case rittenhouseRye        = "Rittenhouse Rye"
    case russels6yearRye       = "Russel's 6 year rye"
    case ryeWhiskeyAny         = "Rye Whiskey"
    
    case stagJr                = "Stag Jr. Bourbon"
    case straightRye           = "Straight Rye"
    case straightRyeOrBourbon  = "Straight Rye or Bourbon"
    case scotchAny             = "Scotch"
    case scotchBlended         = "Blended Scotch"
    case scotchHighland        = "Highland Scotch"
    case scotchSpeyside        = "Speyside Scotch"
    case scotchIsla            = "Peated Scotch (Islay)"
    case talisker10            = "Talisker 10 year"
    case toki                  = "Toki Blended Japanese Whiskey"
    case tullamoreDew          = "Tullamore D.E.W."
    case tullamoreDew12        = "Tullamore D.E.W. 12 year"
    case whiskeyAny            = "Whisk(e)y"
    case wildTurkeyRye         = "Wild Turkey Rye"
    case wlWeller90            = "W.L. Weller 90 proof Bourbon"
    case woodyCreekRye         = "Woody Creek Rye"
    
    var tags: Tags {
        switch self {
        case .bourbonAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny))])
        case .irishWhiskeyAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .ryeWhiskeyAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny))])
        case .straightRyeOrBourbon:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.bourbonOverproof))])
        case .scotchBlended:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .scotchIsla:
            Tags(flavors: [.peat], profiles: [.smokey], booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .bourbon120:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.bourbonAny)), Booze(.whiskies(.bourbonOverproof))])
        case .whiskeyAny:
            Tags(booze: [Booze(.whiskies(self))])
        case .Ardbeg:
            Tags(flavors: [.peat], profiles: [.smokey], booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchIsla))])
        case .rittenhouseRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .scotchAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)),])
        case .americanWhiskeyAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)),])
        case .glenfiddich12:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchSpeyside)), Booze(.whiskies(.scotchHighland))])
        case .aberlourAbundah:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchSpeyside)), Booze(.whiskies(.scotchHighland))])
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
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.canadianWhiskeyAny))])
        case .laphroaig10:
            Tags(flavors: [.peat], profiles: [.smokey], booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchIsla))])
        case .monkeyShoulder:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchBlended))])
        case .compassBoxOrchard:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchBlended))])
        case .balvinieDW:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchHighland)), Booze(.whiskies(.scotchSpeyside))])
        case .bushmills:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.irishWhiskeyAny))])
        case .eagleRare10:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny))])
        case .buffaloTrace:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny))])
        case .knob120:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny)), Booze(.whiskies(.bourbon120)), Booze(.whiskies(.bourbonOverproof))])
        case .russels6yearRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .oGD114:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny)), Booze(.whiskies(.bourbonOverproof))])
        case .wildTurkeyRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .balconesRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .woodyCreekRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .johnnyDrum:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny)), Booze(.whiskies(.bourbonOverproof))])
        case .bowmore12:
            Tags(flavors: [.peat], profiles: [.smokey], booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchIsla))])
        case .hibikiHarmony:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.japaneseWhiskeyAny))])
        case .japaneseWhiskeyAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .tullamoreDew:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.irishWhiskeyAny))])
        case .tullamoreDew12:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.irishWhiskeyAny))])
        case .compassBoxOakCross:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchBlended))])
        case .talisker10:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny)), Booze(.whiskies(.scotchHighland))])
        case .powersIrish:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.irishWhiskeyAny))])
        case .stagJr:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny)), Booze(.whiskies(.bourbonOverproof))])
        case .toki:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.japaneseWhiskeyAny))])
        case .wlWeller90:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny))])
        case .portCharlotte:
            Tags(flavors: [.peat], profiles: [.smokey], booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .hirschBourbon:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)),Booze(.whiskies(.bourbonAny))])
        case .scotchHighland:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        
        case .canadianWhiskeyAny:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny))])
        case .monongahelaRye:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.ryeWhiskeyAny))])
        case .scotchSpeyside:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.scotchAny))])
        case .bourbonOverproof:
            Tags(booze: [Booze(.whiskies(self)), Booze(.whiskies(.whiskeyAny)), Booze(.whiskies(.americanWhiskeyAny)), Booze(.whiskies(.bourbonAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.whiskies(self)))
    }
}
enum Liqueur: String, IngredientTagsProtocol {
    case allspiceDram         = "Allspice Dram"
    case aelredMelonApertif   = "Aelred Melon Aperitif"
    case amaretto             = "Amaretto"
    case anchoVerde           = "Verde Poblano Chile Liquor"
    case anchoRayesAncho      = "Chili Ancho Liqueur"
    case apricotLiqueur       = "Apricot Liqeur"
    case benedictine          = "Benedictine"
    case berentzenApple       = "Berentzen Apple Liqueur"
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
    case damiana              = "Damiana Liquor"
    case drambuie             = "Drambuie"
    case dolinGenepy          = "Dolin Genepy"
    case falernum             = "Falernum"
    case galliano             = "Galliano"
    case dryCuracao           = "Pierre Ferrand Dry Curacao"
    case giffardAbricot       = "Giffard Abricot"
    case giffardBanane        = "Giffard Banane Du Bresil"
    case giffardPamplemousse  = "Giffard Creme de Pamplemousse"
    case giffardPassion       = "Giffard Passion Fruit Liqueur"
    case giffardElderflour    = "Elderflower Liqueur"
    case greenChartreuse      = "Green Chartreuse"
    case italicus             = "Italicus"
    case lopoldsApple         = "New York Sour Apple Liqueur"
    case leopoldCherry        = "Michigan Cherry Liqueur"
    case licor43              = "Licor 43"
    case lolita               = "Caffe Lolita Coffee Liqueur"
    case luxardoCherry        = "Sangue Morlacco Cherry"
    case maraschinoLiqueur    = "Maraschino Liqueur"
    case nocino               = "Nocino Liquor"
    case nuxAlpina            = "Nux Alpina Walnut Liqueur"
    case orangeCuracao        = "Orange Curacao"
    case pimentoDram          = "Pimento Dram Liqueur"
    case pimms                = "Pimms No. 1"
    case plymouthSloeGin      = "Plymouth Sloe Gin"
    case salersAperitif       = "Salers Gentian Apéritif"
    case stGeorgeSpicesPear   = "St. George Spice Pear"
    case stGermaine           = "St. Germaine"
    case strega               = "Strega"
    case tempusFugitKina      = "Tempus Fugit Kina"
    case traderVicsChestnut   = "Trader Vic's Chestnut Liquor"
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
            Tags(flavors: [.bakingSpices, .allspice], booze: [Booze(.liqueurs(self))])
        case .apricotLiqueur:
            Tags(flavors: [.apricot], booze: [Booze(.liqueurs(self))])
        case .giffardAbricot:
            Tags(flavors: [.apricot], booze: [Booze(.liqueurs(self))])
        case .plymouthSloeGin:
            Tags(flavors: [.sloeBerries], booze: [Booze(.liqueurs(self)), Booze(.gins(.ginAny))])
        case .pimms:
            Tags(profiles: [.herbal, .botanical, .bittersweet], booze: [Booze(.liqueurs(self))])
        case .lopoldsApple:
            Tags(flavors: [.apple], booze: [Booze(.liqueurs(self))])
        case .giffardElderflour:
            Tags(flavors: [.elderflower], booze: [Booze(.liqueurs(self))])
        case .tempusFugitKina:
            Tags(booze: [Booze(.liqueurs(self))])
        case .anchoRayesAncho:
            Tags(flavors: [.poblanoChile], profiles: [.spicy], booze: [Booze(.liqueurs(self))])
        case .nuxAlpina:
            Tags(flavors: [.walnut], booze: [Booze(.liqueurs(self))])
        case .leopoldCherry:
            Tags(flavors: [.cherry], booze: [Booze(.liqueurs(self))])
        case .stGeorgeSpicesPear:
            Tags(flavors: [.pear, .bakingSpices], booze: [Booze(.liqueurs(self))])
        case .dolinGenepy:
            Tags(flavors: [.anise], booze: [Booze(.liqueurs(self))])
        case .traderVicsChestnut:
            Tags(flavors: [.chestnut], profiles: [.nutty], booze: [Booze(.liqueurs(self))])
        case .damiana:
            Tags(profiles: [.herbal], booze: [Booze(.liqueurs(self))])
        case .giffardPassion:
            Tags(flavors: [.passionfruit],  booze: [Booze(.liqueurs(self))])
        case .italicus:
            Tags(flavors: [.bergamot],  booze: [Booze(.liqueurs(self))])
        case .nocino:
            Tags(flavors: [.walnut],  booze: [Booze(.liqueurs(self))])
        case .aelredMelonApertif:
            Tags(flavors: [.melon],  booze: [Booze(.liqueurs(self))])
        case .pimentoDram:
            Tags(flavors: [.allspice, .bakingSpices],  booze: [Booze(.liqueurs(self))])
        case .berentzenApple:
            Tags(flavors: [.apple], booze: [Booze(.liqueurs(self))])
        case .lolita:
            Tags(flavors: [.coffee, .espresso], booze: [Booze(.liqueurs(self))])
        case .stGermaine:
            Tags(flavors: [.elderflower], booze: [Booze(.liqueurs(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.liqueurs(self)))
    }

}
enum FortifiedWine: String, IngredientTagsProtocol {
    case aeDorPineauDeCharantes = "Pineau des Charentes Blanc"
    case amontillado            = "Amontillado Sherry"
    case blancVermouth          = "Blanc Vermouth"
    case bonal                  = "Bonal Gentiane-Quina"
    case byrrh                  = "Byrrh Grand Quinquina"
    case carpanoAntica          = "Carpano Antica"
    case carpanoBianco          = "Carpano Bianco Vermouth"
    case capaletti              = "Cappelletti Aperitivo"
    case cocchiAmericano        = "Cocchi Americano"
    case cocchiBaroloChinato    = "Cocchi Barolo Chinato"
    case cocchiDeTorino         = "Cocchi Di Torino"
    case cocchiRosa             = "Cocchi Rosa"
    case dryVermouthAny         = "French dry vermouth"
    case dolinDry               = "Dolin Dry Vermouth"
    case dolinBlanc             = "Dolin Blanc Vermouth"
    case dolinRouge             = "Dolin Rouge Vermouth"
    case dubonnet               = "Dubonnet"
    case fino                   = "Fino Sherry"
    case hidalgoManzanilla      = "Hildago Manzanilla Sherry"
    case kinaLillet             = "Kina Lillet"
    case lilletBlanc            = "Lillet Blanc Vermouth"
    case lilletRose             = "Lillet Rose"
    case lustauAmontillado      = "Lustau Amontillado Sherry"
    case lustauRojoVermouth     = "Lustau Vermut Rojo"
    case lustauBlancVermouth    = "Lustau Vermut Blanco"
    case lustauPX               = "Lustau Pedro Ximénez Sherry"
    case martiniBianco          = "Martini Bianco Vermouth"
    case oloroso                = "Oloroso Sherry"
    case puntEMes               = "Punt E Mes"
    case sandemanPort           = "Sandeman Port"
    case sweetVermouthAny       = "Sweet Vermouth"
    case tawnyPort              = "Tawny Port"
    case portWine               = "Port"
    case vermouthAny            = "Vermouth"
    case sherryAny              = "Sherry"
    case sherryEastIndia        = "East India Lustau Sherry"
    case tioPepe                = "Tio Pepe Fino Sherry"
    case fortifiedWineAny       = "Fortified wine"
    
    var tags: Tags {
        switch self {
        case .amontillado:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .blancVermouth:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .byrrh:
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
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.portWine)), Booze(.fortifiedWines(.tawnyPort))])
        case .sherryEastIndia:
            Tags(profiles: [.fruity], booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .lustauAmontillado:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .lustauPX:
            Tags(profiles: [.fruity], booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .kinaLillet:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .tioPepe:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.fino))])
        case .lilletRose:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .hidalgoManzanilla:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .capaletti:
            Tags(profiles: [.bittersweet], booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .lustauRojoVermouth:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.sweetVermouthAny))])
        case .lustauBlancVermouth:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.blancVermouth))])
        case .bonal:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .aeDorPineauDeCharantes:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .cocchiBaroloChinato:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .carpanoBianco:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.blancVermouth))])
        case .oloroso:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.sherryAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .cocchiRosa:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .dubonnet:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .tawnyPort:
            Tags(profiles: [.fruity], booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny)), Booze(.fortifiedWines(.portWine)), Booze(.fortifiedWines(.tawnyPort))])
        case .martiniBianco:
            Tags(booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.vermouthAny)), Booze(.fortifiedWines(.fortifiedWineAny))])
        case .portWine:
            Tags(profiles: [.fruity], booze: [Booze(.fortifiedWines(self)), Booze(.fortifiedWines(.fortifiedWineAny))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.fortifiedWines(self)))
    }
}

enum Wine: String, IngredientTagsProtocol {
    case bourgogneAligote     = "Bourgogne Aligote"
    case champagne            = "Champagne"
    case dryRedWine           = "Dry Red Wine"
    case junmeiSake           = "Junmei Sake"
    case prosecco             = "Prosecco"
    
    var tags: Tags {
        return Tags(booze: [Booze(.wines(self))])
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.wines(self)))
    }

}
enum Bitters: String, IngredientTagsProtocol {
    case aromaticBitters       = "Aromatic Bitters"
    case angosturaBitters      = "Angostura Bitters"
    case appleBitters          = "Apple Bitters"
    case aPPBitters            = "A.P.P. Bitters"
    case bittermansChocolate   = "Bitterman's Chocolate Bitters"
    case bittercubeJamaican1   = "Bittercube Jamaican No.1 Bitters"
    case bitterTruthJTDecanter = "Jerry Thomas Decanter Bitters"
    case blackstrapBitters     = "Bittercube Blackstrap Bitters"
    case tikiBitters           = "Bitterman's Tiki Bitters"
    case blackWalnut           = "Black Walnut Bitters"
    case bolivarBitters        = "Bittercube Bolivar Bitters"
    case celeryBitters         = "Celery Bitters"
    case chocolateMole         = "Chocolate Molé Bitters"
    case grapefruitBitters     = "Grapefruit Bitters"
    case hellfireBitters       = "Bittermans Hellfire Bitters"
    case hoppedGrapefruit      = "Hopped Grapefruit Bitters"
    case houseOrangeBitters    = "House Orange Bitters"
    case lemonBitters          = "Lemon Bitters"
    case orangeBitters         = "Regans Orange Bitters"
    case peychauds             = "Peychaud's Bitters"
    case pimentoBitters        = "Pimento Bitters"
    case bitters               = "Bitters (Any)"
    
    var tags: Tags {
        switch self {
        case .blackWalnut:
            Tags(flavors: [.walnut], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .orangeBitters:
            Tags(flavors: [.orange], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .angosturaBitters:
            Tags(flavors: [.bakingSpices], booze: [Booze(.bitters(self)), Booze(.bitters(.aromaticBitters)),Booze(.bitters(.bitters))])
        case .peychauds:
            Tags(booze: [Booze(.bitters(self)), Booze(.bitters(.aromaticBitters)), Booze(.bitters(.bitters))])
        case .pimentoBitters:
            Tags(flavors: [.pimento], booze: [Booze(.bitters(self)), Booze(.bitters(.aromaticBitters)),Booze(.bitters(.bitters))])
        case .hellfireBitters:
            Tags(profiles: [.spicy], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .celeryBitters:
            Tags(flavors: [.celery], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .chocolateMole:
            Tags(flavors: [.chocolate, .molé], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .aromaticBitters:
            Tags(booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .appleBitters:
            Tags(flavors: [.apple], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .hoppedGrapefruit:
            Tags(flavors: [.grapefruit], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .lemonBitters:
            Tags(flavors: [.grapefruit], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .tikiBitters:
            Tags(flavors: [.cinnamon, .bakingSpices], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .grapefruitBitters:
            Tags(flavors: [.grapefruit], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .bolivarBitters:
            Tags(booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .blackstrapBitters:
            Tags(flavors: [.molasses], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .bittercubeJamaican1:
            Tags(booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .bitterTruthJTDecanter:
            Tags(booze: [Booze(.bitters(self)), Booze(.bitters(.aromaticBitters)),Booze(.bitters(.bitters))])
        case .bittermansChocolate:
            Tags(flavors: [.chocolate], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .aPPBitters:
            Tags(booze: [Booze(.bitters(self)), Booze(.bitters(.aromaticBitters)),Booze(.bitters(.bitters))])
        case .houseOrangeBitters:
            Tags(flavors: [.orange], booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        case .bitters:
            Tags(booze: [Booze(.bitters(self)),Booze(.bitters(.bitters))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.bitters(self)))
    }
}

enum Amaro: String, IngredientTagsProtocol {
    
    case amargoVallet         = "Amargo-Vallet"
    case amaroAny             = "Amaro"
    case amereNouvelle        = "Amere Nouvelle Liqueur"
    case amerPicon            = "Amer Picon"
    case angosturaAmaro       = "Angostura Amaro"
    case aperol               = "Aperol"
    case averna               = "Averna Amaro"
    case aveze                = "Aveze"
    case amaroMontenegro      = "Montenegro Amaro"
    case amaroNonino          = "Nonino Amaro"
    case braulio              = "Braulio"
    case becherovka           = "Becherovka"
    case campari              = "Campari"
    case cardamaro            = "Cardamaro"
    case chinaChina           = "Bigallet China China Amer "
    case cioCiaroAmaro        = "Amaro Cio Ciaro"
    case cynar                = "Cynar"
    case DellErborista        = "Varnelli Amaro Dell'Erborista"
    case fernetBranca         = "Fernet Branca"
    case fernetBrancaMenta    = "Fernet Branca Menta"
    case fernetVallet         = "Fernet-Vallet"
    case jagerColdBrew        = "Jagermeister Cold Brew"
    case jagerManifest        = "Jagermeister Manifest Amaro"
    case leopold3Pins         = "Three Pins Amaro"
    case luxardoBitterBianco  = "Luxard Bitter Bianco"
    case nardiniAmaro         = "Nardini Amaro"
    case ramazzotti           = "Ramazzotti Amaro"
    case ramazzottiRosato     = "Ramazzotti Rosato Apertivo"
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
        case .luxardoBitterBianco:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .amereNouvelle:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .cardamaro:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .fernetVallet:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .leopold3Pins:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .nardiniAmaro:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .cioCiaroAmaro:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .jagerManifest:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .amargoVallet:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .ramazzotti:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .ramazzottiRosato:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .jagerColdBrew:
            Tags(flavors: [.coffee, .espresso], profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        case .aveze:
            Tags(profiles: [.herbal, .botanical], booze: [Booze(.amari(.amaroAny)), Booze(.amari(self))])
        }
    }
    
    var cockTailComponent: CocktailComponent {
        return CocktailComponent(for: Booze(.amari(self)))
    }
}
