//
//  CocktailListViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import Observation

@Observable final class CocktailListViewModel{
    
    var cocktialListSearchText: String = ""
    var cocktailCollection: CocktailCollection = .all
    var isShowingAllCocktails: Bool = false 
    var cocktailListAlphabet = [sfSymbolForCustomCocktails, "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    static var sfSymbolForCustomCocktails = "star.fill"
    var isShowingOriginalCocktailInfo: Bool = false 
    var originalSpecExplanation = "These recipes serve primarily as points of reference. Understanding the historical roots of contemporary cocktail variations is paramount, hence we present the earliest documented iterations of these cocktails that remain relevant to present-day recipes. Many of these formulas originate from vintage cocktail tomes and archived newspaper articles. It's worth noting that a great number these recipes lack balance with contemporary taste preferences."
    
  
}







