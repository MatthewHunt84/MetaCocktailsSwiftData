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
    case houseCocktails
    
    var cocktails: [Cocktail] {
        switch self {
        case .classicCocktails:
            [adonis, airMail, alaska, alexanderCocktail, alexandre, algonquin, amarettoSour, americano, aperolSpritz, appleJackCocktail, armyNavy, aviation, beesKnees, betweenTheSheets, bamboo, bijou, bloodAndSand, bloodyMary, blueBlazer, bobbyBurns, boulevardier, bramble, brandyAlexander, brandyCrusta, brownDerbyRum, brownDerbyBourbon, brooklyn, brunelle, bizzyIzzyHighball, caipirinha, carajillo, champsElysees, champagneCocktail, chocolateCocktail, chrysanthemum, cloverClub, cornNOil, corpseReviver1, corpseReviver2, cosmopolitan, daiquiri, daiquiriNo4OG, darkNStormy, deathInTheAfternoon, diamondBack, elDiablo, elksOwnCocktail, elPresidente, emerald, espressoMartiniOG, fairAndWarmer, fancyFree, fogCutter, french75Cognac, ginRickey, gimletMcElhone, ginFizz, silverGinFizz, grasshopper, hankyPanky, harveyWallbanger, hemingwayDaiquiri, papaDobleWnG, homeOnTheRange, honeymoonCocktail1st, honeymoonCocktailEmbury, hollandHouseKappeler, hollandHouseCocktail, hotBrandyToddy, morgenthalersToddy, hotelNacional, hurricane, irishCoffee, jackRose, japaneseCocktail, jungleBird, kirRoyale, laLouisiane, lastWord, lemonDrop, lionsTail, manhattan, maiTai, majorBailey, margarita, margaritaTommys, martinez, martinezWnG, martini, gibson, mexicanFiringSquad, mezcalero, mintJulep, mojito, modernCocktail, morningGloryFizz, moscowMule, negroni, NewYorkSour, oldFashioned, oldCuban, oldPal, painKiller, paloma, peguClub, peguClubSavoy, pimmsCup, pinaColada, pinkLady, piscoSour, princeEdwardOG, queensParkSwizzle, ramosGinFizz, ramonaFlowers, rememberTheMaine, robRoy, rustyNail, saturn, sazerac, scofflaw, sherryCobbler, sidecar, singaporeSling, sloeGinFizz, southSideFizz, stinger, talentScout, tiPunch, tipperary, tipperaryDR, tomCollins, toronto, twentiethCenturyCocktail, vesper, vieuxCarre, wardEight, whiskeySmash, whiskeySourOG, zombie]
            
        case .modernCocktails:
            [blackManhattan, cableCar, casanovaCocktail, caucasian, eastSide, greenpoint, jasmine, prizefighterNo1, trinidadSour, ultimaPalabraLondon, whiteLinen, whiteNegroni, skyRocket, brancolada]
            
        case .williamsAndGrahamClassicCocktails:
            [airMailWnG, alaskaWnG, algonquinWnG, amarettoSourWnG, americanoWnG, betweenTheSheetsWnG, bambooWnG, bijouWnG, bloodAndSandWnG, boulevardierWnG, brandyAlexanderWnG, brambleWng, brandyCrustaWnG, brownDerbyWnG, brooklynWnG, chocolateMartiniWnG, chocolateCocktailWnG, cloverClubWnG, elksClubWnG, elDiabloWnG, elPresidenteWnG, espressoMartiniWnG, fairAndWarmerWnG, fancyFreeWnG, fogCutterWnG, french75WnG, ginFizzWnG, grasshopperWnG, honeymoonCocktailWnG, hollandHouseCocktailWnG, hotToddyWnG, hotelNacionalWnG, hurricaneWnG, irishCoffeeWnG, japaneseCocktailWnG, jungleBirdWnG, kirRoyaleWnG, laLouisianeWnG, lastWordWnG, lemonDropWnG, maiTaiWnG, majorBaileyWnG, martinezWnG, mintJulepWnG, mojitoWnG, modernCocktailWnG, morningGloryFizzWnG, NewYorkSourWnG, oldFashionedWnG, oldCubanWnG, oldPalWnG, painKillerWnG, piscoSourWnG, princeEdward, queensParkSwizzleWnG, rememberTheMaineWnG, RustyNailWnG, robRoyWnG, saturnWnG, sazeracWnG, scofflawWnG, sherryCobblerWnG, sidecarWnG, singaporeSlingWnG, sloeGinFizzWnG, tiPunchWnG, tipperaryWnG, tomCollinsWnG, vesperWnG, whiskeySourWnG, zombieWnG]
            
        case .wngModern:
            [cableCarWnG, ultimaPalabraWnG]
            
        case .williamsAndGrahamOriginals:
            [aFlightSouthOfTheBorder, aWholeNewWorld, acquitYourQuest, aLightInTheDark, aloeForThatBurn, americanGothic, autumnRainbows, banhMi, beachBlanketBingo, beckyWithTheGoodHair, blackberrySageSmash, cardiC, cellarDoor, cleverGirl, coffeeAndCigs, corporateJargon, cominUpRoses, daveyCrocketsLocker, dayMan, dontPanic, easternDiplomat, easyStreet, elChicicabra, elGeneralisimo, endOfAnEmpire, falcoor, farewellRide, featheredHatFlipNo1, featheredHatFlipNo2, followTheCompass, girlyDrink, greatScott, greatWhiteBuffalo, happyAccidents, heartOfGold, hereBeDragons, highlandLass, darkCorners, irishGoodbye, jaredLetosPrettyFace, jupiter, kingLouisDeathBed, kittenWithAWhip, machete, mostelyHarmless, nobodysPerfect, northernDuchess, laCoa, lavandulaRosa, longWayDown, lordReyesTheVIII, lordTouchingtonsDelight, medusasFang, midnightInMichoacan, moneyPenny, nightVision, northmansConquest, oneNightInKyoto, paperPilot, peaksOfReykjavic, peanutButterFalcon, pipeDream, redWedding, reyonVert, robMcKenna, richGirl, sagedOracle, secondSunrise, shameless, stagParty, shokunin, sloeWalker, slutDragon, smokingMonkey, somethingAboutPrague, somethingBitter, sunnySide, pourLenore, spanishRevival, stirredAndBoozy, switchbladeRomance, theGreatGazoo, TheRoastery, theRuralJuror, scottishInquisition, theTraveler, treadLightly, unusualSuspect, victoryLap, whatsYourFavorite, whereEaglesFly, williamsCross, yeen, zombie129]
            
        case .deathAndCoCocktails:
            [alabaster, conference, cropTop, divisionBell, finalWard, fourInHand, gilda, nakedAndFamous, oaxacaOldFashioned, pinaColadaDeathAndCo, starfishAndCoffee, silverMonk]
            
        case .milkAndHoney:
            [americanTrilogy, appleJackMnH, asburyParkSwizzle, bensonhurst, bicycleThief, binAndGitters, bottlerocket, cafeConLecheFlip, calvados75, cobbleHill, cosmonaut, daiquiriMnH, daiquiriNo4MnH, debbieDont, deepBlueSea, dominicana, eastSideCocktail, eskimosKiss, fakerFace, fallbackCocktail, french75MnH, frescaPlatino, gabriella, ginAndIt, gingerCocktail, goldRush, gordonsBreakfast, gordonsCup, grapefruitCollins, harvestOldFashioned, hayesFizz, homeOnTheRangeMnH, holeInTheCup, houseGingerBeer, jFKHarris, kentuckyMaid, kTCollins, leftHand, maloneyParkSwizzle, mojitoMnH, nocheBuena, oaxacanite,  palmaFizz, paperPlane, penicillin, piscoSourMnH, queensParkMnH, queensParkLightMnH, regalAmburana, redHookCocktail, rossCollins, ryeHummingbirdDown, saladito, savoirFaire,  siGuey, silverFox, silverLining, southSideCocktail, springForward, streetAndFlynnSpecial, strawberryFix, sugarplum, suttersMill, tarzanCocktail, tattletale, temperanceGrapefruitCollins, temperanceIrishCoffee, tequilaEastSide, theBusiness, thirtyEightSpecial, theMedicinaLatina, theSeaPlane, theStark, theTieBinder, tooSoon, tritterCollins, tritterRickey, turnpike,  waterLily, migration]
            
        case .houseCocktails:
            [houseBramble, houseBetweenTheSheets, houseBobbyBurns, houseSilverGinFizz, houseMexicanFiringSquad, houseGimlet]
        }
    }
}
