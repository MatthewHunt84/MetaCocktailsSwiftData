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
                
                
                
                TextField("Search for cocktails which contain...", text: $viewModel.currentComponentSearchName)
                    .focused($keyboardFocused)
                    .font(.custom("AvenirNext-Regular", size: 16))
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.brandSecondaryGray)
                    )
                    .foregroundColor(.white)
                    .autocorrectionDisabled(true)
                    .onChange(of: viewModel.currentComponentSearchName) { _, newValue in
                        viewModel.updateSearch(newValue)
                        Task {
                            await generateAllCocktailList(context: modelContext)
                        }
                    }
                    .padding(.trailing, 8)
                    .animation(.easeInOut(duration: 0.2), value: keyboardFocused) // Animation on focus
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            
            
            .task {
                viewModel.setupSearch()
                viewModel.ingredientNames = ingredients.map { $0.name }
            }
            
            
            if keyboardFocused {
                List {
                    ForEach($viewModel.filteredIngredients, id: \.self) { ingredient in
                        viewModel.returnPreferencesThumbCell(ingredient: ingredient)
                    }
                    //.pinnedTopListStyle()
                    .listRowBackground(Color.clear)
                    
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

struct PinnedTopListStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listStyle(PlainListStyle())
            .environment(\.defaultMinListRowHeight, 1)
            .onAppear {
                UITableView.appearance().contentInset.top = 0
                UITableView.appearance().contentInset.bottom = 0
            }
    }
}

extension View {
    func pinnedTopListStyle() -> some View {
        self.modifier(PinnedTopListStyle())
    }
}

#Preview {
    FilteredIngredientListView()
        .environmentObject(SearchViewModel())
}
