//
//  IngredientRecipeView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/3/24.
//

import SwiftUI

struct CustomIngredientRecipeView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @State private var isShowingBuildSheet: Bool = false
    @FocusState var recipeKeyboardFocused: Bool
    @State private var editingInstruction: Bool = false
    
    var body: some View {
        Section(header: Text("Recipe (Optional)").font(FontFactory.sectionHeader12)) {
            List {
                Button{
                    isShowingBuildSheet = true
                } label: {
                    HStack {
                        Text("Add recipe step")
                            .foregroundStyle(.primary)
                            .font(FontFactory.formLabel18)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(ColorScheme.interactionTint)
                    }
                }
                .sheet(isPresented: $isShowingBuildSheet, content: {
                    AddRecipeStepDetailView(viewModel: viewModel, recipeKeyboardFocused: _recipeKeyboardFocused, isShowingBuildSheet: $isShowingBuildSheet, editingInstruction: $editingInstruction)
                })
                ForEach(viewModel.prepIngredientRecipe, id: \.id) { buildStep in
                    VStack{
                        Text("Step \(buildStep.step)")
                            .font(FontFactory.formLabel18)
                            .foregroundStyle(ColorScheme.interactionTint)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(buildStep.method)
                            .font(FontFactory.formLabel18)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .onTapGesture {
                        viewModel.populateBuildStepFor(instruction: buildStep)
                        editingInstruction.toggle()
                        isShowingBuildSheet = true
                    }
                }
                .onDelete(perform: { indexSet in
                    viewModel.build.instructions.remove(atOffsets: indexSet)
                    viewModel.reEnumeratePrepIngredientRecipe()
                })
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return CustomIngredientRecipeView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
}
