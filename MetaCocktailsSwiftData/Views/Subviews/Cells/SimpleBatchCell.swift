//
//  SimpleBatchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 5/30/24.
//

import SwiftUI

struct SimpleBatchCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    
    var body: some View {
        HStack{
            
            Text(quantifiedBatchedIngredient.ingredientName)
            Spacer()
            Text("\(quantifiedBatchedIngredient.totalMls)ml")
                
            
        }.frame(maxHeight: 40)
        
        
        
    }
    
}


#Preview {
    SimpleBatchCell(quantifiedBatchedIngredient: .constant(BottleBatchedCellData(ingredientName: "Creme de Cacao", whole1LBottles: 2.1, remaining1LMls: 900, whole750mlBottles: 1.2, remaining750mLs: 34, mlAmount: 55, totalMls: 786)))
        .environmentObject(CBCViewModel())
}
