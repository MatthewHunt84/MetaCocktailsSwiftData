//
//  CocktailListViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

final class CocktailListViewModel: ObservableObject {

    static let shared = CocktailListViewModel()
    
    @Published var cocktails: [Cocktail] = [aperolSpritz, bamboo, beckyWithTheGoodHair, blackberrySageSmash, boulevardier, caipirinha, cloverClub, cominUpRoses, cosmopolitan, cropTop, daiquiri, divisionBell, elPresidente, emerald, finalWard, french75, french75Cognac, ginFizz, jungleBird, lastWord, manhattan, maiTai, margarita, margaritaTommys, martini, mintJulep, mojito, negroni, paloma, piscoSour, paperPlane, penicillin, queensParkSwizzle, ramosGinFizz, robRoy, saturn, sazerac, trinidadSour, twentiethCenturyCocktail, ultimaPalabra, whiskeySour, whiteNegroni]
    @Published var isShowingRecipeCard = false
    @Published var selectedCocktail: Cocktail?
    @Published var isShowingBuildOrderButton = false
}
