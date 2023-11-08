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
        
        SearchBarView(searchText: $viewModel.searchText)
            .navigationTitle(navigationTitle)
            .onChange(of: viewModel.searchText) {// we could pass newValue here, but since its synced with the viewModel's searchText we can just use that in the match function
                viewModel.matchAllTheThings()
            }
        Button(action: {
            
            //create cocktailComponent arrays for unwanted and preferred components
            //loop over the preferences and add them to the arrays
            let preferredArray = viewModel.selectedPreferredIngredients().map({ $0.name })
            let unwantedArray = viewModel.selectedUnwantedIngredients().map({ $0.name })
            var matchedCocktails: [Cocktail] = []
           
           
            //loop over the preferred array and compare each preferred component to the components in each array of tags for each cocktail. if there's a match, add the cocktail to the Matched Cocktails array
            for preferred in preferredArray {
                for cocktail in CocktailListViewModel().cocktails {
                    
                    if cocktail.tags.bases != nil {
                        for base in cocktail.tags.bases! {
                            if base.rawValue ==  preferred {
                                matchedCocktails.append(cocktail)
                               
                            }
                        }
                    }
                    if cocktail.tags.flavors != nil {
                        for flavor in cocktail.tags.flavors! {
                            if flavor.rawValue == preferred {
                                matchedCocktails.append(cocktail)
                            }
                        }
                    }
                    if cocktail.tags.profiles != nil {
                        for profile in cocktail.tags.profiles! {
                            if profile.rawValue == preferred {
                                matchedCocktails.append(cocktail)
                            }
                        }
                    }
                    if cocktail.tags.styles != nil {
                        for style in cocktail.tags.styles! {
                            if style.rawValue == preferred {
                                matchedCocktails.append(cocktail)
                            }
                        }
                    }
                    if cocktail.tags.textures != nil {
                        for texture in cocktail.tags.textures! {
                            if texture.rawValue == preferred {
                                matchedCocktails.append(cocktail)
                            }
                        }
                    }
                }
            }
            var matchedSet = Set(matchedCocktails)
           
            
            // then loop over the unwanted components and compare each one to the cocktails in the matched cocktails array. If there's a match, take it out of the array
            
            for unwanted in unwantedArray {
                for cocktail in matchedSet {
                    if cocktail.tags.bases != nil {
                        for base in cocktail.tags.bases! {
                            if base.rawValue ==  unwanted {
                                matchedSet.remove(cocktail)
                               
                            }
                        }
                    }
                    if cocktail.tags.flavors != nil {
                        for flavor in cocktail.tags.flavors! {
                            if flavor.rawValue == unwanted {
                                matchedSet.remove(cocktail)
                            }
                        }
                    }
                    if cocktail.tags.profiles != nil {
                        for profile in cocktail.tags.profiles! {
                            if profile.rawValue == unwanted {
                                matchedSet.remove(cocktail)
                            }
                        }
                    }
                    if cocktail.tags.styles != nil {
                        for style in cocktail.tags.styles! {
                            if style.rawValue == unwanted {
                                matchedSet.remove(cocktail)
                               
                            }
                        }
                    }
                    if cocktail.tags.textures != nil {
                        for texture in cocktail.tags.textures! {
                            if texture.rawValue == unwanted {
                                matchedSet.remove(cocktail)
                            }
                        }
                    }
                    
                }
                
            }
            for matchedSet in matchedSet {
                print(matchedSet.cocktailName)
            }

            
        }) {
            VStack{

                Text("Print Cocktails")
                    .fontDesign(.serif)
            }
            .padding(10)
            .background(Color(UIColor.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 140))
            .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
            .foregroundColor(Color(UIColor.systemCyan))
        }
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
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(selectedList: .constant(.flavors), navigationTitle: "Beans", isShowingLikes: .constant(true))
            .environmentObject(SearchCriteriaViewModel())

    }
}
