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
    @State var isShowingContainerInfo = false
    
    var body: some View {
        ZStack {
            ColorScheme.background.ignoresSafeArea()
            
            VStack {
                
                CBCCocktailHeaderView(cocktailName: viewModel.chosenCocktail.cocktailName)
                
                List {
                    
                    Section(header: CBCSplitBatchContainerHeader()) {
                        
                        GroupBox {
                            ContainerMenuView()
                        }
                        .frame(height: 37)
                        .padding(.horizontal, -25)
                        
                        HStack(alignment: .firstTextBaseline) {
                            
                            Text("")
                            
                            Spacer()
                            
                            Text("^[\(NSNumber(value: viewModel.numberOfContainers)) container](inflect: true) required")
                                .font(FontFactory.mediumFont(size: 16))
                                .foregroundStyle(.secondary)
                            
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 16))
                                .foregroundStyle(isShowingContainerInfo ? ColorScheme.tintColor : ColorScheme.interactionTint)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        isShowingContainerInfo.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                        
                        if isShowingContainerInfo {
                            Text(viewModel.numberOfContainers != 1 ? "To help accommodate safe transportation, a minimum of 10% of each container's volume will be left empty" :  "No need to split this batch. \(viewModel.numberOfCocktailsText, specifier: "%.0f") cocktails will fit into a single \(viewModel.containerSize)ml container safely")
                                .font(.footnote)
                                .foregroundStyle(ColorScheme.tintColor)
                        }
                    }
                    
                    Section(header: Text("Recipe per container")) {
                        ForEach($viewModel.splitBatchData, id: \.self) { ingredient in
                            SplitBatchCell(quantifiedSpiltBatches: ingredient)
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
                .clipShape(RoundedRectangle(cornerRadius: 12))
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
        .padding(.top, -20)
    }
}

struct CBCSplitBatchContainerHeader: View {
    var body: some View {
            Text("Choose Container Size")
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
