//
//  PreferencesLimitedThumbCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/4/24.
//

import SwiftUI

struct PreferencesIncludedLimitedThumbCell: View {
    
     @EnvironmentObject var viewModel: SearchViewModel
     @Binding var ingredient: String
     
     var body: some View {
         HStack{
             
             Text(ingredient)
             
             Spacer()
             
             Text("Included")
                 .font(.caption)
                 .foregroundStyle(!viewModel.unwantedIngredients.contains(ingredient) ? .brandPrimaryGreen : .black)
             
             Image(systemName:viewModel.unwantedIngredients.contains(ingredient)  ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                 .foregroundStyle(viewModel.unwantedIngredients.contains(ingredient)  ? .brandPrimaryRed : .white)
                 .onTapGesture {
                     if !viewModel.unwantedIngredients.contains(ingredient) {
                         viewModel.unwantedIngredients.append(ingredient)
                         if viewModel.preferredIngredients.contains(ingredient) {
                             viewModel.preferredIngredients.removeAll(where: {$0 == ingredient})
                             viewModel.preferredCount -= 1
                         }
                     } else {
                         viewModel.unwantedIngredients.removeAll(where: {$0 == ingredient})
                     }
                     viewModel.fillUnwantedCategoryArrays()
                     
                 }
                 .padding(.horizontal, 10)
                 .font(.system(size: 20))
         }
     }
}

#Preview {
    @Previewable @State var mockIngredient = "Fun Ingredient"
    PreferencesIncludedLimitedThumbCell(ingredient: $mockIngredient)
        .environmentObject(SearchViewModel())
}
