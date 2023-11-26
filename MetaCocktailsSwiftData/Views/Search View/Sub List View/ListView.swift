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
            let preferredArray = viewModel.selectedPreferredIngredients()
            let unwantedArray = viewModel.selectedUnwantedIngredients()
            var totalMatchedCocktails: [Cocktail] = []
            var matchedBasesCocktails: [Cocktail] = []
            var matchedStylesAndBasesCocktails: [Cocktail] = []
            var matchedTexturesBasesAndStylesCoctkails: [Cocktail] = []
            var matchedProfilesTexturesBasesAndStylesCocktails: [Cocktail] = []
            var flavorCount = viewModel.selectedPreferredIngredients().filter({ $0.isFlavor }).count
            var matchedCount = 0
            var preferredBases: [CocktailComponent] = preferredArray.filter({ $0.isSpirit })
            if preferredBases.isEmpty {
                for booze in Booze.allCases {
                    preferredBases.append(CocktailComponent(for: booze))
                }
            }

            var preferredStyles = preferredArray.filter({ $0.isStyle })
            if preferredStyles.isEmpty {
                for style in Style.allCases {
                    preferredStyles.append(CocktailComponent(for: style))
                }
            }
            var preferredProfiles = preferredArray.filter({ $0.isProfile })
            if preferredProfiles.isEmpty {
                for profile in Profile.allCases {
                    preferredProfiles.append(CocktailComponent(for: profile))
                }
            }
            var preferredTextures = preferredArray.filter({ $0.isTexture })
            if preferredTextures.isEmpty {
                for texture in Texture.allCases {
                    preferredTextures.append(CocktailComponent(for: texture))
                }
            }
            var preferredFlavors = preferredArray.filter({ $0.isFlavor })
            if preferredFlavors.isEmpty {
                for flavor in Flavor.allCases {
                    preferredFlavors.append(CocktailComponent(for: flavor))
                }
            }
            
            
            for cocktail in CocktailListViewModel().cocktails {
                if let bases = cocktail.CompileTags().bases {
                    for base in bases {
                        for preferred in preferredBases {
                            if base.rawValue.lowercased() == preferred.name.lowercased() {
                                matchedBasesCocktails.append(cocktail)
                            }
                        }
                        
                    }
                }
            }
           
            for matchedBases in matchedBasesCocktails {
                if let styles = matchedBases.CompileTags().styles {
                    for style in styles {
                        for preferred in preferredStyles {
                            if style.rawValue.lowercased() == preferred.name.lowercased() {
                                matchedStylesAndBasesCocktails.append(matchedBases)
                            }
                        }
                    }
                }
            }
            for matchedBasesAndStyles in matchedStylesAndBasesCocktails {
                if let textures = matchedBasesAndStyles.CompileTags().textures {
                    for texture in textures {
                        for preferredTexture in preferredTextures {
                            if texture.rawValue.lowercased() == preferredTexture.name.lowercased() {
                                matchedTexturesBasesAndStylesCoctkails.append(matchedBasesAndStyles)
                            }
                        }
                    }
                }
            }
            for matched in matchedTexturesBasesAndStylesCoctkails {
                if let profiles = matched.CompileTags().profiles {
                    for profile in profiles {
                        for preferredProfile in preferredProfiles {
                            if profile.rawValue.lowercased() == preferredProfile.name.lowercased() {
                                matchedProfilesTexturesBasesAndStylesCocktails.append(matched)
                            }
                        }
                    }
                }
            }
            let matchedPTBSCSet = Set(matchedProfilesTexturesBasesAndStylesCocktails)
            
            for matched in matchedPTBSCSet {
                matchedCount = 0
                if let flavors = matched.CompileTags().flavors {
                    for flavor in flavors {
                        
                        for preferredFlavor in preferredFlavors {
                            if flavor.rawValue.lowercased() == preferredFlavor.name.lowercased() {
                                print("flavor is \(flavor.rawValue). Preferred flavor is \(preferredFlavor.name)")
                                matchedCount += 1
                                print("matchedCount is \(matchedCount). Flavor Count is \(flavorCount)")
                            }
                            
                        }
                        
                    }
                    
                }
                if matchedCount == flavorCount {
                    
                    totalMatchedCocktails.append(matched)
                    matchedCount = 0
                   
                }
            }
            for matched in totalMatchedCocktails {
                print(matched.cocktailName)
            }
            
            
            
//                for cocktail in CocktailListViewModel().cocktails {
//                    if let bases = cocktail.CompileTags().bases {
//                        for base in bases {
//                            for preferred in preferredArray {
//                                if base.rawValue.lowercased() == preferred.lowercased() {
//                                    matchedCount += 1
//                                }
//                            }
//                        }
//                    }
//                    if let styles = cocktail.CompileTags().styles {
//                        for cocktailStyle in styles {
//                            for preferred in preferredArray {
//                                if cocktailStyle.rawValue.lowercased() == preferred.lowercased() {
//                                    matchedCount += 1
//                                }
//                            }
//                        }
//                    }
//                    if let flavors = cocktail.CompileTags().flavors {
//                        for flavor in flavors {
//                            for preferred in preferredArray {
//                                if flavor.rawValue.lowercased() == preferred.lowercased() {
//                                    matchedCount += 1
//                                }
//                            }
//                        }
//                    }
//                    if let profiles = cocktail.CompileTags().profiles {
//                        for profile in profiles {
//                            for preferred in preferredArray {
//                                if profile.rawValue.lowercased() == preferred.lowercased() {
//                                    matchedCount += 1
//                                }
//                            }
//                        }
//                    }
//                
//                    if let textures = cocktail.CompileTags().textures {
//                        for texture in textures {
//                            for preferred in preferredArray {
//                                if texture.rawValue.lowercased() == preferred.lowercased() {
//                                    matchedCount += 1
//                                }
//                            }
//                        }
//                    }
//                    if matchedCount >= preferredArray.count {
//                        matchedCocktails.append(cocktail)
//
//                    }
//                    matchedCount = 0
//                }
            var matchedSet = Set(totalMatchedCocktails)
            // then loop over the unwanted components and compare each one to the cocktails in the matched cocktails array. If there's a match, take it out of the array
            
                for cocktail in matchedSet {
                    if let bases = cocktail.CompileTags().bases {
                        for base in bases {
                            for unwanted in unwantedArray {
                                if base.rawValue.lowercased() == unwanted.name.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                    if let styles = cocktail.CompileTags().styles {
                        for style in styles {
                            for unwanted in unwantedArray {
                                if style.rawValue.lowercased() == unwanted.name.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                    if let flavors = cocktail.CompileTags().flavors {
                        for flavor in flavors {
                            for unwanted in unwantedArray {
                                if flavor.rawValue.lowercased() == unwanted.name.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                    if let profiles = cocktail.CompileTags().profiles {
                        for profile in profiles {
                            for unwanted in unwantedArray {
                                if profile.rawValue.lowercased() == unwanted.name.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                    if let textures = cocktail.CompileTags().textures {
                        for texture in textures {
                            for unwanted in unwantedArray {
                                if texture.rawValue.lowercased() == unwanted.name.lowercased() {
                                    matchedSet.remove(cocktail)
                                }
                            }
                        }
                    }
                
                
            }
//            print("Here are all of the matched cocktails:")
//            for matched in matchedSet {
//                print(matched.cocktailName)
//            }
            
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
