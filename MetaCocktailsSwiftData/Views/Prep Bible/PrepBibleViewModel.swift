//
//  PrepBibleViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI


final class PrepBibleViewModel: ObservableObject {
    
    @Published var prepIngredients: [Prep] = [cucumberSyrup, gingerSyrup, orgeat, richDem, grapefruitShrub, peanutButterVodka, morgenthalersGingerSyrup].sorted(by: {$0.prepIngredientName < $1.prepIngredientName})
    
    
}
