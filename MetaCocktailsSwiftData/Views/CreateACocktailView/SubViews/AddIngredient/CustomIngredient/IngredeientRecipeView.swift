//
//  IngredeientRecipeView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/3/24.
//

import SwiftUI

struct IngredeientRecipeView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @State private var isShowingBuildSheet: Bool = false
    var body: some View {
        Section(header: Text("Recipe (Optional)").font(FontFactory.sectionHeader12)) {
            List {
                Button{
                    isShowingBuildSheet = true
                } label: {
                    HStack {
                        Text("Add recipe step")
                            .foregroundStyle(.white)
                            .font(FontFactory.formLabel18)
                        
                        Spacer()
                        
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.blueTint)
                    }
                }
                .sheet(isPresented: $isShowingBuildSheet, content: {
                        AddRecipeStepDetailView(viewModel: viewModel, isShowingBuildSheet: $isShowingBuildSheet)
                        .presentationBackground(.clear)
                })
                ForEach(viewModel.prepIngredientRecipe, id: \.id) { buildStep in
                    VStack{
                        Text("Step \(buildStep.step)")
                            .font(FontFactory.formLabel18)
                            .foregroundStyle(.brandPrimaryGold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(buildStep.method)
                            .font(FontFactory.formLabel18)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .onDelete(perform: { indexSet in
                    viewModel.build.instructions.remove(atOffsets: indexSet)
                })
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return IngredeientRecipeView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
}
