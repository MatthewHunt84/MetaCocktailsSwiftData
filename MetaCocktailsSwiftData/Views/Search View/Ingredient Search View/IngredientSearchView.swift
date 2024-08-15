//
//  IngredientSearchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct IngredientSearchView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @FocusState var keyboardFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                MeshGradients.blackGreyBackground.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                        
                    FilteredIngredientListView(keyboardFocused: _keyboardFocused)

                    Spacer()
                    
                    if !viewModel.preferredSelections.isEmpty {
                        PreferencesListView()
                            .zIndex(10)
                    }
                    
                    SearchForCocktailsButton()
  
                }
            }
            .animation(.easeOut(duration: 0.5), value: viewModel.preferredSelections.isEmpty)
            .navigationDestination(isPresented: $viewModel.isShowingResults) {
                IngredientSearchResultsView()
            }
            .onChange(of: viewModel.searchCompleted) { _, newValue in
                if newValue {
                    viewModel.toggleIsShowingResults()
                    viewModel.resetSearch()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .gradientNavigationTitle("Search Ingredients")
            .task {
                keyboardFocused = true
            }
            .funLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
        }
    }
}



#Preview {
    IngredientSearchView()
        .environmentObject(SearchCriteriaViewModel())
}
