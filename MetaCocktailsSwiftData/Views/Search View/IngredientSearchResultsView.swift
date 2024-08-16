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
    
    var body: some View {
        
        
        ZStack {
            
            MeshGradients.blackGreyBackground.ignoresSafeArea()
            
            VStack {
                
                IngredientSearchMatchedCocktailsView()
                
                PreferencesListView()
                    .padding(.top, 10)
                    .padding(.bottom, 10)
            }
            .navigationBarBackButtonHidden(true)
            .basicLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
            .goldHeaderWithNavigation(title: "Matched Cocktails", dismiss: dismiss)
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    IngredientSearchResultsView()
        .modelContainer(preview.container)
}

