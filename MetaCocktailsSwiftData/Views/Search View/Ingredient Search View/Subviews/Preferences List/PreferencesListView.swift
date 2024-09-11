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
        VStack {
            VStack {
                HStack {
                    FontFactory.mediumText("Selections", size: 20, color: Color.primary)
                    Spacer()
                    ResetSearchCriteriaButton()
                    
                }
                
                SelectedIngredientView(isPreferred: true, selections: viewModel.preferredSelections)
                SelectedIngredientView(isPreferred: false, selections: viewModel.unwantedSelections)
                
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(ColorScheme.backgroundLighter)
            .clipShape(RoundedRectangle.init(cornerRadius: 5))
        }
        .padding(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
    }
}

#Preview {
    PreferencesListView()
        .environmentObject(SearchCriteriaViewModel())
}
