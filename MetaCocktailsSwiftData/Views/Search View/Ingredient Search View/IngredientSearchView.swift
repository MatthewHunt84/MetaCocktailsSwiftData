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
                    
                    PreferencesListView()
                    
//                    Form {
                        FilteredIngredientListView(keyboardFocused: _keyboardFocused)
//                    }
//                    .background(.purple)
//                    .scrollDisabled(true)
                    SearchForCocktailsButton()
//                    ResetButton()
                    
                }
            }
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
            .toolbar {
                ToolbarItem(placement: .principal) {
                        Text("Search Ingredients")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(
                                LinearGradient(gradient: Gradient(colors: [.blue, .purple, .red]),
                                                                              startPoint: .leading,
                                                                              endPoint: .trailing))

                }
            }
//            .gradientNavigationTitle("Search Ingredients")
            .task {
                keyboardFocused = true
            }
            .basicLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
//            .background(MeshGradients.blackGreyBackground).ignoresSafeArea()
        }
    }
}



#Preview {
    IngredientSearchView()
        .environmentObject(SearchCriteriaViewModel())
}
