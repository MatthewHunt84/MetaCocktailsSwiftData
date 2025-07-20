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
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    var body: some View {
            
            TabView(selection: $selectedTab)  {
                
                Tab(value: .cocktailListView) {
                    iOS_26CocktailListView()
                } label: {
                    Label("Cocktails", systemImage: "book.fill")
                }
                
                Tab(value: .addCocktailView) {
                    AddCocktailView()
                } label: {
                    Label("Add Cocktail", image: "custom.book.fill.badge.plus")
                }
                
                Tab(value: .favoritesView) {
                    CustomCocktailsListView()
                } label: {
                    Label("Favorites", systemImage: "heart.fill")
                }
                
                Tab(value: .searchView) {
                    IngredientSearchView()
                        .environmentObject(SearchViewModel())
                } label: {
                    Label("Ingredients", systemImage: "text.page.badge.magnifyingglass")
                }
                
                Tab(value: .searchView, role: .search) {
                    iOS26_SearchBarAllCocktailsListView()
                } label: {
                    Label("Search", systemImage: "magnifyingglass.circle.fill")
                }
                
            }
            .environment(\.currentTab, $selectedTab)
            .tint(ColorScheme.tabBarTint)
            .tabBarMinimizeBehavior(.onScrollDown)
        }
}

@available(iOS 26.0, *)
struct iOS26_SearchBarAllCocktailsListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    @State private var navigationManager = iOS_26_SearchViewNavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path)  {

                List {
                    ForEach(viewModel.searchViewDisplayCocktails) { cocktail in
                        iOS26_SingleCocktailListView(cocktail: cocktail)
                    }
                }
                    .jamesHeader("Quick Search")
            
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
//                        .environment(navigationManager)
                }
                
                ForEach(viewModel.filteredResults.others) { cocktail in
                    iOS26_SingleCocktailListView(cocktail: cocktail)
                        .listRowSeparator(.hidden)
//                        .environment(navigationManager)
                }
            }
            .environment(navigationManager)
            .onSubmit(of: .search) {
                // This will still fire when the user taps a cocktail, so we check a flag here
                // Otherwise when  we tap a cockail that gets pushed AND the top cocktail still gets pushed
                guard !viewModel.didTapCocktail else { return }
                print("Submit: pushing cocktail")
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
