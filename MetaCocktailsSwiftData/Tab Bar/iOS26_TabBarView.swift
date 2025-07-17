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
                CocktailListView()
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
                    .searchable(text: $viewModel.searchText, prompt: "Search for cocktails")
            } label: {
                Label("Search", systemImage: "magnifyingglass.circle.fill")
                
            }
            
        }
        .environment(\.currentTab, $selectedTab)
        .tint(ColorScheme.tabBarTint)
        .tabBarMinimizeBehavior(.onScrollDown)
        .searchToolbarBehavior(.)
    }
}

@available(iOS 26.0, *)
struct iOS26_SearchBarAllCocktailsListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Spacer()
                
                ScrollView { // disabling this makes the view behave like I want - but I can no longer scroll
                    LazyVStack {
                        ForEach(viewModel.searchResultsCocktails, id: \.self) { cocktail in
                            SingleCocktailListView(cocktail: cocktail)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            
            .onChange(of: viewModel.searchText) { _, newValue in
                viewModel.updateSearch(newValue)
            }
        }
    }
}
