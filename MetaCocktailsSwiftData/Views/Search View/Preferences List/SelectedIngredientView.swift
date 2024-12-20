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
    
    var body: some View {
        
        if selections.isEmpty {
            EmptyView()
        } else {
            
            ScrollView(.horizontal) {
                
                HStack(spacing: 10) {
                    
                    Image(systemName: isPreferred ? "plus.circle" : "minus.circle")
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                        .foregroundStyle(isPreferred ? ColorScheme.tintColor : .secondary)
                    
                    ForEach(Array(selections.enumerated()), id: \.element) { index, selectedIngredient in
                        HStack {
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
                            if index < selections.count - 1 {
                                Text("·")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .listRowSeparator(.automatic)
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
