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
                 .foregroundStyle(!viewModel.unwantedSelections.contains(ingredient) ? Color.secondary : .clear)
             
             Image(systemName:viewModel.unwantedSelections.contains(ingredient)  ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                 .foregroundStyle(viewModel.unwantedSelections.contains(ingredient)  ? MeshGradients.redMesh : MeshGradients.whiteMesh)
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
    PreferencesIncludedLimitedThumbCell(ingredient: $mockIngredient)
        .environmentObject(SearchViewModel())
}
