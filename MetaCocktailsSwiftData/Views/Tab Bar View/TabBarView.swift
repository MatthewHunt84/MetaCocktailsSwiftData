//
//  TabBarView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    
    var body: some View {

        TabView(selection: $viewModel.tabSelection) {
            
            BasicSearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass.circle.fill") }
                .tag(0)

            CocktailListView()
                .tabItem { Label("A-Z", systemImage: "list.bullet") }
                .tag(1)

            AddCocktailView()
                .tabItem { Label("Add Cocktail", image: "custom.book.fill.badge.plus") }
                .tag(2)
        }
    }
}



#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return TabBarView()
        .environmentObject(SearchCriteriaViewModel())
        .modelContainer(preview.container)
        
}
