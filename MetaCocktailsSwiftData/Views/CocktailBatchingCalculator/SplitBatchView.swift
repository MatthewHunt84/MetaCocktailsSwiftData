//
//  SplitBatchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/11/24.
//

import SwiftUI

struct SplitBatchView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack{
            
            MeshGradients.meshBlueRibbonBackground.ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center) {
                    Text("\(viewModel.chosenCocktail.cocktailName)")
                        .font(.title2)
                        .foregroundStyle(.softWhite)
                        .bold()
                    Text("Split into \(viewModel.numberOfContainers) containers")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .bold()
                }
                .padding(.bottom, 25)
                
                HStack {
                    Text("Container Size: ")
                    ContainerMenuView()
                    Spacer()
                }
                
                HStack {
                    Text("Batch Recipe Per Container:")
                    Spacer()
                }
                
                List {
                    ForEach($viewModel.splitBatchData, id: \.self) { ingredient in
                        SplitBatchCell(quantifiedSpiltBatches: ingredient)
                    }
                }
                .scrollContentBackground(.hidden)
                .listRowBackground(Color.clear)
                
                Text("* At least 10% of the container's volume will be left empty for safe transportation.")
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.medium)
                    .padding(10)
                    .foregroundStyle(.blueTint)
                
            }
            .padding()
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .goldHeaderWithNavigation(title: "Split Batch", dismiss: dismiss)
            .task {
                viewModel.doSplitBatchMath()
            }
        }
    }
    
}

#Preview {
    SplitBatchView()
        .environmentObject(CBCViewModel())
}

