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
        VStack(alignment: .leading) {
            Text("\(viewModel.chosenCocktail.cocktailName)")
                .font(.title2)
                .foregroundStyle(.brandPrimaryGold)
                .bold()
            Text("Split into \(viewModel.numberOfContainers) containers")
                .font(.title3)
                .foregroundStyle(.secondary)
                .bold()
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
            .dynamicTypeSize(.large)
            Text("* At least 10% of the container's volume will be left empty for safe transportation.")
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.medium)
                .padding(10)
                .foregroundStyle(.blueTint)
            
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 9)
                        .bold()
                        .tint(.cyan)
                }
            }
            
            ToolbarItem(placement: .navigation) {
                Text("Split Batch")
                    .font(.largeTitle).bold()
            }
        }
        .task {
            viewModel.doSplitBatchMath()
        }
    }
    
}

#Preview {
    SplitBatchView()
        .environmentObject(CBCViewModel())
}

