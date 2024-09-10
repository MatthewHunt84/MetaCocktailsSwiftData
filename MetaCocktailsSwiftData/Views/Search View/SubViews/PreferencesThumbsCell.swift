//
//  PreferencesThumbsCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI

struct PreferencesThumbsCell: View {
   
    @EnvironmentObject var viewModel: SearchViewModel
    @Binding var ingredient: String
    
    var body: some View {
        HStack{
            
            Text(ingredient)
            
            Spacer()
            
            Image(systemName:viewModel.preferredSelections.contains(ingredient)  ? "hand.thumbsup.fill" : "hand.thumbsup")
                .foregroundStyle(viewModel.preferredSelections.contains(ingredient)  ? ColorScheme.selectedColor: .white)
                .onTapGesture {
                    viewModel.handleThumbsUp(ingredient: ingredient)
                }
                .font(.system(size: 20))
            
            Image(systemName:viewModel.unwantedSelections.contains(ingredient)  ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                .foregroundStyle(viewModel.unwantedSelections.contains(ingredient)  ? ColorScheme.unwantedColor : .white)
                .onTapGesture {
                    viewModel.handleThumbsDown(ingredient: ingredient)
                }
                .padding(.horizontal, 10)
                .font(.system(size: 20))
        }
    }
}

#Preview {
    @Previewable @State var mockIngredient = "Fun Ingredient"
    PreferencesThumbsCell(ingredient: $mockIngredient)
        .environmentObject(SearchViewModel())
}


