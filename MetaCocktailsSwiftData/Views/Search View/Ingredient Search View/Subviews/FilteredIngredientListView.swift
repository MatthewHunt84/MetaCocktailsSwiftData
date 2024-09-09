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
            
            HStack{
                SearchForCocktailsButton()
                    .disabled(viewModel.preferredSelections.isEmpty ? true : false)
                
                TextField("Search for cocktails which contain...", text: $viewModel.currentComponentSearchName).SearchBarTextField()
                    .focused($keyboardFocused)
                    .onChange(of: viewModel.currentComponentSearchName) { _, newValue in
                        viewModel.updateSearch(newValue)
                        Task {
                            await generateAllCocktailList(context: modelContext)
                        }
                    }
                    .animation(.easeInOut(duration: 0.2), value: keyboardFocused) // Animation on focus
                
            }
            .padding(.horizontal)
            .padding(.top)
            .task {
                //print(modelContext.sqliteCommand)
                viewModel.setupSearch()
                viewModel.ingredientNames = ingredients.map { $0.name }
            }
            
            if keyboardFocused {
                ScrollView{
                    LazyVStack(spacing: 10) {
                        ForEach($viewModel.filteredIngredients, id: \.self) { ingredient in
                            VStack {
                                viewModel.returnPreferencesThumbCell(ingredient: ingredient)
                                    
                                Divider()
                                    .background(Color.gray.opacity(0.3))
                            }
                            .padding(.horizontal, 40)
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
    
    func generateAllCocktailList(context: ModelContext) async {
        if viewModel.allCocktails.isEmpty {
            do {
                let descriptor = FetchDescriptor<Cocktail>()
                let fetchedCocktails = try context.fetch(descriptor)
                viewModel.allCocktails = fetchedCocktails
            } catch {
                print("Error fetching cocktails: \(error)")
            }
        }
    }
}

#Preview {
    FilteredIngredientListView()
        .environmentObject(SearchViewModel())
}
