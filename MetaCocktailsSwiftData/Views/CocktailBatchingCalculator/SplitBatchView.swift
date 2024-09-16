//
//  SplitBatchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/11/24.
//

import SwiftUI

struct SplitBatchView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            ColorScheme.background.ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack(alignment: .center) {
                    Text(viewModel.chosenCocktail.cocktailName)
                        .font(FontFactory.mediumFont(size: 22))
                        .foregroundStyle(.softWhite)
                    Text("Split into \(viewModel.numberOfContainers) containers")
                        .font(FontFactory.regularFont(size: 18))
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .center) {
                    Text("Container Size:")
                        .font(FontFactory.mediumFont(size: 18))
                    ContainerMenuView()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.darkGrey2)
                    VStack {
                        Text("Batch Recipe Per Container:")
                            .font(FontFactory.mediumFont(size: 18))
                            .padding(.top)
                        Divider()
                            .background(Color.white)
                            .frame(height: 1)
                            .padding(.horizontal, 10)
                            .padding(.vertical, -10)
                        List {
                            ForEach($viewModel.splitBatchData, id: \.self) { ingredient in
                                SplitBatchCell(quantifiedSpiltBatches: ingredient)
                            }
                            .listRowBackground(Color.clear)
                        }
                        .listStyle(.plain)
                        .background(Color.clear)
                    }
                }
                .frame(maxHeight: .infinity)
                
                Text("* At least 10% of the container's volume will be left empty for safe transportation.")
                    .font(FontFactory.regularFont(size: 14))
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .foregroundStyle(.gray)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Split Batch", dismiss: dismiss)
            .task {
                viewModel.doSplitBatchMath()
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    NavigationStack {
        return SplitBatchView()
            .modelContainer(preview.container)
            .environmentObject(CBCViewModel())
    }
}
