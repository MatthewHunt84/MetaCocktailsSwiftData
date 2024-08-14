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
        ScrollView(.horizontal) {
            
            HStack(spacing: 12) {
                
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
            }
            .padding(.horizontal, 15)
            .frame(height: 35)
        }
        .mask(LinearGradient(stops: [.init(color: .clear, location: 0), .init(color: .white, location: 0.05), .init(color: .white, location: 0.95), .init(color: .clear, location: 1)], startPoint: .leading, endPoint: .trailing))
        .scrollClipDisabled(true)
        .scrollIndicators(.hidden)
    }
}
                                               

#Preview {
    SelectedIngredientView(isPreferred: true, selections: ["Awesome", "Cool", "Radical"])
}
