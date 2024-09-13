//
//  ContainerMenuView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/11/24.
//

import SwiftUI

struct ContainerMenuView: View {
    @EnvironmentObject var viewModel: CBCViewModel

    var body: some View {
        VStack {
            Menu(viewModel.containerSizeLabel) {
                Button{
                    viewModel.containerSize = 4000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "4 Liter"
                } label: {
                    Text("4 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 5000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "5 Liter"
                } label: {
                    Text("5 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 6000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "6 Liter"
                } label: {
                    Text("6 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 7000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "7 Liter"
                } label: {
                    Text("7 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 8000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "8 Liter"
                } label: {
                    Text("8 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 9000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "9 Liter"
                } label: {
                    Text("9 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 10000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "10 Liter"
                } label: {
                    Text("10 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 11000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "11 Liter"
                } label: {
                    Text("11 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 12000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "12 Liter"
                } label: {
                    Text("12 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 13000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "13 Liter"
                } label: {
                    Text("13 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 14000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "14 Liter"
                } label: {
                    Text("14 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 15000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "15 Liter"
                } label: {
                    Text("15 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 16000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "16 Liter"
                } label: {
                    Text("16 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 17000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "17 Liter"
                } label: {
                    Text("17 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 18000
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "18 Liter"
                } label: {
                    Text("18 Liter")
                    
                }
                Button{
                    viewModel.containerSize = 18927
                    viewModel.convertIngredientsToBatchCellData()
                    viewModel.doSplitBatchMath()
                    viewModel.containerSizeLabel = "5 Gallon Bucket"
                } label: {
                    Text("5 Gallon Bucket")
                    
                }
            }
            .buttonStyle(BlackNWhiteButton())
        }
    }
}

#Preview {
    ContainerMenuView()
        .environmentObject(CBCViewModel())
}
