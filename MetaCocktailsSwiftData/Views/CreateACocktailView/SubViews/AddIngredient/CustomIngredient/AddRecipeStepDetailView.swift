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
    @FocusState var keyboardFocused: Bool
    @Binding var isShowingBuildSheet: Bool
    
    var body: some View {
        VStack {
            List {
                Section("Add a recipe step") {
                    Text("Step \(viewModel.prepIngredientRecipe.count + 1)")
                    TextEditor(text: $textEditor)
                        .focused($keyboardFocused)
                        .frame(minHeight: 100)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                }
                HStack {
                    Spacer()
                    UniversalBlueButton(buttonText: "Add Recipe Step", image: Image(systemName:textEditor != "" ? "plus.circle.fill" : "plus")) {
                        viewModel.prepIngredientRecipe.append(Instruction(step: viewModel.prepIngredientRecipe.count + 1, method: textEditor))
                        isShowingBuildSheet = false
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
            keyboardFocused = true
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return AddRecipeStepDetailView(viewModel: AddCocktailViewModel(), isShowingBuildSheet: .constant(true))
        .modelContainer(preview.container)
}
