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
                .foregroundStyle(viewModel.preferredSelections.contains(ingredient)  ? .brandPrimaryGreen : .white)
                .onTapGesture {
                    if !viewModel.preferredSelections.contains(ingredient) {
                        viewModel.shouldRepopulatePredicates = true
                        if viewModel.umbrellaCategoryStrings.contains(ingredient) {
                            if let umbrellaSpirits = SpiritsUmbrellaCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                                viewModel.preferredSelections.removeAll(where: { umbrellaSpirits.subCategories.contains($0) })
                            }
                        }
                        if viewModel.baseCategoryStrings.contains(ingredient) {
                            if let baseSpirits = BaseCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                                viewModel.preferredSelections.removeAll(where: { baseSpirits.baseCategoryIngredients.contains($0) })
                            }
                        }
                        if viewModel.specialtyCategoryStrings.contains(ingredient) {
                            if let specialtySpirits = SpecialtyCategory.allCases.first(where: { $0.rawValue == ingredient }) {
                                viewModel.preferredSelections.removeAll(where: { specialtySpirits.specialtyCategoryIngredients.contains($0) })
                            }
                        }
                        viewModel.preferredSelections.append(ingredient)
                        viewModel.preferredCount += 1
                        if viewModel.unwantedSelections.contains(ingredient){
                            viewModel.unwantedSelections.removeAll(where: {$0 == ingredient})
                        }
                    } else {
                        viewModel.preferredSelections.removeAll(where: {$0 == ingredient})
                        viewModel.preferredCount -= 1
                    }
                    viewModel.fillPreferredCategoryArrays()
                }
                .font(.system(size: 20))
            
            Image(systemName:viewModel.unwantedSelections.contains(ingredient)  ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                .foregroundStyle(viewModel.unwantedSelections.contains(ingredient)  ? .brandPrimaryRed : .white)
                .onTapGesture {
                    if !viewModel.unwantedSelections.contains(ingredient) {
                        viewModel.shouldRepopulatePredicates = true
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

