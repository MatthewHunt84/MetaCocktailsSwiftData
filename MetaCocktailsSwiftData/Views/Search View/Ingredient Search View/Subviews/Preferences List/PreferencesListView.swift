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
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Text("Selected Preferences")
                            .font(.headline).bold()
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.white, .gray]),
                                                            startPoint: .leading,
                                                            endPoint: .trailing))
                    }
                    
                    Spacer()
                }
                .padding(.leading, 15)
                
                SelectedIngredientView(isPreferred: true, selections: viewModel.preferredSelections)
                SelectedIngredientView(isPreferred: false, selections: viewModel.unwantedSelections)
            }
            .padding()
        }
    }
}

#Preview {
    PreferencesListView()
        .environmentObject(SearchCriteriaViewModel())
}
