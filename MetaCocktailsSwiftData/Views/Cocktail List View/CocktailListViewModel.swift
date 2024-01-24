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
    @Published var cocktails = collectAllCocktails().sorted(by: {$0.cocktailName < $1.cocktailName})
    @Published var isShowingRecipeCard = false
    @Published var selectedCocktail: Cocktail?
    @Published var isShowingBuildOrderButton = false
    
    static func collectAllCocktails() -> [Cocktail] {
        
        let classicCocktails: [Cocktail] = [adonis, airMail, alaska, amarettoSour, americano,  aperolSpritz, armyNavy, aviation, beesKnees, betweenTheSheets, bamboo, bijou,  bloodAndSand, bloodyMarry, blueBlazer, bobbyBurns, boulevardier, bramble, brandyAlexander, brandyCrusta, brownDerbyRum, brownDerbyBourbon, brooklyn, brunelle, caipirinha, carajillo, champsElysees, champagneCocktail, chocolateCocktail, chrysanthemum, cloverClub, cornNOil, corpseReviver1, corpseReviver2, cosmopolitan,  daiquiri, darkNStormy, deathInTheAfternoon, diamondBack, elDiablo,  elPresidente, emerald, french75, french75Cognac, gimlet, ginFizz, jackRose,  jungleBird, lastWord, manhattan, maiTai, margarita, margaritaTommys, martini, mintJulep, mojito, negroni, oldFashioned, paloma, piscoSour, queensParkSwizzle, ramosGinFizz, robRoy, saturn, sazerac, sidecar,  tiPunch, twentiethCenturyCocktail,  vieuxCarre,  whiskeySour]
        
        let deathAndCoCocktails: [Cocktail] = [cropTop, divisionBell, finalWard]
        
        let miscModernClassics: [Cocktail] = [blackManhattan, cableCar, caucasian, trinidadSour, ultimaPalabra, whiteNegroni, paperPlane, penicillin ]
        
        let williamsAndGrahamClassics: [Cocktail] = [airMailWnG, alaskaWnG, algonquinWnG,  amarettoSourWnG, americanoWnG, bambooWnG, betweenTheSheetsWnG, bijouWnG, bloodAndSandWnG, bloodyMarryWnG, boulevardierWnG, brandyCrustaWnG, brooklynWnG, brownDerbyWnG, cableCarWnG, cloverClubWnG, elPresidenteWnG, elksClubWnG, espressoMartiniWnG  ]
        
        let williamsAndGrahamModernCocktails: [Cocktail] = [aFlightSouthOfTheBorder, aloeForThatBurn, beckyWithTheGoodHair, blackberrySageSmash, brambleWng, chocolateMartiniWnG,  cominUpRoses, elChicicabra, giftHorse, greatWhiteBuffalo, heartOfGold, hereBeDragons, jaredLetosPrettyFace, machete, netflixAndChill, peanutButterFalcon, redWedding, reyonVert, secondSunrise, slutDragon, smokingMonkey, sunnySide,  spanishRevival]
        
        return classicCocktails + williamsAndGrahamClassics + deathAndCoCocktails + miscModernClassics + williamsAndGrahamModernCocktails
        
    }
    
    // TODO: Ready for swiftData
//    func addCocktailsToSwiftData() {
//        modelContext.insert(aperolSpritz)
//    }
}
