//
//  SelectedIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

struct SelectedIngredientView: View {
    
    init(isPreferred: Bool, selections: [String]) {
        self.isPreferred = isPreferred
        self.selections = selections
    }
    
    @EnvironmentObject var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    let isPreferred: Bool
    let selections: [String]
    @State private var isVisible = true
    
    var body: some View {
        
        if selections.isEmpty {
            EmptyView()
        } else {
            
            ScrollView(.horizontal) {
                
                HStack(spacing: 10) {
                    
                    Image(systemName: isPreferred ? "checkmark" : "xmark")
                        .fontWeight(.semibold)
                        .foregroundStyle(isPreferred ? MeshGradients.goldTitle : MeshGradients.redAndGold)
                    
                    ForEach(selections, id: \.self) { selectedIngredient in
                        SelectionTagView(viewModel: SelectionTagViewModel(name: selectedIngredient, isPreferred: isPreferred))
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    guard !viewModel.isRunningComplexSearch else { return }
                                    viewModel.handleRemovalOf(selection: selectedIngredient, preferred: isPreferred)
                                    if viewModel.preferredCount == 0 {
                                        dismiss()
                                    }
                                }
                            }
                    }
                    
                    Text("(tap to remove)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .opacity(isVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.75), value: isVisible)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isVisible = false
                            }
                        }
                }
                .frame(height: 15)
            }
            .scrollClipDisabled(true)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SelectedIngredientView(isPreferred: true, selections: ["Awesome", "Cool", "Radical"])
}
