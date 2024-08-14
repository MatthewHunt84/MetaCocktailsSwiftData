//
//  PreferencesListView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

public struct PreferencesListView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    
    public var body: some View {
        
        VStack(alignment: .leading) {

                Text("Selected Preferences:")
                    .padding(.top, 25)
                    .padding(.leading, 12)
                    .font(.headline).bold()

                Text("Tap to remove")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.leading, 12)

            
            ScrollView(.horizontal) {
                
                HStack(spacing: 12) {
                    
                    ForEach(viewModel.preferredSelections, id: \.self) { preferredIngredient in
                        viewModel.viewModelTagView(preferredIngredient, .green , "xmark")
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    guard !viewModel.isRunningComplexSearch else { return }
                                    viewModel.handleRemovalOf(selection: preferredIngredient, preferred: true)
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
            
            ScrollView(.horizontal) {
                
                HStack(spacing: 12) {
                    
                    ForEach(viewModel.unwantedSelections, id: \.self) { unwantedSelection in
                        viewModel.viewModelTagView(unwantedSelection, .red, "xmark")
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    viewModel.handleRemovalOf(selection: unwantedSelection, preferred: false)
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
}

#Preview {
    PreferencesListView()
        .environmentObject(SearchCriteriaViewModel())
}
