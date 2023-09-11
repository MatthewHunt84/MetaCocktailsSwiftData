//
//  Cocktail.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

struct MockData: Identifiable {
    @EnvironmentObject var criteria: SearchCriteriaViewModel
    var id: ObjectIdentifier
    
    @State static var mockIngredient: CocktailComponent = CocktailComponent(name: "Mock Ingredient")
    
    
    
  
    
}
