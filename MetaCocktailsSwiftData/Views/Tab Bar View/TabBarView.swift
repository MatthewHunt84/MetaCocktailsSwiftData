//
//  TabBarView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {

        TabView {
            
            BasicSearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass.circle.fill") }

            CocktailListView()
                .tabItem { Label("A-Z", systemImage: "list.bullet") }

            AddCocktailView()
                .tabItem { Label("Add Cocktail", image: "custom.book.fill.badge.plus") }
            
            
        }
        
        .environmentObject(SearchCriteriaViewModel()) // If we create the environmentObject on the main tabView like this, it gets automatically passed to all the child views. So any view in the tabView can just declare "@EnvironmentObject var viewModel: SearchCriteriaViewModel" and they will all have access to this same instance. Neat.
    }
}



#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return TabBarView()
        .environmentObject(SearchCriteriaViewModel())
        .modelContainer(preview.container)
        
}
