//
//  AddDilutionView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/12/24.
//

import SwiftUI

struct AddDilutionView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var changedDilutionName = ""
    @State private var changedDilutionAmount = 0.0
    var body: some View {
        ZStack {
           
            VStack {
                
                
          
                       HStack {
                        Text("Dilution Type:")
                        TextField("Usually water", text: $changedDilutionName).cBCTextField()
                            .autocorrectionDisabled()
                    }
                    HStack{
                        Spacer()
                        Text("Percent Amount:")
                        TextField("%Dilution", value: $changedDilutionAmount, formatter: viewModel.formatter).cBCTextField()
                            .autocorrectionDisabled()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: .center)
                    }
                Button("Add Dilution Ingredient") {
                    viewModel.dilutionName = changedDilutionName
                    viewModel.dilutionPercentage = changedDilutionAmount
                    dismiss()
                    
                }
                //.disabled(viewModel.ingredientNameText != "" || viewModel.dilutionName != "" ? false : true)
                .buttonStyle(BlackNWhiteButton())
                .padding()
                Spacer()
                
                }
                
                
            }
            .task {
                changedDilutionName = viewModel.dilutionName
                changedDilutionAmount = viewModel.dilutionPercentage
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    
}

#Preview {
    AddDilutionView()
        .environmentObject(CBCViewModel())
}
