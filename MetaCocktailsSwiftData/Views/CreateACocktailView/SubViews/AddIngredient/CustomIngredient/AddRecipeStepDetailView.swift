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
    @FocusState.Binding var keyboardFocused: Bool
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
                        .focused($keyboardFocused)
                        .frame(minHeight: 100)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                }
                HStack {
                    Spacer()
                    UniversalBlueButton(buttonText: "Add Recipe Step", image: Image(systemName:textEditor != "" ? "plus.circle.fill" : "plus")) {
                        if editingInstruction {
                            viewModel.updatePrepIngredientRecipe(id: viewModel.currentBuildInstructionUUID, newMethod: textEditor)
                        } else {
                            viewModel.prepIngredientRecipe.append(Instruction(step: viewModel.prepIngredientRecipe.count + 1, method: textEditor))
                        }
                        isShowingBuildSheet = false
                        editingInstruction = false
                        
                    
                    }
                    Spacer()
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
            keyboardFocused = true
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    @FocusState var keyboardFocused: Bool
    
    AddRecipeStepDetailView(viewModel: AddCocktailViewModel(), keyboardFocused: $keyboardFocused, isShowingBuildSheet: .constant(true), editingInstruction: .constant(true))
        .modelContainer(preview.container)
}
