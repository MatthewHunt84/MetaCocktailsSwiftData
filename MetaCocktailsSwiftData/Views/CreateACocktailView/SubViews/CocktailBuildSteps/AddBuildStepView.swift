//
//  AddBuildStepView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI

struct AddBuildStepView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @State private var isShowingBuildSheet: Bool = false
    @FocusState var cocktailBuildStepKeyboardFocused: Bool
    @State private var willEditBuildStep: Bool = false
    var body: some View {
        List {
            Button{
                isShowingBuildSheet = true
            } label: {
                HStack {
                    Text("Add build step")
                        .foregroundStyle(.primary)
                        .font(FontFactory.formLabel18)
                        .tint(.white)
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(ColorScheme.interactionTint)
                }
            }
            .sheet(isPresented: $isShowingBuildSheet, content: {
                AddBuildStepDetailView(viewModel: viewModel, cocktailBuildStepKeyboardFocused: _cocktailBuildStepKeyboardFocused, isShowingBuildSheet: $isShowingBuildSheet, willEditBuildStep: $willEditBuildStep)
            })
            
            ForEach(viewModel.build.instructions, id: \.id) { buildStep in
                VStack{
                    Text("Step \(buildStep.step)")
                        .foregroundStyle(ColorScheme.interactionTint)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(buildStep.method)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    viewModel.populateBuildStepFor(instruction: buildStep)
                    willEditBuildStep = true
                    isShowingBuildSheet.toggle()
                }
            }
            .onDelete(perform: { indexSet in
                viewModel.build.instructions.remove(atOffsets: indexSet)
                viewModel.reEnumerateBuildSteps()
            })
            
        }
    }
}
#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    @FocusState var cocktailBuildStepKeyboardFocused: Bool
    AddBuildStepView(viewModel: AddCocktailViewModel(), cocktailBuildStepKeyboardFocused: _cocktailBuildStepKeyboardFocused)
        .modelContainer(preview.container)
    
}
