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
        NavigationStack{
            Form {
                Text("Step \(viewModel.build.instructions.count + 1)")
                TextEditor(text: $textEditor)
                    .focused($keyboardFocused)
                    .padding(.horizontal)
                    .navigationTitle("Add a build step.")
            }
            Button {
                viewModel.build.instructions.append(Instruction(step: viewModel.build.instructions.count + 1, method: textEditor))
                isShowingBuildSheet = false
            } label: {
                Text("Add Step")
            }
            .buttonStyle(BlackNWhiteButton())

        }
        .task {
            keyboardFocused = true 
        }
        
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return AddBuildStepDetailView(viewModel: AddCocktailViewModel(), isShowingBuildSheet: .constant(true))
        .modelContainer(preview.container)
    
}
