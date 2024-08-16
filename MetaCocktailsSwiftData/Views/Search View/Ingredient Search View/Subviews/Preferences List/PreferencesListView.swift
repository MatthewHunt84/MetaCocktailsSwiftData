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
            HStack {
                Text("Selections")
                    .font(.headline).bold()
                    .foregroundStyle(MeshGradients.goldTitle)
                Spacer()
            }
            .padding(.leading, 25)
            
            SelectedIngredientView(isPreferred: true, selections: viewModel.preferredSelections)
            SelectedIngredientView(isPreferred: false, selections: viewModel.unwantedSelections)
            
        }
        .padding(.leading, 10)
        .padding(.bottom, 15)
    }
}

#Preview {
    PreferencesListView()
        .environmentObject(SearchCriteriaViewModel())
}
