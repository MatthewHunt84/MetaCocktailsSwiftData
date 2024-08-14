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
//                    .padding(.top, 25)
                    .padding(.leading, 12)
                    .font(.headline).bold()

                Text("Tap to remove")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.leading, 12)

            SelectedIngredientView(isPreferred: true, selections: viewModel.preferredSelections)
            SelectedIngredientView(isPreferred: false, selections: viewModel.unwantedSelections)
        }
    }
}

#Preview {
    PreferencesListView()
        .environmentObject(SearchCriteriaViewModel())
}
