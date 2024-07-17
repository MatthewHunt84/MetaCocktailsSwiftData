//
//  PreferencesThumbsCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI

struct PreferencesThumbsCell: View {
   
    @Bindable var viewModel: SearchViewModel
    @Binding var ingredient: IngredientBase
    
    var body: some View {
        HStack{
            Text(ingredient.name)
            Spacer()
            Image(systemName:viewModel.preferredIngredients.contains(ingredient.name) ? "hand.thumbsup.fill" : "hand.thumbsup")
                .foregroundStyle(viewModel.preferredIngredients.contains(ingredient.name) ? .brandPrimaryGreen : .white)
                .onTapGesture {
                    if !viewModel.preferredIngredients.contains(ingredient.name) {
                        viewModel.preferredIngredients.append(ingredient.name)
                        viewModel.preferredCount += 1
                        if viewModel.unwantedIngredients.contains(ingredient.name){
                            viewModel.unwantedIngredients.removeAll(where: {$0 == ingredient.name})
                        }
                    } else {
                        viewModel.preferredIngredients.removeAll(where: {$0 == ingredient.name})
                        viewModel.preferredCount -= 1
                    }
                }
                .font(.system(size: 20))
            Image(systemName:viewModel.unwantedIngredients.contains(ingredient.name) ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                .foregroundStyle(viewModel.unwantedIngredients.contains(ingredient.name) ? .brandPrimaryRed : .white)
                .onTapGesture {
                    if !viewModel.unwantedIngredients.contains(ingredient.name) {
                        viewModel.unwantedIngredients.append(ingredient.name)
                        if viewModel.preferredIngredients.contains(ingredient.name) {
                            viewModel.preferredIngredients.removeAll(where: {$0 == ingredient.name})
                            viewModel.preferredCount -= 1
                        }
                    } else {
                        viewModel.unwantedIngredients.removeAll(where: {$0 == ingredient.name})
                    }
                }
                .padding(.horizontal, 10)
                .font(.system(size: 20))
        }
    }
}

#Preview {
    @Previewable @State var mockIngredient = IngredientBase(name: "Test", category: Category.agaves, prep: nil)
    PreferencesThumbsCell(viewModel: SearchViewModel(), ingredient: $mockIngredient)
}
