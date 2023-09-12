//
//  ListView.swift
//  MetaCocktails
//
//  Created by James on 8/28/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    
   // var preferenceType: PreferenceType
    @Binding var selectedList: PreferenceType
    var navigationTitle: String
    @Binding var isShowingLikes: Bool
    
    var body: some View {
        
        SearchBarView(searchText: $viewModel.searchText)
            .navigationTitle(navigationTitle)
            .onChange(of: viewModel.searchText) { _ in // we could pass newValue here, but since its synced with the viewModel's searchText we can just use that in the match function
                viewModel.matchAllTheThings()
            }
        List {
            if isShowingLikes {
                ForEach($viewModel.cocktailComponents) { ingredient in
                    
                    if ingredient.isUnwanted.wrappedValue == false && ingredient.matchesCurrentSearch.wrappedValue && ingredient.preferenceType.wrappedValue == selectedList {
                        
                        PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                        
                    }
                }
                
            } else {
                ForEach($viewModel.cocktailComponents) { ingredient in
                    if ingredient.isPreferred.wrappedValue == false && ingredient.matchesCurrentSearch.wrappedValue && ingredient.preferenceType.wrappedValue == selectedList  {
                        PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                            .tint(.red)
                    }
                }
            }
        }
        
        
        
        .listStyle(.plain)
        Spacer()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(selectedList: .constant(.flavors), navigationTitle: "Beans", isShowingLikes: .constant(true))
            .environmentObject(SearchCriteriaViewModel())

    }
}
