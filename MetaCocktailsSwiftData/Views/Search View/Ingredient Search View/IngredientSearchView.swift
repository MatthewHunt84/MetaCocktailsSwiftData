//
//  IngredientSearchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct IngredientSearchView: View {
    
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var viewModel: SearchViewModel
    @FocusState var keyboardFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                MeshGradients.blackGreyBackground.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    FilteredIngredientListView(keyboardFocused: _keyboardFocused)
                        .onTapGesture {
                            keyboardFocused = true
                            if viewModel.allCocktails.isEmpty {
                                Task {
                                    await generateAllCocktailList(context: modelContext)
                                }
                            }
                        }
                    
                    Spacer()
                    
                    if !viewModel.preferredSelections.isEmpty {
                        HStack {
                            PreferencesListView()
                            SearchForCocktailsButton()
                        }
                    }
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
            .goldHeader("Search Ingredients")
            .funLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
            .basicLoadingIndicator(isLoading: viewModel.isGeneratingIngredientList)
        }
    }
    
    func generateAllCocktailList(context: ModelContext) async {
        await viewModel.toggleGeneratingIngredients()
        do {
            let descriptor = FetchDescriptor<Cocktail>()
            let fetchedCocktails = try context.fetch(descriptor)
            viewModel.allCocktails = fetchedCocktails
            await viewModel.toggleGeneratingIngredients()
        } catch {
            print("Error fetching cocktails: \(error)")
        }
    }
}



#Preview {
    IngredientSearchView()
        .environmentObject(SearchCriteriaViewModel())
}
