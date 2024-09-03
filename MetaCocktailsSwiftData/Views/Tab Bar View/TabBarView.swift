//
//  TabBarView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: TabBarComponents = .searchView
    
    var body: some View {
        
        TabView(selection: $selectedTab)  {
            ForEach(TabBarComponents.allCases) { screen in
                screen.destination
                    .tag(screen as TabBarComponents?)
                    .tabItem { screen.label }
            }
        }
        .environment(\.currentTab, $selectedTab)
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return TabBarView()
        .environmentObject(SearchCriteriaViewModel())
        .modelContainer(preview.container)
    
}

