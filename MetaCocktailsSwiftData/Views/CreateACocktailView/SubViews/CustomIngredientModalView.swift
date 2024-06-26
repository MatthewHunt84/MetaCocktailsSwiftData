//
//  CustomIngredientModalView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 6/23/24.
//

import SwiftUI

struct CustomIngredientModalView: View {
    @State var ingredientName = ""
    @State var ingredientType: IngredientType = .customIngredients(.customIngredient)
   
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomIngredientModalView()
}
