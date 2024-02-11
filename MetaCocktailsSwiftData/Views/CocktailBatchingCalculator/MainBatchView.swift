//
//  MainBatchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/6/24.
//

import SwiftUI

struct MainBatchView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredients: [BatchedCellData]
    
    var body: some View {
        VStack{
            HStack {
                Text(viewModel.cocktailNameText)
                    .font(.largeTitle).bold()
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                
            }
            HStack{
                Text("Cocktail Count:")
                TextField("#", text: $viewModel.numberOfCocktailsText).cBCTextField()
                    .autocorrectionDisabled()
                    .frame(width: 70, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .onSubmit {
                        viewModel.convertIngredientsToBatchCellData()
                    }
            }
            HStack{
                Spacer()
                Text("Bottle Size:")
                    .dynamicTypeSize(.small)
                Text("# of btls/Remaining mls:")
                    .dynamicTypeSize(.small)
            }
            List {
                ForEach($viewModel.quantifiedBatchedIngredients, id: \.self){ ingredient in
                    BatchCell(quantifiedBatchedIngredient: ingredient)
                }
            }
            .listStyle(.plain)
            .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .stroke(.gray.gradient, lineWidth: 2))
            Text("Total Dilution (\(viewModel.dilutionName)) = \(Int(ceil(viewModel.totalDilutionVolume)))ml (\((viewModel.totalDilutionVolume / 1000.0), specifier: "%.3f")L)")
            Text("Total Volume = \(Int(ceil(viewModel.totalBatchVolume)))ml (\((viewModel.totalBatchVolume / 1000.0), specifier: "%.3f")L)")
            Button {
                
            } label: {
                Text("Split Batch")
            }
            .buttonStyle(BlackNWhiteButton())
        }
        .task {
            viewModel.convertIngredientsToBatchCellData()
        }
    }
}

#Preview {
    MainBatchView(quantifiedBatchedIngredients: .constant([]))
        .environmentObject(CBCViewModel())
}
