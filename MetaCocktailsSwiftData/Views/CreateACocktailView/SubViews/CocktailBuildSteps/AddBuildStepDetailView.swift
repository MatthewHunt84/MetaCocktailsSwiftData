//
//  AddBuildStepView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI

struct AddBuildStepDetailView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @State private var textEditor = ""
    @FocusState var cocktailBuildStepKeyboardFocused: Bool
    @Binding var isShowingBuildSheet: Bool
    
    var body: some View {
        
        VStack {
            
            List {
                Section("Add a build step") {
                    Text("Step \(viewModel.build.instructions.count + 1)")
                        .foregroundStyle(Color.secondary)
                    TextEditor(text: $textEditor)
                        .focused($cocktailBuildStepKeyboardFocused)
                        .frame(minHeight: 100)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                }
                HStack {
                    Spacer()
                    UniversalBlueButton(buttonText: "Add Recipe Step", image: Image(systemName: "plus")) {
                        viewModel.build.instructions.append(Instruction(step: viewModel.build.instructions.count + 1, method: textEditor))
                        isShowingBuildSheet = false
                    }
                    .foregroundStyle(textEditor != "" ? Color.secondary : ColorScheme.interactionTint)
                    Spacer()
                }
                .listRowBackground(Color.clear)
                .disabled(textEditor == "" ? true : false)
                
            }
            .scrollContentBackground(.hidden)
            .background(BlackGlassBackgroundView())
            
        }
        .onAppear {
            cocktailBuildStepKeyboardFocused = true
        }
        
    }
}

#Preview(traits: .sampleData) {
    @FocusState var cocktailBuildStepKeyboardFocused: Bool
    AddBuildStepDetailView(viewModel: AddCocktailViewModel(), cocktailBuildStepKeyboardFocused: _cocktailBuildStepKeyboardFocused, isShowingBuildSheet: .constant(true))
}
