//
//  iOS26_TabBarView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/17/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct iOS26_TabBarView: View {
    @State private var selectedTab: TabBarComponents = .cocktailListView
    @State private var searchText: String = ""
    @State private var navigationManager = iOS_26_SearchViewNavigationManager()
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    var body: some View {
        
        TabView(selection: $selectedTab)  {
            
            Tab(value: .favoritesView) {
                NavigationStack(path: $navigationManager.path ) {
                    CustomCocktailsListView()
                        .navigationDestination(for: Cocktail.self) { cocktail in
                            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                .environment(navigationManager)
                        }
                }
            } label: {
                Label("Favorites", systemImage: "heart.fill")
            }
            
            Tab(value: .ingredientSearchView) {
                IngredientSearchView()
                    .environmentObject(SearchViewModel())
            } label: {
                Label("Ingredients", systemImage: "text.page.badge.magnifyingglass")
            }
            
            Tab(value: .addCocktailView) {
                AddCocktailView()
            } label: {
                Label("Add Cocktail", image: "custom.book.fill.badge.plus")
            }
            
            Tab(value: .cocktailListView, role: .search) {
                NavigationStack(path: $navigationManager.path ) {
                    iOS_26CocktailListView()
                        .navigationDestination(for: Cocktail.self) { cocktail in
                            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                .environment(navigationManager)
                        }
                }
            } label: {
                Label("Cocktails", systemImage: "magnifyingglass.circle.fill")
            }
            
            
        }
        .environment(\.currentTab, $selectedTab)
        .tint(ColorScheme.tabBarTint)
        .tabBarMinimizeBehavior(.onScrollDown)
        .environment(navigationManager)
    }
}


