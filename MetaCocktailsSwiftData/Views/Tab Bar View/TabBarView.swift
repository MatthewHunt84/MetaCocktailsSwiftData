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

//            SearchCriteriaView(isShowingIngredientsList: .constant(true), isShowingPreferences: true, selectedLikesOrDislikes: .likes)
            BasicSearchView(isShowingIngredientsList: .constant(true), isShowingPreferences: true)
                .tabItem { Label("Search", systemImage: "magnifyingglass.circle.fill") }

            CocktailListView()
                .tabItem { Label("A-Z", systemImage: "list.bullet") }

            PrepBibleListView()
                .tabItem { Label("Prep", systemImage: "book.fill") }
        }
        .environmentObject(SearchCriteriaViewModel()) // If we create the environmentObject on the main tabView like this, it gets automatically passed to all the child views. So any view in the tabView can just declare "@EnvironmentObject var viewModel: SearchCriteriaViewModel" and they will all have access to this same instance. Neat.
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(SearchCriteriaViewModel())
    }
}
