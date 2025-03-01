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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.groupedContainerSizes, id: \.1) { labelForVolume, volume in
                    Button {
                        viewModel.updateContainerSize(newSize: volume)
                    } label: {
                        Text(labelForVolume)
                            .font(FontFactory.mediumFont(size: 16))
                            .foregroundColor(viewModel.containerSize == volume ? ColorScheme.interactionTint : .primary)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 16)
                            .background(Capsule().strokeBorder(ColorScheme.interactionTint, lineWidth: viewModel.containerSize == volume ? 1 : 0))
                    }
                }
            }
        }
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
        .onAppear {
            viewModel.groupContainerSizes()
        }
    }
}

#Preview {
    ContainerMenuView()
        .environmentObject(CBCViewModel())
}

