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
    @Published var isShowingRandomCocktailView = false
    @Published var bartenderViewCocktails: [CocktailListCocktail] = getBartenderViewCocktails()
    @Published var guestViewCocktails: [CocktailListCocktail] = getGuestViewCocktails()
    @Published var randomCocktail = oldFashioned
   
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
        cocktailDict["Hanky Panky"] = [hankyPanky]
        cocktailDict["Harvey Wallbanger"] = [harveyWallbanger]
        cocktailDict["Greenpoint"] = [greenpoint]
        cocktailDict["Hotel Nacional"] = [hotelNacional]
        cocktailDict["Japanese Cocktail"] = [japaneseCocktail]
        cocktailDict["Last Word"] = [lastWord]
        cocktailDict["La Louisiane"] = [laLouisiane]
        cocktailDict["Major Bailey"] = [majorBailey]
        cocktailDict["Mint Julep"] = [mintJulep]
        cocktailDict["Modern Cocktail"] = [modernCocktail]
        cocktailDict["Mojito"] = [mojito]
        cocktailDict["Morning Glory Fizz"] = [morningGloryFizz]
        cocktailDict["Old Cuban"] = [oldCuban]
        cocktailDict["Old Fashioned"] = [oldFashioned]
        cocktailDict["Old Pal"] = [oldPal]
        cocktailDict["Pain Killer"] = [painKiller]
        cocktailDict["Penicillin"] = [penicillin]
        cocktailDict["Queens Park Swizzle"] = [queensParkSwizzle]
        cocktailDict["Remember The Maine"] = [rememberTheMaineOG]
        cocktailDict["Rob Roy"] = [robRoy]
        cocktailDict["Saturn"] = [saturn]
        cocktailDict["Sazerac"] = [sazerac]
        cocktailDict["Sidecar"] = [sidecar]
        cocktailDict["Singapore Sling"] = [singaporSling]
        cocktailDict["Ultima Palabra"] = [ultimaPalabra]
 
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
                                                                     "Algonquin":[algonquinWnG],
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
                                                                     "Grasshopper":[grasshopper, grasshopperWnG],
                                                                     "Hanky Panky":[hankyPanky, hankyPankyWnG],
                                                                     "Harvey Wallbanger": [harveyWallbanger, harveyWallbangerWnG],
                                                                     "Hemingway Daiquiri": [hemingwayDaiquiri, papaDoble],
                                                                     "Honeymoon Cocktail": [honeymoonCocktail1st, honeymoonCocktailEmbury, honeymoonCocktailWnG],
                                                                     "Holland House": [hollandHouseKappeler, hollandHouseCocktail, hollandHouseCocktailWnG],
                                                                     "Hot Toddy": [hotBrandyToddy, hotToddyWnG, morgenthalersToddy],
                                                                     "Hotel Nacional": [hotelNacional, hotelNacionalWnG],
                                                                     "Hurricane": [hurricane, hurricaneWnG],
                                                                     "Irish Coffee": [irishCoffee, irishCoffeeWnG],
                                                                     "Jack Rose": [jackRose],
                                                                     "Japanese Cocktail": [japaneseCocktail, japaneseCocktailWnG],
                                                                     "Jungle Bird": [jungleBird, jungleBirdWnG],
                                                                     "Kir Royale": [kirRoyale, kirRoyaleWnG],
                                                                     "La Louisiane": [laLouisiane, laLouisianeWnG],
                                                                     "Last Word": [lastWord, lastWordWnG],
                                                                     "Lemon Drop": [lemonDrop, lemonDropWnG],
                                                                     "Manhattan": [manhattan],
                                                                     "Mai Tai": [maiTai, maiTaiWnG],
                                                                     "Major Bailey": [majorBailey, majorBaileyWnG],
                                                                     "Margarita": [margarita, margaritaTommys],
                                                                     "Martinez": [martinez, martinezWnG],
                                                                     "Martini": [martini, gibson],
                                                                     "Mexican Firing Squad": [mexicanFiringSquad, mexicanFiringSquadWnG],
                                                                     "Mezcalero": [mezcalero],
                                                                     "Mint Julep": [mintJulep, mintJulepWnG],
                                                                     "Mojito": [mojito, mojitoWnG],
                                                                     "Modern Cocktail": [modernCocktail, modernCocktailWnG],
                                                                     "Morning Glory Fizz": [morningGloryFizz, morningGloryFizzWnG],
                                                                     "Moscow Mule" : [moscowMule],
                                                                     "Negroni": [negroni],
                                                                     "New York Sour": [NewYorkSour, NewYorkSourWnG],
                                                                     "Old Fashioned": [oldFashioned, oldFashionedWnG],
                                                                     "Oaxaca Old Fashioned": [oaxacaOldFashioned, oaxacaOldFashionedWnG],
                                                                     "Old Cuban": [oldCuban, oldCubanWnG],
                                                                     "Old Pal" : [oldPal, oldPalWnG],
                                                                     "Pain Killer": [painKiller, painKillerWnG],
                                                                     "Paloma": [paloma],
                                                                     "Pimms Cup": [pimmsCup],
                                                                     "Pink Lady": [pinkLady],
                                                                     "Pisco Sour": [piscoSour],
                                                                     "Prince Edward": [princeEdward],
                                                                     "Queens Park Swizzle": [queensParkSwizzle, queensParkSwizzleWnG],
                                                                     "Ramos Gin Fizz": [ramosGinFizz],
                                                                     "Remember The Maine": [rememberTheMaineOG, rememberTheMaineWnG],
                                                                     "Rusty Nail": [RustyNailWnG],
                                                                     "Rob Roy": [robRoy, robRoyWnG],
                                                                     "Saturn": [saturn, saturnWnG],
                                                                     "Sazerac": [sazerac, sazeracWnG],
                                                                     "Scofflaw": [scofflaw , scofflawWnG],
                                                                     "Sherry Cobbler" : [sherryCobbler, sherryCobblerWnG],
                                                                     "Sidecar": [sidecar, sidecarWnG],
                                                                     "Singapore Sling": [singaporSling, singaporSlingWnG],
                                                                     "Sloe Gin Fizz" : [sloeGinFizz, sloeGinFizzWnG],
                                                                     "Stinger": [stingerWnG],
                                                                     "Ti Punch": [tiPunch, tiPunchWnG],
                                                                     "Tipperary": [tipperary, tipperaryDR, tipperaryWnG],
                                                                     "Tom Collins": [tomCollins, tomCollinsWnG],
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
                                                          "Gold Rush": [goldRush],
                                                          "Greenpoint": [greenpoint, greenpointWnG],
                                                          "Kentucky Maid": [kentuckyMaid, kentuckyMaidWnG],
                                                          "Naked and Famous": [nakedAndFamous],
                                                          "Trinidad Sour": [trinidadSour],
                                                          "Ultima Palabra": [ultimaPalabra, ultimaPalabraWnG, ultimaPalabraLondon],
                                                          "White Negroni": [whiteNegroni],
                                                          "Paper Plane": [paperPlane],
                                                          "Penicillin": [penicillin, penicillinWnG] ]

        
        let allCocktails = classicCocktailsForBartenders.merging(deathAndCoCocktails) { (_, new) in new }.merging(wNgModernCocktails) { (_, new) in new }.merging(miscModernCocktails) { (_, new) in new }
        
        return allCocktails
    }
    
   func fetchRandomCocktail() -> Cocktail {
        return CocktailListViewModel.getGuestViewCocktails().flatMap({$0.cocktailVariations}).sorted(by: {$0.cocktailName < $1.cocktailName}).randomElement()!
    }
    
    @ViewBuilder
    func getRandomCocktailView(for menuMode: Bool) -> some View {
        if menuMode {
            SearchGuestRecipeView(viewModel: CocktailMenuViewModel(cocktail: randomCocktail))
             
        } else {
            SearchBartenderRecipeView(viewModel: CocktailMenuViewModel(cocktail: randomCocktail))
             
                
            
        }
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
