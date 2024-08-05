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
            
            Image(systemName:viewModel.preferredIngredients.contains(ingredient)  ? "hand.thumbsup.fill" : "hand.thumbsup")
                .foregroundStyle(viewModel.preferredIngredients.contains(ingredient)  ? .brandPrimaryGreen : .white)
                .onTapGesture {
                    if !viewModel.preferredIngredients.contains(ingredient) {
                        if viewModel.umbrellaCategoryStrings.contains(ingredient) {
                            if let umbrellaSpirits = SpiritsUmbrellaCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                                viewModel.preferredIngredients.removeAll(where: { umbrellaSpirits.subCategories.contains($0) })
                            }
                        }
                        if viewModel.baseCategoryStrings.contains(ingredient) {
                            if let baseSpirits = BaseCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                                viewModel.preferredIngredients.removeAll(where: { baseSpirits.baseCategoryIngredients.contains($0) })
                            }
                        }
                        if viewModel.specialtyCategoryStrings.contains(ingredient) {
                            if let specialtySpirits = SpecialtyCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                                viewModel.preferredIngredients.removeAll(where: { specialtySpirits.specialtyCategoryIngredients.contains($0) })
                            }
                        }
                        viewModel.preferredIngredients.append(ingredient)
                        viewModel.preferredCount += 1
                        if viewModel.unwantedIngredients.contains(ingredient){
                            viewModel.unwantedIngredients.removeAll(where: {$0 == ingredient})
                        }
                    } else {
                        viewModel.preferredIngredients.removeAll(where: {$0 == ingredient})
                        viewModel.preferredCount -= 1
                    }
                    viewModel.fillPreferredCategoryArrays()
                }
                .font(.system(size: 20))
            
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
    PreferencesThumbsCell(ingredient: $mockIngredient)
        .environmentObject(SearchViewModel())
}

