//
//  FilteredIngredientListView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI
import SwiftData

struct FilteredIngredientListView: View {
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var viewModel: SearchViewModel
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @FocusState var keyboardFocused: Bool
    
    @State var ingredientNames = [String]()
    
    var body: some View {
        
        
        VStack {
            
            TextField("Search for cocktails which contain...", text: $viewModel.currentComponentSearchName).searchBarTextField()
                .focused($keyboardFocused)
                .onChange(of: viewModel.currentComponentSearchName) { _, newValue in
                    viewModel.updateSearch(newValue)
                }
                .clearSearchButton(text: $viewModel.currentComponentSearchName) {
                    viewModel.currentComponentSearchName = ""
                }
                .onSubmit {
                    Task {
                        await viewModel.searchButtonPressed()
                    }
                }
                .submitLabel(.search)
                .animation(.easeInOut(duration: 0.2), value: keyboardFocused) // Animation on focus
            
            if keyboardFocused {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach($viewModel.filteredIngredients, id: \.self) { ingredient in
                            VStack {
                                viewModel.makeIngredientSearchCell(for: ingredient)
                                
                                Divider()
                                    .background(Color.gray.opacity(0.3))
                            }
                            .padding(.horizontal, 10)
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 8)
        .task {
//            print(modelContext.sqliteCommand)
//            await generateAllCocktailList(context: modelContext)
            viewModel.setupSearch()
            viewModel.ingredientNames = ingredients.map { $0.name }
        }
    }
}

#Preview {
    FilteredIngredientListView()
        .environmentObject(SearchViewModel())
}
