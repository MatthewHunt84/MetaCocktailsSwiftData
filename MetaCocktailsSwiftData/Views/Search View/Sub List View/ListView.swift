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
                            ForEach($viewModel.spiritsCategories, id: \.self) { spirit in
                                Section {
                                    ForEach($viewModel.cocktailComponents) { ingredient in
                                        if ingredient.isUnwanted.wrappedValue == false && ingredient.matchesCurrentSearch.wrappedValue && (ingredient.preferenceType.wrappedValue == selectedList || selectedList == .all) && ingredient.spiritCategory.wrappedValue?.rawValue ?? "oops"  == spirit.wrappedValue {
                                            PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                                        }
                                    }
                                } header: {
                                    Text(spirit.wrappedValue)
                                }
                                .headerProminence(.increased)
                                
                            }
                         

                        } else {
                            ForEach($viewModel.spiritsCategories, id: \.self) { spirit in
                               Section {
                                    ForEach($viewModel.cocktailComponents) { ingredient in
                                        if ingredient.isPreferred.wrappedValue == false && ingredient.matchesCurrentSearch.wrappedValue && (ingredient.preferenceType.wrappedValue == selectedList || selectedList == .all) && ingredient.spiritCategory.wrappedValue?.rawValue ?? "oops"  == spirit.wrappedValue {
                                            PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                                                .tint(.red)
                                        }
                                    }
                                } header: {
                                    Text(spirit.wrappedValue)
                                }
                                .headerProminence(.increased)
                                
                                
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
        ListView(selectedList: .constant(.flavors), navigationTitle: "Beans", isShowingLikes: .constant(true))
            .environmentObject(SearchCriteriaViewModel())

    }
}
