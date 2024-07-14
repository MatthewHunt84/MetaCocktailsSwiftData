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
    var body: some View {
        List {
            Button{
                isShowingBuildSheet = true
            } label: {
                HStack {
                    Text("Add build step")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.brandPrimaryGold)
                }
            }
            .sheet(isPresented: $isShowingBuildSheet, content: {

                    AddBuildStepDetailView(viewModel: viewModel, isShowingBuildSheet: $isShowingBuildSheet)
                    .presentationBackground(.clear)
            })
            
            ForEach(viewModel.build.instructions, id: \.id) { buildStep in
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
    
    return AddBuildStepView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
    
}
