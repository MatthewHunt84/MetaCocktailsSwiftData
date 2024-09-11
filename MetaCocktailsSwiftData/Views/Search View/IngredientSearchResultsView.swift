//
//  SearchResultsViewDataQueries.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct IngredientSearchResultsView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    @State private var backgroundIsActive: Bool = false
    var body: some View {
        
        ZStack {
            
            ColorScheme.background.ignoresSafeArea()
            
            VStack {
                
                PreferencesListView()
                IngredientSearchMatchedCocktailsView()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Matched Cocktails", dismiss: dismiss)
            .systemLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    IngredientSearchResultsView()
        .modelContainer(preview.container)
}

