//
//  CocktailListViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

final class CocktailListViewModel: ObservableObject {
    static let shared = CocktailListViewModel()
    //@Published var guestCocktails: [Cocktail] = getGuestViewCocktails().flatMap({$0.cocktailVariations}).sorted(by: {$0.cocktailName < $1.cocktailName})
    @Published var bartenderCocktails: [Cocktail] = getBartenderViewCocktails().flatMap({$0.cocktailVariations}).sorted(by: {$0.cocktailName < $1.cocktailName})
    //@Published var bartenderCocktails: [Cocktail] = [cloverClub]
    @Published var justWilliamsAndGrahamCocktails = getBartenderViewCocktails().flatMap({$0.cocktailVariations}).filter({$0.author?.place == AuthorPlaces.williamsAndGraham.rawValue})
    @Published var isShowingRecipeCard = false
    @Published var selectedCocktail: Cocktail?
    @Published var isShowingBuildOrderButton = false

    @Published var bartenderViewCocktails: [CocktailListCocktail] = getBartenderViewCocktails()
    @Published var guestViewCocktails: [CocktailListCocktail] = getGuestViewCocktails()
    @Published var randomCocktail = oldFashioned
    @Published var isShowingWnGCocktailsOnly: Bool = false
    @Published var currentVariation = "Placeholder"

   
    func changePlaceholder(for cocktail: Cocktail) {
        if let variation = cocktail.variation {
            currentVariation = variation.rawValue
        }
    }
    func filter86dCocktailsForBartenders() -> [Cocktail] {
        let startingCocktails = CocktailListViewModel.getBartenderViewCocktails().flatMap({$0.cocktailVariations})
        let theList = SearchCriteriaViewModel.get86ListNames()
        
        var acceptedCocktails: [Cocktail] = []
        for cocktail in startingCocktails {
            var doesntMatch = 0
            for spec in cocktail.spec {
                if theList.contains(spec.ingredient.name) {
                    doesntMatch += 1
                }
            }
            if doesntMatch == 0 {
                acceptedCocktails.append(cocktail)
            }
            
        }
        for name in theList {
            print("\(name)")
        }
        
        
        return acceptedCocktails.sorted(by: {$0.cocktailName < $1.cocktailName})
    }
   
    static func getGuestViewCocktails() -> [CocktailListCocktail] {
        var guestCocktails: [CocktailListCocktail] = []
        var cocktailDict = getCocktailDict()
        cocktailDict["Americano"] = [americano]
        cocktailDict["Bamboo"] = [bamboo]
        cocktailDict["Bijou"] = [bijou]
        cocktailDict["Bloody Marry"] = [bloodyMary]
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
        cocktailDict["Remember The Maine"] = [rememberTheMaine]
        cocktailDict["Rob Roy"] = [robRoy]
        cocktailDict["Saturn"] = [saturn]
        cocktailDict["Sazerac"] = [sazerac]
        cocktailDict["Sidecar"] = [sidecar]
        cocktailDict["Singapore Sling"] = [singaporeSling]
        cocktailDict["Ultima Palabra"] = [ultimaPalabra]
 
//        for cocktails in cocktailDict {
//            guestCocktails.append(CocktailListCocktail(cocktailName: cocktails.key, cocktailVariations: cocktails.value, isOpen: true))
//        }
        let sortedCocktails = guestCocktails.sorted(by: {$0.cocktailName < $1.cocktailName})
        return sortedCocktails
    }
    
    static func getBartenderViewCocktails() -> [CocktailListCocktail] {
        var bartenderCocktails: [CocktailListCocktail] = []
        for cocktails in getCocktailDict() {
            bartenderCocktails.append(CocktailListCocktail(cocktailName: cocktails.key, cocktailVariations: cocktails.value, isOpen: true))
       
        }
        let sortedCocktails = bartenderCocktails.sorted(by: {$0.cocktailName < $1.cocktailName})
        return sortedCocktails
    }
    
    static func getCocktailDict() -> [String: [Cocktail]] {
        let classicCocktailsForBartenders: [String: [Cocktail]] =  [ "Adonis": [adonis],
                                                                     "Air Mail": [airMail, airMailWnG],
                                                                     "Alaska": [alaska, alaskaWnG],
                                                                     "Algonquin": [algonquin, algonquinWnG],
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
                                                                     "Bloody Marry": [bloodyMary, bloodyMaryWnG],
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
                                                                     "Hemingway Daiquiri": [hemingwayDaiquiri, papaDobleWnG],
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
                                                                     "Ramona Flowers": [ramonaFlowers],
                                                                     "Remember The Maine": [rememberTheMaine, rememberTheMaineWnG],
                                                                     "Rusty Nail": [RustyNailWnG],
                                                                     "Rob Roy": [robRoy, robRoyWnG],
                                                                     "Saturn": [saturn, saturnWnG],
                                                                     "Sazerac": [sazerac, sazeracWnG],
                                                                     "Scofflaw": [scofflaw , scofflawWnG],
                                                                     "Sherry Cobbler" : [sherryCobbler, sherryCobblerWnG],
                                                                     "Sidecar": [sidecar, sidecarWnG],
                                                                     "Singapore Sling": [singaporeSling, singaporeSlingWnG],
                                                                     "Sloe Gin Fizz" : [sloeGinFizz, sloeGinFizzWnG],
                                                                     "Stinger": [stingerWnG],
                                                                     "Ti Punch": [tiPunch, tiPunchWnG],
                                                                     "Tipperary": [tipperary, tipperaryDR, tipperaryWnG],
                                                                     "Tom Collins": [tomCollins, tomCollinsWnG],
                                                                     "20th Century Coctkail": [twentiethCenturyCocktail],
                                                                     "Vesper": [vesper, vesperWnG],
                                                                     "Vieux Carre" : [vieuxCarre],
                                                                     "Whiskey Smash": [whiskeySmash],
                                                                     "Whiskey Sour": [whiskeySour],
                                                                     "Zombie": [zombie, zombieWnG]]
        
        let deathAndCoCocktails: [String : [Cocktail]] = ["Crop Top": [cropTop],
                                                          "Division Bell": [divisionBell],
                                                          "Final Ward": [finalWard],
                                                          "Gilda": [gilda]]
        
        let wNgModernCocktails: [String : [Cocktail]] = ["A Flight South of the Border":[aFlightSouthOfTheBorder],
                                                         "Acquit Your Quest": [acquitYourQuest],
                                                         "A Light in the Dark": [aLightInTheDark],
                                                         "Aloe for that Burn": [aloeForThatBurn],
                                                         "American Gothic": [americanGothic],
                                                         "Autumn Rainbows": [autumnRainbows],
                                                         "Banh Mi": [banhMi],
                                                         "Beach Blanket Bingo": [beachBlanketBingo],
                                                         "Becky with the Good Hair": [beckyWithTheGoodHair],
                                                         "Blackberry Sage Smash": [blackberrySageSmash],
                                                         "Buris' Bovine Beverage": [burisBovineBev],
                                                         "Cardi C": [cardiC],
                                                         "Cellar Door(W&G)": [cellarDoor],
                                                         "Clever Girl": [cleverGirl],
                                                         "Coffee & Cigs": [coffeeAndCigs],
                                                         "Corporate Jargon": [corporateJargon],
                                                         "Comin' Up Roses": [cominUpRoses],
                                                         "Davey Crocket's Locker": [daveyCrocketsLocker],
                                                         "Don't Panic": [dontPanic],
                                                         "Eastern Diplomat": [easternDiplomat],
                                                         "Easy Street" : [easyStreet],
                                                         "El Chichicabra": [elChicicabra],
                                                         "El Ocho Rosado": [elOchoRosado],
                                                         "End of an Empire": [endOfAnEmpire],
                                                         "Falcoooor!": [falcoor],
                                                         "Farewell Ride": [farewellRide],
                                                         "Feathered Hat Flip No. 1": [featheredHatFlipNo1],
                                                         "Feathered Hat Flip No. 2": [featheredHatFlipNo2],
                                                         "Follow The Compass": [followTheCompass],
                                                         "Gift Horse": [giftHorse],
                                                         "Girly Drink": [girlyDrink],
                                                         "Great Scott!": [greatScott],
                                                         "Great White Buffalo": [greatWhiteBuffalo],
                                                         "Happy Accidents": [happyAccidents],
                                                         "Harvest Moon": [harvestMoon],
                                                         "Heart of Gold": [heartOfGold],
                                                         "Here Be Dragons": [hereBeDragons],
                                                         "Highland Lass": [highlandLass],
                                                         "Dark Corners"  : [darkCorners],
                                                         "Irish Goodbye": [irishGoodbye],
                                                         "Jared Leto's Pretty Face": [jaredLetosPrettyFace],
                                                         "Jupiter(W&G)": [jupiter],
                                                         "King Louis Death Bed": [kingLouisDeathBed],
                                                         "Kitten with a Whip": [kittenWithAWhip],
                                                         "Machete": [machete],
                                                         "Mostly Harmless": [mostelyHarmless],
                                                         "Netflix and Chill": [netflixAndChill],
                                                         "Nobody's Perfect" : [nobodysPerfect],
                                                         "Northern Duchess": [northernDuchess],
                                                         "La Coa": [laCoa],
                                                         "Lavandula Rosa": [lavandulaRosa],
                                                         "Long Way Down": [longWayDown],
                                                         "Lord Reyes the VIII ": [lordReyesTheVIII],
                                                         "Lord Touchingtons Delight": [lordTouchingtonsDelight],
                                                         "Low Ball": [lowBall],
                                                         "Madusa's Fang": [madusasFang],
                                                         "Midnight In Michoacan": [midnightInMichoacan],
                                                         "Money Penny": [moneyPenny],
                                                         "Night Vision": [nightVision],
                                                         "Northmans Conquest": [northmansConquest],
                                                         "One Night In Kyoto": [oneNightInKyoto],
                                                         "Paper Pilot": [paperPilot],
                                                         "Peaks of Reykjavic": [peaksOfReykjavic],
                                                         "Peanut Butter Falcon": [peanutButterFalcon],
                                                         "Pineau Noir": [pineauNoir],
                                                         "Pipe Dream": [pipeDream],
                                                         "Pretty In Paradox": [prettyInParadox],
                                                         "Red Wedding": [redWedding],
                                                         "Reyon Vert": [reyonVert],
                                                         "Rob McKenna" : [robMcKenna],
                                                         "Rich Girl" : [richGirl],
                                                         "Saged Oracle": [sagedOracle],
                                                         "Second Surise": [secondSunrise],
                                                         "Shameless": [shameless],
                                                         "Stag Party": [stagParty],
                                                         "Shokunin": [shokunin],
                                                         "Sloe Walker": [sloeWalker],
                                                         "Slut Dragon": [slutDragon],
                                                         "Smoking Monkey": [smokingMonkey],
                                                         "Something About Prague": [somethingAboutPrague],
                                                         "Something Bitter This Way Comes": [somethingBitter],
                                                         "Sunny Side": [sunnySide],
                                                         "Pour Lenore": [pourLenore],
                                                         "Spanish Revival": [spanishRevival],
                                                         "Stirred & Boozy": [stirredAndBoozy],
                                                         "Switchblade Romance": [switchbladeRomance],
                                                         "The Great Gazoo": [theGreatGazoo],
                                                         "The Roastery": [TheRoastery],
                                                         "The Rural Juror": [theRuralJuror],
                                                         "The Scottish Inquisition": [scottishInquisition],
                                                         "The Traveler": [theTraveler],
                                                         "Tread Lightly": [treadLightly], 
                                                         "Unusual Suspect": [unusualSuspect],
                                                         "Victory Lap" : [victoryLap],
                                                         "What's Your Favorite": [whatsYourFavorite],
                                                         "Where Eagles Fly": [whereEaglesFly],
                                                         "William's Cross": [williamsCross],
                                                         "Yeen." : [yeen],
                                                         "Zombie 129": [zombie129]]
        
        let miscModernCocktails: [String : [Cocktail]] = ["Black Manhattan": [blackManhattan], 
                                                          "Cable Car":[cableCar, cableCarWnG],
                                                          "Casanova Cocktail": [casanovaCocktail],
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
            RecipeView(viewModel: CocktailMenuViewModel(cocktail: randomCocktail))
             
                
            
        }
    }
}

struct CocktailListCocktail: Hashable, Equatable {
    static func == (lhs: CocktailListCocktail, rhs: CocktailListCocktail) -> Bool {
        return lhs.cocktailName == rhs.cocktailName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(cocktailName)
    }
   

    let cocktailName: String
    let cocktailVariations: [Cocktail]
    var isOpen: Bool
    
  

}
