//
//  AddRecipeStepDetailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/3/24.
//

import SwiftUI

struct AddRecipeStepDetailView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @State private var textEditor = ""
    @FocusState var recipeKeyboardFocused: Bool
    @Binding var isShowingBuildSheet: Bool
    @Binding var editingInstruction: Bool 
    
    var body: some View {
        VStack {
            List {
                Section("Add a recipe step") {
                    Text(editingInstruction ? "\(viewModel.currentBuildStep)" : "Step \(viewModel.prepIngredientRecipe.count + 1)")
                        .font(FontFactory.formLabel18)
                    TextEditor(text: $textEditor)
                        .font(FontFactory.formLabel18)
                        .focused($recipeKeyboardFocused)
                        .frame(minHeight: 100)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                }
                UniversalBlueButton(buttonText: "Add Recipe Step", rightImage: Image(systemName:textEditor != "" ? "plus.circle.fill" : "plus"), leftImage: nil, includeBorder: true) {
                    if editingInstruction {
                        viewModel.updatePrepIngredientRecipe(id: viewModel.currentBuildInstructionUUID, newMethod: textEditor)
                    } else {
                        viewModel.prepIngredientRecipe.append(Instruction(step: viewModel.prepIngredientRecipe.count + 1, method: textEditor))
                    }
                    isShowingBuildSheet = false
                    editingInstruction = false
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .background(BlackGlassBackgroundView())
            Spacer()
        }
        .task {
            if editingInstruction {
                textEditor = viewModel.currentMethod
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                recipeKeyboardFocused = true
            }
            
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    @FocusState var keyboardFocused: Bool
    
    AddRecipeStepDetailView(viewModel: AddCocktailViewModel(), recipeKeyboardFocused: _keyboardFocused, isShowingBuildSheet: .constant(true), editingInstruction: .constant(true))
        .modelContainer(preview.container)
}
