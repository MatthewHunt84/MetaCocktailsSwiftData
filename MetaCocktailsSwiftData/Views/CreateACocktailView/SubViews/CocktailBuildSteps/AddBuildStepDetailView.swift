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
    @FocusState private var keyboardFocused: Bool
    @Binding var isShowingBuildSheet: Bool
    
    var body: some View {
        
        VStack {

            Form {
                Section("Add a build step") {
                    Text("Step \(viewModel.build.instructions.count + 1)")
                    TextField("Add Step", text: $textEditor)
                        .focused($keyboardFocused)
                        .onChange(of: keyboardFocused) { oldValue, newValue in
                            guard !newValue else { return }
                            viewModel.build.instructions.append(Instruction(step: viewModel.build.instructions.count + 1, method: textEditor))
                            isShowingBuildSheet = false
                        }
                }
                
            }
            .scrollContentBackground(.hidden)
            .background(BlackGlassBackgroundView())
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        viewModel.build.instructions.append(Instruction(step: viewModel.build.instructions.count + 1, method: textEditor))
                        isShowingBuildSheet = false
                    } label: {
                        HStack {
                            Text("Add Step").font(.headline)
                            Image(systemName: "plus")
                        }
                        .foregroundStyle(textEditor != "" ? .brandPrimaryGold : .secondary)
                    }
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        keyboardFocused = false
                    }
                    .tint(Color.brandPrimaryGold)
                }
            }
        }
        .task {
            keyboardFocused = true
        }
    }
}

#Preview(traits: .sampleData) {
    AddBuildStepDetailView(viewModel: AddCocktailViewModel(), isShowingBuildSheet: .constant(true))
}
