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
    @Binding var willEditBuildStep: Bool
    
    var body: some View {
        
        VStack {
            
            List {
                Section("Add a build step") {
                    Text(willEditBuildStep ? "\(viewModel.currentBuildStep)" : "Step \(viewModel.build.instructions.count + 1)")
                        .foregroundStyle(Color.secondary)
                        .font(FontFactory.formLabel18)
                    TextEditor(text: $textEditor)
                        .font(FontFactory.formLabel18)
                        .focused($cocktailBuildStepKeyboardFocused)
                        .frame(minHeight: 100)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                }
                
                UniversalBlueButton(buttonText: "Add Recipe Step", rightImage: Image(systemName: "plus"), includeBorder: true) {
                    if willEditBuildStep {
                        viewModel.updateBuildInstruction(id: viewModel.currentBuildInstructionUUID, newMethod: textEditor)
                        isShowingBuildSheet = false
                        
                    } else {
                        viewModel.build.instructions.append(Instruction(step: viewModel.build.instructions.count + 1, method: textEditor))
                        isShowingBuildSheet = false
                    }
                }
                .foregroundStyle(textEditor != "" ? Color.secondary : ColorScheme.interactionTint)
                .listRowBackground(Color.clear)
                .disabled(textEditor == "" ? true : false)
                
            }
            .scrollContentBackground(.hidden)
            .background(BlackGlassBackgroundView())
            
        }
        .onAppear {
            if willEditBuildStep {
                textEditor = viewModel.currentMethod
            }
            cocktailBuildStepKeyboardFocused = true
        }
        
    }
}

#Preview(traits: .sampleData) {
    @FocusState var cocktailBuildStepKeyboardFocused: Bool
    AddBuildStepDetailView(viewModel: AddCocktailViewModel(), cocktailBuildStepKeyboardFocused: _cocktailBuildStepKeyboardFocused, isShowingBuildSheet: .constant(true), willEditBuildStep: .constant(true))
}
