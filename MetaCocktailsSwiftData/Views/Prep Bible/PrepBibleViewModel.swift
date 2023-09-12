//
//  PrepBibleViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI


final class PrepBibleViewModel: ObservableObject {
    
    @Published var isShowingPrepRecipe = false
    @Published var prepIngredients: [Prep] = [PrepItemRecipe.cucumberSyrup, PrepItemRecipe.gingerSyrup, PrepItemRecipe.orgeat, PrepItemRecipe.richDem]
    @Published var selectedPrepIngredient: Prep?
    
    
}
