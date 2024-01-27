//
//  CocktailListViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

final class CocktailListViewModel: ObservableObject {
    @Environment(\.modelContext) var modelContext
    static let shared = CocktailListViewModel()
    @Published var guestCocktails: [Cocktail] = getGuestViewCocktails().flatMap({$0.cocktailVariations}).sorted(by: {$0.cocktailName < $1.cocktailName})
    @Published var bartenderCocktails: [Cocktail] = getBartenderViewCocktails().flatMap({$0.cocktailVariations}).sorted(by: {$0.cocktailName < $1.cocktailName})
    @Published var isShowingRecipeCard = false
    @Published var selectedCocktail: Cocktail?
    @Published var isShowingBuildOrderButton = false
   
    static func getGuestViewCocktails() -> [CocktailListCocktail] {
        var guestCocktails: [CocktailListCocktail] = []
        var cocktailDict = getCocktailDict()
        cocktailDict["Americano"] = [americano]
        cocktailDict["Bamboo"] = [bamboo]
        cocktailDict["Bijou"] = [bijou]
        cocktailDict["Bloody Marry"] = [bloodyMarry]
        cocktailDict["Fair and Warmer"] = [fairAndWarmer]
        cocktailDict["Between the Sheets"] = [betweenTheSheets]
        cocktailDict["El Presidente"] = [elPresidente]
        cocktailDict["Fancy Free"] = [fancyFree]
        cocktailDict["Gin Fizz"] = [ginFizz, silverGinFizz]
 
        for cocktails in cocktailDict {
            guestCocktails.append(CocktailListCocktail(cocktailName: cocktails.key, cocktailVariations: cocktails.value))
        }
        let sortedCocktails = guestCocktails.sorted(by: {$0.cocktailName < $1.cocktailName})
        return sortedCocktails
    }
    
    static func getBartenderViewCocktails() -> [CocktailListCocktail] {
        var bartenderCocktails: [CocktailListCocktail] = []
        for cocktails in getCocktailDict() {
            bartenderCocktails.append(CocktailListCocktail(cocktailName: cocktails.key, cocktailVariations: cocktails.value))
        }
        let sortedCocktails = bartenderCocktails.sorted(by: {$0.cocktailName < $1.cocktailName})
        return sortedCocktails
    }
    
    static func getCocktailDict() -> [String: [Cocktail]] {
        let classicCocktailsForBartenders: [String: [Cocktail]] =  [ "Adonis": [adonis],
                                                        "Air Mail": [airMail, airMailWnG],
                                                        "Alaska": [alaska, alaskaWnG],
                                                        "Amaretto Sour": [amarettoSour, amarettoSourWnG],
                                                        "Americano": [americano, americanoWnG],
                                                        "Aperol Spritz": [aperolSpritz],
                                                        "Army & Navy": [armyNavy],
                                                        "Aviation": [aviation],
                                                        "Bee's Knees": [beesKnees],
                                                        "Between the Sheets": [betweenTheSheets, betweenTheSheetsWnG],
                                                        "Bamboo": [bamboo, bambooWnG],
                                                        "Bijou": [bijou, bijouWnG],
                                                        "Blood & Sand": [bloodAndSand, bloodAndSandWnG],
                                                        "Bloody Marry": [bloodyMarry, bloodyMarryWnG],
                                                        "Blue Blazer": [blueBlazer],
                                                        "Bobby Burns": [bobbyBurns],
                                                        "Boulevardier": [boulevardier, boulevardierWnG],
                                                        "Bramble": [bramble, brambleWng],
                                                        "Brandy Alexander": [brandyAlexander],
                                                        "Brandy Crusta" : [brandyCrusta, brandyCrustaWnG],
                                                        "Brown Derby": [brownDerbyRum, brownDerbyBourbon, brownDerbyWnG],
                                                        "Brooklyn": [brooklyn, brooklynWnG],
                                                        "Brunelle": [brunelle],
                                                        "Caipirniha": [caipirinha],
                                                        "Carajillo": [carajillo],
                                                        "Champs Elysees": [champsElysees],
                                                        "Champagne Cocktail": [champagneCocktail],
                                                        "Chocolate Martini": [chocolateMartiniWnG],
                                                        "Chocolate Cocktail": [chocolateCocktail],
                                                        "Chrysanthemum": [chrysanthemum],
                                                        "Clover Club": [cloverClub, cloverClubWnG],
                                                        "Corn 'n' Oil": [cornNOil],
                                                        "Corpse Reviver No. 1": [corpseReviver1],
                                                        "Corpse Reviver No. 2": [corpseReviver2],
                                                        "Cosmopolitan": [cosmopolitan],
                                                        "Daiquiri": [daiquiri],
                                                        "Dark and Stormy":  [darkNStormy],
                                                        "Death in the Afternoon": [deathInTheAfternoon],
                                                        "Diamondback": [diamondBack],
                                                        "El Diablo": [elDiablo],
                                                        "El Presidente": [elPresidente, elPresidenteWnG],
                                                        "Emerald": [emerald],
                                                        "Fair and Warmer": [fairAndWarmer, fairAndWarmerWnG],
                                                        "Fancy Free": [fancyFree, fancyFreeWnG],
                                                        "Fog Cutter": [fogCutter, fogCutterWnG],
                                                        "French 75": [french75, french75Cognac, french75WnG],
                                                        "Gin Rickey": [ginRickey],
                                                        "Gimlet": [gimlet],
                                                        "Gin Fizz": [ginFizz, ginFizzWnG, silverGinFizz],
                                                        "Jack Rose": [jackRose],
                                                        "Jungle Bird": [jungleBird],
                                                        "Last Word": [lastWord],
                                                        "Manhattan": [manhattan],
                                                        "Mai Tai": [maiTai],
                                                        "Margarita": [margarita, margaritaTommys],
                                                        "Martini": [martini, gibson],
                                                        "Mint Julep": [mintJulep],
                                                        "Mojito": [mojito],
                                                        "Negroni": [negroni],
                                                        "Old Fashioned": [oldFashioned],
                                                        "Paloma": [paloma],
                                                        "Pisco Sour": [piscoSour],
                                                        "Queens Park Swizzle": [queensParkSwizzle],
                                                        "Ramos Gin Fizz": [ramosGinFizz],
                                                        "Rob Roy": [robRoy],
                                                        "Saturn": [saturn],
                                                        "Sazerac": [sazerac],
                                                        "Sidecar": [sidecar],
                                                        "Ti Punch": [tiPunch],
                                                        "20th Century Coctkail": [twentiethCenturyCocktail],
                                                        "Vieux Carre" : [vieuxCarre],
                                                        "Whiskey Sour": [whiskeySour]]
        
        let deathAndCoCocktails: [String : [Cocktail]] = ["Crop Top": [cropTop],
                                                          "Division Bell": [divisionBell],
                                                          "Final Ward": [finalWard],
                                                          "Gilda": [gilda]]
       
        let wNgModernCocktails: [String : [Cocktail]] = ["A Flight South of the Border":[aFlightSouthOfTheBorder],
                                                         "Aloe for that Burn": [aloeForThatBurn],
                                                         "Becky with the Good Hair": [beckyWithTheGoodHair],
                                                         "Blackberry Sage Smash": [blackberrySageSmash],
                                                         "Comin' Up Roses": [cominUpRoses],
                                                         "El Chichicabra": [elChicicabra],
                                                         "Gift Horse": [giftHorse],
                                                         "Great White Buffalo": [greatWhiteBuffalo],
                                                         "Heart of Gold": [heartOfGold],
                                                         "Here Be Dragons": [hereBeDragons],
                                                         "Jared Leto's Pretty Face": [jaredLetosPrettyFace],
                                                         "Machete": [machete],
                                                         "Netflix and Chill": [netflixAndChill],
                                                         "Peanut Butter Falcon": [peanutButterFalcon],
                                                         "Red Wedding": [redWedding],
                                                         "Reyon Vert": [reyonVert],
                                                         "Second Surise": [secondSunrise],
                                                         "Slut Dragon": [slutDragon],
                                                         "Smoking Monkey": [smokingMonkey],
                                                         "Sunny Side": [sunnySide],
                                                         "Spanish Revival": [spanishRevival]]
        
        let miscModernCocktails: [String : [Cocktail]] = ["Black Manhattan": [blackManhattan], 
                                                          "Cable Car":[cableCar, cableCarWnG],
                                                          "Caucasian":[caucasian],
                                                          "Trinidad Sour": [trinidadSour],
                                                          "Ultima Palabra": [ultimaPalabra],
                                                          "White Negroni": [whiteNegroni],
                                                          "Paper Plane": [paperPlane],
                                                          "Penicillin": [penicillin] ]

        
        let allCocktails = classicCocktailsForBartenders.merging(deathAndCoCocktails) { (_, new) in new }.merging(wNgModernCocktails) { (_, new) in new }.merging(miscModernCocktails) { (_, new) in new }
        
        return allCocktails
    }
    
    
    // TODO: Ready for swiftData
//    func addCocktailsToSwiftData() {
//        modelContext.insert(aperolSpritz)
//    }
}

struct CocktailListCocktail: Identifiable {
    let id = UUID()
    let cocktailName: String
    let cocktailVariations: [Cocktail]
    
}
