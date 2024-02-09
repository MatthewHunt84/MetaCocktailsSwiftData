//
//  MainBatchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/6/24.
//

import SwiftUI

struct MainBatchView: View {
    @EnvironmentObject var viewModel: CBCViewModel
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
                    .frame(width: 70, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .onSubmit {
                        viewModel.do1LBatchMath()
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
                ForEach($viewModel.ingredients, id: \.self){ ingredient in
                    BatchCell(ingredient: ingredient)
                }
            }
            .listStyle(.plain)
            .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .stroke(.gray.gradient, lineWidth: 2))
            Text("Total Dilution (\(viewModel.dilutionName)) = \(NSNumber(value: viewModel.totalDilutionVolume) )")
            Text("Total Volume = \(NSNumber(value: viewModel.totalBatchVolume) )")
            Button {
                
            } label: {
                Text("Split Batch")
            }
            .buttonStyle(BlackNWhiteButton())
        }
//        .task {
//            UISegmentedControl.appearance().selectedSegmentTintColor = .brandPrimaryGreen
//        }
    }
}

#Preview {
    MainBatchView()
        .environmentObject(CBCViewModel())
}
