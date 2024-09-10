//
//  TabBarComponents.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/5/24.
//

import SwiftUI

enum TabBarComponents: Hashable, Identifiable, CaseIterable {
    
    case searchView
    case cocktailListView
    case customCocktailsView
    case addCocktailView
    case designIdeas
    
    
    
    var id: TabBarComponents { self }
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .cocktailListView:
            Label("A-Z", systemImage: "list.bullet")
        case .searchView:
            Label("Search", systemImage: "magnifyingglass.circle.fill")
        case .customCocktailsView:
            Label("Custom Cocktails", systemImage: "book.closed.fill")
        case .addCocktailView:
            Label("Add Cocktail", image: "custom.book.fill.badge.plus")
        case .designIdeas:
            Label("Design ideas", systemImage: "paintpalette")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .cocktailListView:
            CocktailListView()
        case .searchView:
            IngredientSearchView()
                .environmentObject(SearchViewModel())
        case .customCocktailsView:
            CustomCocktailsListView()
                .environmentObject(CocktailListViewModel())
        case .addCocktailView:
            AddCocktailView()
        case .designIdeas:
            DeleteMeDesignView()
        }
    }
}

private struct CurrentTabKey: EnvironmentKey {
    static let defaultValue: Binding<TabBarComponents> = .constant(.cocktailListView)
}

extension EnvironmentValues {
    var currentTab: Binding<TabBarComponents> {
        get { self[CurrentTabKey.self] }
        set { self[CurrentTabKey.self] = newValue }
    }
}

struct DeleteMeDesignView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            

            
            VStack {
                
                HStack {
                    
                    ColorScheme.tintColor
                        .frame(width: 50, height: 50)
                    ColorScheme.headerColor
                        .frame(width: 50, height: 50)
                    ColorScheme.unwantedColor
                        .frame(width: 50, height: 50)

                    ColorScheme.interactionTint
                        .frame(width: 50, height: 50)
                    Color.secondary
                        .frame(width: 50, height: 50)
                    ColorScheme.backgroundLighter
                        .frame(width: 50, height: 50)
                    ColorScheme.recipeBackground
                        .frame(width: 50, height: 50)
                }
                
                Text("Search Cocktails")
                    .font(.custom("AvenirNext-Regular", size: 30))
                Text("Search Cocktails")
                    .font(.custom("AvenirNext-CondensedBold", size: 30))
                Text("Search Cocktails")
                    .font(.custom("AvenirNext-Medium", size: 30))
                Text("Search Cocktails")
                    .font(.custom("AvenirNext-DemiBold", size: 30))
                Text("Search Cocktails")
                    .font(.custom("AvenirNext-Bold", size: 30))
                Text("Search Cocktails")
                    .font(.custom("AvenirNext-UltraLight", size: 30))
                Text("Search Cocktails")
                    .font(.custom("AvenirNext-CondensedMedium", size: 30))
                Text("Search Cocktails")
                    .font(.custom("AvenirNext-CondensedRegular", size: 30))
                Text("Search Cocktails")
            }
            .foregroundStyle(Color.primary)
            
        }
    }
}
