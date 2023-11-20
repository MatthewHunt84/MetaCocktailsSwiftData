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
            var matchedCount = 0
        
            //loop over the preferred array and compare each preferred component to the components in each array of tags for each cocktail. if there's a match, add the cocktail to the Matched Cocktails array
            
                for cocktail in CocktailListViewModel().cocktails {
                    if let bases = cocktail.CompileTags().bases {
                        for base in bases {
                            for preferred in preferredArray {
                                if base.rawValue.lowercased() == preferred.lowercased() {
                                    matchedCount += 1
                                }
                            }
                        }
                    }
                    if let styles = cocktail.CompileTags().styles {
                        for cocktailStyle in styles {
                            for preferred in preferredArray {
                                if cocktailStyle.rawValue.lowercased() == preferred.lowercased() {
                                    matchedCount += 1
                                }
                            }
                        }
                    }
                    if let flavors = cocktail.CompileTags().flavors {
                        for flavor in flavors {
                            for preferred in preferredArray {
                                if flavor.rawValue.lowercased() == preferred.lowercased() {
                                    matchedCount += 1
                                }
                            }
                        }
                    }
                    if let profiles = cocktail.CompileTags().profiles {
                        for profile in profiles {
                            for preferred in preferredArray {
                                if profile.rawValue.lowercased() == preferred.lowercased() {
                                    matchedCount += 1
                                }
                            }
                        }
                    }
                
                    if let textures = cocktail.CompileTags().textures {
                        for texture in textures {
                            for preferred in preferredArray {
                                if texture.rawValue.lowercased() == preferred.lowercased() {
                                    matchedCount += 1
                                }
                            }
                        }
                    }
                    if matchedCount >= preferredArray.count {
                        matchedCocktails.append(cocktail)

                    }
                    matchedCount = 0
                }
            var matchedSet = Set(matchedCocktails)
            // then loop over the unwanted components and compare each one to the cocktails in the matched cocktails array. If there's a match, take it out of the array
            
                for cocktail in matchedSet {
                    if let bases = cocktail.CompileTags().bases {
                        for base in bases {
                            for unwanted in unwantedArray {
                                if base.rawValue.lowercased() == unwanted.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                    if let styles = cocktail.CompileTags().styles {
                        for style in styles {
                            for unwanted in unwantedArray {
                                if style.rawValue.lowercased() == unwanted.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                    if let flavors = cocktail.CompileTags().flavors {
                        for flavor in flavors {
                            for unwanted in unwantedArray {
                                if flavor.rawValue.lowercased() == unwanted.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                    if let profiles = cocktail.CompileTags().profiles {
                        for profile in profiles {
                            for unwanted in unwantedArray {
                                if profile.rawValue.lowercased() == unwanted.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                    if let textures = cocktail.CompileTags().textures {
                        for texture in textures {
                            for unwanted in unwantedArray {
                                if texture.rawValue.lowercased() == unwanted.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                
                
            }
            print("Here are all of the matched cocktails:")
            for matched in matchedSet {
                print(matched.cocktailName)
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
