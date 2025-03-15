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
                if !editingInstruction {
                    UniversalButton(buttonText: "Add Recipe Step", rightImage: Image(systemName:"plus"), includeBorder: true) {
                        viewModel.prepIngredientRecipe.append(Instruction(step: viewModel.prepIngredientRecipe.count + 1, method: textEditor))
                        textEditor = ""
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .padding(.bottom, 15)
                    .disabled(textEditor == "" ? true : false)
                    .foregroundStyle(textEditor != "" ? Color.secondary : ColorScheme.interactionTint)
                }
                UniversalButton(buttonText: "Save and Exit", includeBorder: true) {
                    
                    if editingInstruction {
                        if textEditor != "" {
                            viewModel.updatePrepIngredientRecipe(id: viewModel.currentBuildInstructionUUID, newMethod: textEditor)
                            isShowingBuildSheet = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                editingInstruction = false
                            }
                            
                        }
                    } else {
                        if textEditor != "" {
                            viewModel.prepIngredientRecipe.append(Instruction(step: viewModel.prepIngredientRecipe.count + 1, method: textEditor))
                        }
                        isShowingBuildSheet = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            editingInstruction = false
                        }
                    }
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
    
    AddRecipeStepDetailView(viewModel: AddCocktailViewModel(), recipeKeyboardFocused: _keyboardFocused, isShowingBuildSheet: .constant(true), editingInstruction: .constant(false))
        .modelContainer(preview.container)
}
