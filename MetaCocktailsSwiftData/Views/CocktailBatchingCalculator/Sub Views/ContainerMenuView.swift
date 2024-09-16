//
//  ContainerMenuView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/11/24.
//

import SwiftUI

struct ContainerMenuView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    
    private let containerSizes = [
        ("4 Liter", 4000),
        ("5 Liter", 5000),
        ("6 Liter", 6000),
        ("7 Liter", 7000),
        ("8 Liter", 8000),
        ("9 Liter", 9000),
        ("10 Liter", 10000),
        ("11 Liter", 11000),
        ("12 Liter", 12000),
        ("13 Liter", 13000),
        ("14 Liter", 14000),
        ("15 Liter", 15000),
        ("16 Liter", 16000),
        ("17 Liter", 17000),
        ("18 Liter", 18000),
        ("5 Gallon Bucket", 18927)
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(containerSizes, id: \.0) { label, size in
                    Button(action: {
                        viewModel.containerSize = size
                        viewModel.convertIngredientsToBatchCellData()
                        viewModel.doSplitBatchMath()
                        viewModel.containerSizeLabel = label
                    }) {
                        Text(label)
                            .font(FontFactory.mediumFont(size: 16))
                            .foregroundColor(viewModel.containerSize == size ? ColorScheme.interactionTint : .gray)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white, lineWidth: viewModel.containerSize == size ? 1 : 0)
                                    )
                            )
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .frame(height: 50)
    }
}

#Preview {
    ContainerMenuView()
        .environmentObject(CBCViewModel())
}
