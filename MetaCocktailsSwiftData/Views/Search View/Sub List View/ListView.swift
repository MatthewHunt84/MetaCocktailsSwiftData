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
            if selectedList != .spirits {
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
            } else {
                List {
                        if isShowingLikes {
                            ForEach($viewModel.boozeCategories, id: \.self) { spirit in
                                Section {
                                    DisclosureGroup {
                                            ForEach($viewModel.cocktailComponents) { ingredient in
                                                if ingredient.isUnwanted.wrappedValue == false && 
                                                    ingredient.matchesCurrentSearch.wrappedValue &&
                                                    (ingredient.preferenceType.wrappedValue == selectedList || selectedList == .all) &&
                                                    spirit.wrappedValue.rawValue == ingredient.spiritCategoryName.wrappedValue
                                                   
                                                {
                                                    PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                                                }
                                            }
                                    } label: {
                                        Text(spirit.wrappedValue.rawValue)
                                            .font(.headline)
                                            .padding(.leading, 5)
                                    }
                                    .tint(Color(.green))
                                }
                            }
                        } else {
                            ForEach($viewModel.boozeCategories, id: \.self) { spirit in
                                Section {
                                    DisclosureGroup {
                                        ForEach($viewModel.cocktailComponents) { ingredient in
                                            if ingredient.isPreferred.wrappedValue == false && 
                                                ingredient.matchesCurrentSearch.wrappedValue &&
                                                (ingredient.preferenceType.wrappedValue == selectedList || selectedList == .all) &&
                                                spirit.wrappedValue.rawValue == ingredient.spiritCategoryName.wrappedValue {
                                                PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                                                    
                                            }
                                        }
                                    } label: {
                                        Text(spirit.wrappedValue.rawValue)
                                            .font(.headline)
                                            .padding(.leading, 5)
                                    }
                                    .tint(Color(.red))
                                }
                            }
                            
                        }
                    
                }
                .listStyle(.plain)
                
                
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(selectedList: .constant(.spirits), navigationTitle: "Beans", isShowingLikes: .constant(true))
            .environmentObject(SearchCriteriaViewModel())

    }
}
