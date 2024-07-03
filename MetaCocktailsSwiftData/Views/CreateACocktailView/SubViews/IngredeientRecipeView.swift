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
        List {
            Button{
                isShowingBuildSheet = true
            } label: {
                HStack {
                    Text("Add recipe step")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.brandPrimaryGold)
                }
            }
            .sheet(isPresented: $isShowingBuildSheet, content: {
                ZStack{
                    Color.black.ignoresSafeArea()
                    AddRecipeStepDetailView(viewModel: viewModel, isShowingBuildSheet: $isShowingBuildSheet)
                        .backgroundStyle(.black)
                }
            })
            ForEach(viewModel.prepIngredientRecipe, id: \.id) { buildStep in
                VStack{
                    Text("Step \(buildStep.step)")
                        .foregroundStyle(.brandPrimaryGold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(buildStep.method)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .onDelete(perform: { indexSet in
                viewModel.build.instructions.remove(atOffsets: indexSet)
            })
            
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return IngredeientRecipeView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
}
