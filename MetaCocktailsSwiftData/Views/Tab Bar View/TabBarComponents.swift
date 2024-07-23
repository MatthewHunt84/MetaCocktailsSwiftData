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
    case addCocktailView
    
    
    var id: TabBarComponents { self }
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .cocktailListView:
            Label("A-Z", systemImage: "list.bullet")
        case .searchView:
            Label("Search", systemImage: "magnifyingglass.circle.fill")
        case .addCocktailView:
            Label("Add Cocktail", image: "custom.book.fill.badge.plus")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .cocktailListView:
            CocktailListView()
        case .searchView:
            BasicSearchWithDataQueryView()
        case .addCocktailView:
            AddCocktailView()
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
