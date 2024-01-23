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
    @Published var cocktails: [Cocktail] = [adonis, airMail, aFlightSouthOfTheBorder, aloeForThatBurn, aperolSpritz, bamboo, beckyWithTheGoodHair, blackberrySageSmash, bloodAndSand, boulevardier, caipirinha, cloverClub, cominUpRoses,corpseReviver2, cosmopolitan, cropTop, daiquiri, divisionBell,elChicicabra, elPresidente, emerald, finalWard, french75, french75Cognac, giftHorse, gimlet, ginFizz, greatWhiteBuffalo, heartOfGold, hereBeDragons,jackRose, jaredLetosPrettyFace, jungleBird, lastWord, machete, manhattan, maiTai, margarita, margaritaTommys, martini, mintJulep, mojito, negroni, netflixAndChill, oldFashioned, paloma, piscoSour, paperPlane, peanutButterFalcon, penicillin, queensParkSwizzle, ramosGinFizz, redWedding, reyonVert, robRoy, saturn, sazerac, secondSunrise, sidecar, slutDragon, smokingMonkey, spanishRevival, sunnySide, tiPunch, trinidadSour, twentiethCenturyCocktail, ultimaPalabra, vieuxCarre,  whiskeySour, whiteNegroni]
    @Published var isShowingRecipeCard = false
    @Published var selectedCocktail: Cocktail?
    @Published var isShowingBuildOrderButton = false
    
    // TODO: Ready for swiftData
//    func addCocktailsToSwiftData() {
//        modelContext.insert(aperolSpritz)
//    }
}
