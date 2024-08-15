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
        
        if viewModel.unwantedSelections.isEmpty && viewModel.preferredSelections.isEmpty {
            Color.clear
                .frame(height: 20)
        } else {
            VStack {
                MeshGradients.whiteToGreyFade.mask {
                    HStack {
                        Text("Selections")
                            .font(.headline).bold()
                        Text("(tap to remove)")
                            .font(.subheadline)
                        Spacer()
                    }
                }
                .frame(maxHeight: 15)
                .padding(.leading, 25)
                
                SelectedIngredientView(isPreferred: true, selections: viewModel.preferredSelections)
                SelectedIngredientView(isPreferred: false, selections: viewModel.unwantedSelections)
                
            }
            .padding(.leading, 10)
        }
    }
}

#Preview {
    PreferencesListView()
        .environmentObject(SearchCriteriaViewModel())
}
