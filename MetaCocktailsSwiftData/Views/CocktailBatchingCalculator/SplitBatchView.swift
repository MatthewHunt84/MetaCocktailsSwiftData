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
            
            HStack{
                Text("Container Size: ")
                ContainerMenuView()
                Spacer()
            }
            HStack{
                Text("Batch Recipe Per Container:")
                Spacer()
            }
            
            List {
                ForEach($viewModel.splitBatchData, id: \.self) { ingredient in
                    SplitBatchCell(quantifiedSpiltBatches: ingredient)
                }
            }
            .listStyle(.plain)
//            .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
//                .stroke(.gray.gradient, lineWidth: 2))
            Text("Number of Containers: \(viewModel.numberOfContainers)")
                .dynamicTypeSize(.large)
            Text("* At least 10% of the container's volume will be left empty for safe transportation.")
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.medium)
                .padding(10)
                .foregroundStyle(.blueTint)
            
        }
        .navigationTitle("Split Batch: \(viewModel.cocktailNameText)")
        .task {
            viewModel.doSplitBatchMath()
        }
    }
        
}

#Preview {
    SplitBatchView()
        .environmentObject(CBCViewModel())
}

