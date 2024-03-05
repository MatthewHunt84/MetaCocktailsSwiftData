//
//  TabBarView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct TabBarView: View {
    

    
    var body: some View {
        TabView{
            CocktailListView()
                .tabItem { Label("A-Z", systemImage: "list.bullet") }
                
            
            BasicSearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass.circle.fill") }
              
            
            AddCocktailView()
                .tabItem { Label("Add Cocktail", image: "custom.book.fill.badge.plus") }
             
        }
        .environmentObject(SearchCriteriaViewModel())
    }
}



#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return TabBarView()
        .environmentObject(SearchCriteriaViewModel())
        .modelContainer(preview.container)
        
}
