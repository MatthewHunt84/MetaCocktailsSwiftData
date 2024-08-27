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
                     if !viewModel.unwantedSelections.contains(ingredient) {
                         if viewModel.umbrellaCategoryStrings.contains(ingredient) {
                             if let umbrellaSpirits = SpiritsUmbrellaCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                                 viewModel.unwantedSelections.removeAll(where: { umbrellaSpirits.subCategories.contains($0) })
                             }
                         }
                         if viewModel.baseCategoryStrings.contains(ingredient) {
                             if let baseSpirits = BaseCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                                 viewModel.unwantedSelections.removeAll(where: { baseSpirits.baseCategoryIngredients.contains($0) })
                             }
                         }
                         if viewModel.specialtyCategoryStrings.contains(ingredient) {
                             if let specialtySpirits = SpecialtyCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                                 viewModel.unwantedSelections.removeAll(where: { specialtySpirits.specialtyCategoryIngredients.contains($0) })
                             }
                         }
                         viewModel.unwantedSelections.append(ingredient)
                         if viewModel.preferredSelections.contains(ingredient) {
                             viewModel.preferredSelections.removeAll(where: {$0 == ingredient})
                             viewModel.preferredCount -= 1
                         }
                     } else {
                         viewModel.unwantedSelections.removeAll(where: {$0 == ingredient})
                     }
                     viewModel.updateCategoryIngredients()
                     viewModel.fillUnwantedCategoryArrays()
                     viewModel.currentComponentSearchName = ""
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
