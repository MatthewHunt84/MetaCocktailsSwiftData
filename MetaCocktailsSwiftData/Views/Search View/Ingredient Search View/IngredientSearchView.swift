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
    @State private var backgroundIsActive: Bool = false
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                ColorScheme.background.ignoresSafeArea()
                
                VStack {

                    if !viewModel.preferredSelections.isEmpty || !viewModel.unwantedSelections.isEmpty {
                        PreferencesListView()
                    } else {
                        FindCocktailUserInfoView()
                    }
                    
                    FilteredIngredientListView(keyboardFocused: _keyboardFocused)
                        .onTapGesture {
                            keyboardFocused = true
                        }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        if !viewModel.preferredSelections.isEmpty {
                            HStack {
                                Spacer()
                                Button {
                                    Task {
                                        await viewModel.searchButtonPressed()
                                    }
                                } label: {
                                    Text("Search")
                                        .tint(ColorScheme.interactionTint)
                                }
                            }
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
            .jamesHeader("Cocktail Ingredient Search")
            .customLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
            .onAppear{
                keyboardFocused =  true
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return IngredientSearchView()
        .environmentObject(SearchViewModel())
        .modelContainer(preview.container)
    
}
