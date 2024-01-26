//
//  CocktailMenuViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/25/24.
//

import SwiftUI

final class CocktailMenuViewModel: ObservableObject {
    var cocktail: Cocktail

    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        
    }
   
}
