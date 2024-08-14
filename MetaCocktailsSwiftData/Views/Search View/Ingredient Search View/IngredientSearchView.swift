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
    @State var showingResults: Bool = false
    @FocusState var keyboardFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            
            VStack{
                
                PreferencesListView()
                    
                    Form {
                        FilteredIngredientListView(keyboardFocused: _keyboardFocused)
                        SearchForCocktailsButton(showingResults: $showingResults)
                        ResetButton()
                    }
            }
            .navigationDestination(isPresented: $showingResults) {
                IngredientSearchResultsView()
            }
            .onChange(of: viewModel.searchCompleted) { _, newValue in
                if newValue {
                    showingResults = true
                    viewModel.resetSearch()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Search Ingredients")
                        .font(.largeTitle).bold()
                }
            }
            .task {
                keyboardFocused = true
            }
            .basicLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
        }
    }
}

#Preview {
    IngredientSearchView()
        .environmentObject(SearchCriteriaViewModel())
}
