//
//  ListView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/10/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    
    
    @Binding var selectedList: PreferenceType
    var navigationTitle: String
    @Binding var isShowingLikes: Bool
    
    var body: some View {
        
        NavigationStack {
            
            List {
                if isShowingLikes {
                    ForEach($viewModel.cocktailComponents) { ingredient in
                        
                        if ingredient.isUnwanted.wrappedValue == false && ingredient.matchesCurrentSearch.wrappedValue && (ingredient.preferenceType.wrappedValue == selectedList || selectedList == .all) {
                            
                            PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                            
                        }
                    }
                    
                } else {
                    ForEach($viewModel.cocktailComponents) { ingredient in
                        if ingredient.isPreferred.wrappedValue == false && ingredient.matchesCurrentSearch.wrappedValue && (ingredient.preferenceType.wrappedValue == selectedList || selectedList == .all) {
                            PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                                .tint(.red)
                        }
                    }
                    
                }
            }
            .listStyle(.plain)
            
            Spacer()
        }
//        .overlay {
//            SearchResultsView(viewModel: viewModel)
//        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(selectedList: .constant(.flavors), navigationTitle: "Beans", isShowingLikes: .constant(true))
            .environmentObject(SearchCriteriaViewModel())

    }
}
