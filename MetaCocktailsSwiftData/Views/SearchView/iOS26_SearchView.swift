//
//  iOS26_SearchView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/21/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct iOS26_SearchView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    @State private var navigationManager = iOS_26_SearchViewNavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path)  {
            ContentUnavailableView.search
                .jamesHeader("Quick Search")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
            
                .navigationDestination(for: Cocktail.self) { cocktail in
                    RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    
                    // Hack due to .searchable nav link / nav bar space bug (iOS 17/18/26)
                    // https://www.hackingwithswift.com/forums/swiftui/searchable-navigationlinks-seem-to-present-views-which-ignore-navigationbar-modifiers/29864
                        .padding(.top, 50)
                        .ignoresSafeArea(.all, edges: .top)
                }
                .searchable(text: $viewModel.searchText, prompt: "Search cocktails")
                .searchSuggestions {
                    if let top = viewModel.filteredResults.top {
                        iOS26_SingleCocktailListViewTop(cocktail: top)
                            .listRowSeparator(.hidden)
                    }
                    
                    ForEach(viewModel.filteredResults.others) { cocktail in
                        iOS26_SingleCocktailListView(cocktail: cocktail)
                            .listRowSeparator(.hidden)
                    }
                    .listRowSpacing(1)
                }
                .environment(navigationManager)
                .onSubmit(of: .search) {
                    // This will still fire when the user taps a cocktail, so we check a flag here
                    // Otherwise when  we tap a cocktail that gets pushed AND the top cocktail still gets pushed
                    guard !viewModel.didTapCocktail else { return }
                    if let firstResult = viewModel.searchResultsCocktails.first {
                        navigationManager.path.append(firstResult)
                    }
                }
                .task {
                    viewModel.didTapCocktail = false
                    viewModel.searchText = ""
                }
                .environment(navigationManager)
        }
    }
}
