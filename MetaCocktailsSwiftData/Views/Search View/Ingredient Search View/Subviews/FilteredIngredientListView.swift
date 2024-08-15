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
            HStack{
                TextField("Flavor, Ingredient, Style, or Profile...", text: $viewModel.currentComponentSearchName)
                    .focused($keyboardFocused)
                    .textFieldStyle(.roundedBorder)
                    .frame(height: 20)
                    .autocorrectionDisabled(true)
                    .onChange(of: viewModel.currentComponentSearchName) { _, newValue in
                        viewModel.updateSearch(newValue)
                    }
                if !viewModel.currentComponentSearchName.isEmpty {
                    Button {
                        viewModel.currentComponentSearchName = ""
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundStyle(.brandPrimaryGold)
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
            .task {
                viewModel.setupSearch()
                viewModel.ingredientNames = ingredients.map({$0.name})
            }
            
            if keyboardFocused {
                List {
                    ForEach($viewModel.filteredIngredients, id: \.self) { ingredient in
                        viewModel.returnPreferencesThumbCell(ingredient: ingredient)
                    }
                    .pinnedTopListStyle()
//                    .listStyle(.automatic)
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .task {
                    await generateAllCocktailList(context: modelContext)
                }
            } else {
                EmptyView()
            }
    }
    
    func generateAllCocktailList(context: ModelContext) async {
        if viewModel.allCocktails.isEmpty {
            Task {
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
        .environmentObject(SearchCriteriaViewModel())
}
