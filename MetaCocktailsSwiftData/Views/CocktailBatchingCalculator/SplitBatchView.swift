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
            
            VStack {
                CBCCocktailHeaderView(cocktailName: viewModel.chosenCocktail.cocktailName)
                List {
                    Section(header: CBCSplitBatchContainerHeader()) {
                        GroupBox {
                            ContainerMenuView()
                        }
                        .frame(height: 37)
                        .padding(.horizontal, -25)
                        
                        HStack{
                            Spacer()
                            if viewModel.numberOfContainers == 1 {
                                Text("Only 1 container required")
                                    .font(FontFactory.fontBody16)
                            } else {
                                Text("Split into ^[\(NSNumber(value: viewModel.numberOfContainers)) container](inflect: true)")
                                    .font(FontFactory.fontBody16)
                            }
                            Spacer()
                        }
                    }
                    Section(header: Text("Recipe per container"), footer: CBCSplitBatchSectionFooter()) {
                        ForEach($viewModel.splitBatchData, id: \.self) { ingredient in
                            SplitBatchCell(quantifiedSpiltBatches: ingredient)
                        }
                    }
                }
                .listStyle(.insetGrouped)
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

struct CBCSplitBatchSectionFooter: View {
    
    @State var isShowingContainerInfo = false
    @EnvironmentObject var viewModel: CBCViewModel
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                if viewModel.numberOfContainers == 1 {
                    Text("Only 1 container required".uppercased())
                } else {
                    Text("Batch split into \(viewModel.numberOfContainers) containers".uppercased())
                }
                
                Image(systemName: "info.circle")
                    .foregroundStyle(isShowingContainerInfo ? ColorScheme.tintColor : ColorScheme.interactionTint)
                    .onTapGesture {
                        isShowingContainerInfo.toggle()
                    }
                Spacer()
            }
            
            if isShowingContainerInfo {
                Text("At least 10% of the container's volume will be left empty for safe transportation")
                    .font(.footnote)
                    .foregroundStyle(.brandPrimaryGold)
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
