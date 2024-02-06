//
//  DilutionCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//

import SwiftUI

struct DilutionCell: View {
    @EnvironmentObject var viewModel: CBCViewModel

  
    
    var body: some View {
        HStack {
            TextField("% Dilution", text: $viewModel.dilutionPercentage).cBCTextField()
                .frame(width: 70, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onSubmit {
                    viewModel.calculateABV()
                }
            Text("% dilution with \(viewModel.dilutionName)")
            Spacer()
        }

        .frame(maxHeight: 50)
    }
}

#Preview {
    DilutionCell()
}
