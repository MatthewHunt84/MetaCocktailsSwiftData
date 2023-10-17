//
//  CocktailListViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

final class CocktailListViewModel: ObservableObject {

    static let shared = CocktailListViewModel()
    
    @Published var cocktails: [Cocktail] = [aperolSpritz, bamboo, blackberrySageSmash, caipirinha, cosmopolitan, daiquiri, elPresidente, french75, french75Cognac, ginFizz, jungleBird, negroni, paperPlane, penicillin, queensParkSwizzle, ramosGinFizz, trinidadSour]
    @Published var isShowingRecipeCard = false
    @Published var selectedCocktail: Cocktail?
    @Published var isShowingBuildOrderButton = false
}
