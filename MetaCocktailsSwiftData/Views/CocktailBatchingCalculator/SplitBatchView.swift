//
//  SplitBatchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/11/24.
//

import SwiftUI

struct SplitBatchView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    var body: some View {
        VStack {
            
            Text("Container Size: \(viewModel.containerSize)")
            Text("Number of Containers: \(viewModel.numberOfContainers)")
            Text("Batch Recipe Per Container:")
                .dynamicTypeSize(.xLarge).bold()
            List {
                ForEach($viewModel.quantifiedBatchedIngredients, id: \.self) { ingredient in
                    SplitBatchCell(quantifiedBatchedIngredient: ingredient)
                }
            }
            .listStyle(.plain)
            .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .stroke(.gray.gradient, lineWidth: 2))
            
        }
        .navigationTitle("Split Batch: \(viewModel.cocktailNameText)")
        
    }
        
}

#Preview {
    SplitBatchView()
        .environmentObject(CBCViewModel())
}
