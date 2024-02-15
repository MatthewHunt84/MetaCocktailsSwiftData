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
    @Binding var cocktailCount: Double

    
    
    var body: some View {
        VStack{
            HStack {
//                Text("\(viewModel.cocktail.cocktailName)")
//                    .font(.title).bold()
              Spacer()
                Button{
                   
                } label: {
                    Image(systemName: "house")
                }
                Button{
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                
            }
            HStack{
                Text("Cocktail Count:")
                TextField("#", value: $viewModel.numberOfCocktailsText, formatter: viewModel.formatter).cBCTextField()
                    .autocorrectionDisabled()
                    .frame(width: 125, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
            Text("Total Dilution = \(Int(ceil(viewModel.totalDilutionVolume)))ml (\((viewModel.totalDilutionVolume / 1000.0), specifier: "%.3f")L)")
            Text("Total Volume = \(Int(ceil(viewModel.totalBatchVolume)))ml (\((viewModel.totalBatchVolume / 1000.0), specifier: "%.3f")L)")
            NavigationLink {
               SplitBatchView()
            } label: {
                Text("Split Batch")
            }
            .buttonStyle(BlackNWhiteButton())
        }
        .navigationTitle("\(aFlightSouthOfTheBorder.cocktailName)")
   
        .task {
            cocktailCount = viewModel.numberOfCocktailsText
            viewModel.convertIngredientsToBatchCellData()
        }
    }
}

#Preview {
    let previewContainer = PreviewContainer([Cocktail.self])
    return MainBatchView(quantifiedBatchedIngredients: .constant([]), cocktailCount: .constant(20.0))
        .environmentObject(CBCViewModel())
        .modelContainer(previewContainer.container)
}
