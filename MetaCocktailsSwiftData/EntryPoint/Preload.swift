//
//  Preload.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/17/24.
//

import Foundation

enum Preload: CaseIterable {

    case classicCocktails
    case modernCocktails
    case williamsAndGrahamClassicCocktails
    case wngModern
    case williamsAndGrahamOriginals
    case deathAndCoCocktails
    case milkAndHoney
    
    var cocktails: [Cocktail] {
        switch self {
        case .classicCocktails:
            [adonis, airMail, alaska, algonquin, amarettoSour, americano, aperolSpritz, appleJackCocktail, armyNavy, aviation, beesKnees, betweenTheSheets, bamboo, bijou, bloodAndSand, bloodyMary, blueBlazer, bobbyBurns, boulevardier, bramble, brandyAlexander, brandyCrusta, brownDerbyRum, brownDerbyBourbon, brooklyn, brunelle, caipirinha, carajillo, champsElysees, champagneCocktail, chocolateCocktail, chrysanthemum, cloverClub, cornNOil, corpseReviver1, corpseReviver2, cosmopolitan, daiquiri, darkNStormy, deathInTheAfternoon, diamondBack, elDiablo, elPresidente, emerald, fairAndWarmer, fancyFree, fogCutter, french75, french75Cognac, ginRickey, gimlet, ginFizz, silverGinFizz, grasshopper, hankyPanky, harveyWallbanger, hemingwayDaiquiri, papaDobleWnG, homeOnTheRange, honeymoonCocktail1st, honeymoonCocktailEmbury, hollandHouseKappeler, hollandHouseCocktail, hotBrandyToddy, morgenthalersToddy, hotelNacional, hurricane, irishCoffee, jackRose, japaneseCocktail, jungleBird, kirRoyale, laLouisiane, lastWord, lemonDrop, lionsTail, manhattan, maiTai, majorBailey, margarita, margaritaTommys, martinez, martinezWnG, martini, gibson, mexicanFiringSquad, mezcalero, mintJulep, mojito, modernCocktail, morningGloryFizz, moscowMule, negroni, NewYorkSour, oldFashioned, oaxacaOldFashioned, oldCuban, oldPal, painKiller, paloma, pimmsCup, pinkLady, piscoSour, princeEdward, queensParkSwizzle, ramosGinFizz, ramonaFlowers, rememberTheMaine, robRoy, saturn, sazerac, scofflaw, sherryCobbler, sidecar, singaporeSling, sloeGinFizz, southSideFizz, tiPunch, tipperary, tipperaryDR, tomCollins, toronto, twentiethCenturyCocktail, vesper, vieuxCarre, whiskeySmash, whiskeySour, zombie]
            
        case .modernCocktails:
            [blackManhattan, cableCar, casanovaCocktail, caucasian, eastSide, greenpoint, trinidadSour, ultimaPalabra, ultimaPalabraLondon, whiteNegroni]
            
        case .williamsAndGrahamClassicCocktails:
            [airMailWnG, alaskaWnG, algonquinWnG, amarettoSourWnG, americanoWnG, betweenTheSheetsWnG, bambooWnG, bijouWnG, bloodAndSandWnG, bloodyMaryWnG, boulevardierWnG, brambleWng, brandyCrustaWnG, brownDerbyWnG, brooklynWnG, chocolateMartiniWnG, cloverClubWnG, elPresidenteWnG, fairAndWarmerWnG, fancyFreeWnG, fogCutterWnG, french75WnG, ginFizzWnG, grasshopperWnG, hankyPankyWnG, harveyWallbangerWnG, honeymoonCocktailWnG, hollandHouseCocktailWnG, hotToddyWnG, hotelNacionalWnG, hurricaneWnG, irishCoffeeWnG, japaneseCocktailWnG, jungleBirdWnG, kirRoyaleWnG, laLouisianeWnG, lastWordWnG, lemonDropWnG, maiTaiWnG, majorBaileyWnG, martinezWnG, mexicanFiringSquadWnG, mintJulepWnG, mojitoWnG, modernCocktailWnG, morningGloryFizzWnG, NewYorkSourWnG, oldFashionedWnG, oaxacaOldFashionedWnG, oldCubanWnG, oldPalWnG, painKillerWnG, piscoSourWnG, queensParkSwizzleWnG, rememberTheMaineWnG, RustyNailWnG, robRoyWnG, saturnWnG, sazeracWnG, scofflawWnG, sherryCobblerWnG, sidecarWnG, singaporeSlingWnG, sloeGinFizzWnG, stingerWnG, tiPunchWnG, tipperaryWnG, tomCollinsWnG, vesperWnG, zombieWnG]
            
        case .wngModern:
            [cableCarWnG, greenpointWnG, kentuckyMaidWnG, ultimaPalabraWnG, penicillinWnG]
            
        case .williamsAndGrahamOriginals:
            [aFlightSouthOfTheBorder, acquitYourQuest, aLightInTheDark, aloeForThatBurn, americanGothic, autumnRainbows, banhMi, beachBlanketBingo, beckyWithTheGoodHair, blackberrySageSmash, burisBovineBev, cardiC, cellarDoor, cleverGirl, coffeeAndCigs, corporateJargon, cominUpRoses, daveyCrocketsLocker, dontPanic, easternDiplomat, easyStreet, elChicicabra, elOchoRosado, endOfAnEmpire, falcoor, farewellRide, featheredHatFlipNo1, featheredHatFlipNo2, followTheCompass, giftHorse, girlyDrink, greatScott, greatWhiteBuffalo, happyAccidents, harvestMoon, heartOfGold, hereBeDragons, highlandLass, darkCorners, irishGoodbye, jaredLetosPrettyFace, jupiter, kingLouisDeathBed, kittenWithAWhip, machete, mostelyHarmless, netflixAndChill, nobodysPerfect, northernDuchess, laCoa, lavandulaRosa, longWayDown, lordReyesTheVIII, lordTouchingtonsDelight, lowBall, madusasFang, midnightInMichoacan, moneyPenny, nightVision, northmansConquest, oneNightInKyoto, paperPilot, peaksOfReykjavic, peanutButterFalcon, pineauNoir, pipeDream, redWedding, reyonVert, robMcKenna, richGirl, sagedOracle, secondSunrise, shameless, stagParty, shokunin, sloeWalker, slutDragon, smokingMonkey, somethingAboutPrague, somethingBitter, sunnySide, pourLenore, spanishRevival, stirredAndBoozy, switchbladeRomance, theGreatGazoo, TheRoastery, theRuralJuror, scottishInquisition, theTraveler, treadLightly, unusualSuspect, victoryLap, whatsYourFavorite, whereEaglesFly, williamsCross, yeen, zombie129]
            
        case .deathAndCoCocktails:
            [cropTop, divisionBell, finalWard, gilda, nakedAndFamous, silverMonk]
            
        case .milkAndHoney:
            [americanTrilogy, appleJackMnH, asburyParkSwizzle, bensonhurst, bicycleThief, binAndGitters, bottlerocket, cafeConLecheFlip, calvados75, cobbleHill, cosmonaut, croquePetraske, daiquiriMnH, daiquiriNo4MnH, debbieDont, deepBlueSea, dominicana, eastSideCocktail, eskimosKiss, fakerFace, fallbackCocktail, french75MnH, frescaPlatino, gabriella, ginAndIt, gingerCocktail, goldRush, gordonsBreakfast, gordonsCup, grapefruitCollins, harvestOldFashioned, hayesFizz, homeOnTheRangeMnH, holeInTheCup, houseGingerBeer, jFKHarris, kentuckyMaid, kTCollins, leftHand, maloneyParkSwizzle, mojitoMnH, nocheBuena, oaxacanite,  palmaFizz, paperPlane, penicillin, piscoSourMnH, queensParkMnH, queensParkLightMnH, regalAmburana, redHookCocktail, rossCollins, ryeHummingbirdDown, saladito, savoirFaire,  siGuey, silverFox, silverLining, southSideCocktail, springForward, streetAndFlynnSpecial, strawberryFix, sugarplum, suttersMill, tarzanCocktail, tattletale, temperanceGrapefruitCollins, temperanceIrishCoffee, tequilaEastSide, theBusiness, thirtyEightSpecial, theMedicinaLatina, theSeaPlane, theStark, theTieBinder, tooSoon, tritterCollins, tritterRickey, turnpike, uSSRussellPunch,  waterLily, weddingPunch]
        }
    }
}
