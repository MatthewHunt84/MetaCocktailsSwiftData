//
//  BatchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/6/24.
//

import SwiftUI

struct BatchCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @State var bottleSize: BottleSize = .oneLiter
    @Binding var ingredient: BatchIngredient
    var body: some View {
        HStack{
            Text(ingredient.name)
            Spacer()
            Picker("Bottle Size", selection: $bottleSize) {
                ForEach(BottleSize.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 100, height: 50)
            TextField("Btl#", text: $viewModel.dilutionPercentage).cBCTextField()
                .frame(width: 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onSubmit {
                    
                }
            TextField("/mls.", text: $viewModel.dilutionPercentage).cBCTextField()
                .frame(width: 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onSubmit {
                    
                }
            
        }
        .frame(maxHeight: 50)
        
    }
}

#Preview {
    BatchCell(ingredient: .constant(BatchIngredient(name: "Super Long Ingredient", amount: "45", aBV: "20")))
        .environmentObject(CBCViewModel())
}
enum BottleSize: String, CaseIterable {
    case oneLiter = "1L"
    case seven50ml = "750ml"
    
}
