//
//  SearchCriteriaViewModel2.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/10/23.
//

import SwiftUI

final class SearchCriteriaViewModel: ObservableObject {

    @Published var searchText: String = ""
    @Published var cocktailComponents = Tags.createComponentArray()
    
    func matchAllTheThings() {
        // if searchText is empty, show everything again
        
        
        if searchText == "" {
            for cocktail in cocktailComponents {
                cocktail.matchesCurrentSearch = true
            }
             // this forces an update when the search bar is empty, instead of waiting for the user to hit return
            self.objectWillChange.send()
            return
        }

        // if searchText has text, match it and set the viewModel properties accordingly
        for cocktail in cocktailComponents {
            if cocktail.name.contains(searchText) {
                cocktail.matchesCurrentSearch = true
            } else {
                cocktail.matchesCurrentSearch = false
            }
        }
        self.objectWillChange.send()
    }
 
    func selectedPreferredIngredients() -> [CocktailComponent] {
        self.cocktailComponents.filter({ $0.isPreferred })
    }

    func selectedUnwantedIngredients() -> [CocktailComponent] {
        self.cocktailComponents.filter({ $0.isUnwanted })
    }

    func add(_ ingredient: CocktailComponent){
        cocktailComponents.append(ingredient)
    }
    
    func remove(at offsets: IndexSet){
        cocktailComponents.remove(atOffsets: offsets)
    }
    
    func getFilteredCocktails() {
        let preferredArray = selectedPreferredIngredients()
        let preferedCount = selectedPreferredIngredients().count
        let unwantedArray = selectedUnwantedIngredients()
        var totalMatchedCocktails: [Cocktail] = []
        var perfectMatchCocktails: [Cocktail] = []
        var matchedBasesCocktails: [Cocktail] = []
        var matchedStylesAndBasesCocktails: [Cocktail] = []
        var matchedTexturesBasesAndStylesCoctkails: [Cocktail] = []
        var matchedProfilesTexturesBasesAndStylesCocktails: [Cocktail] = []
        let flavorCount = selectedPreferredIngredients().filter({ $0.isFlavor }).count
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

        let preferredFlavors = preferredArray.filter({ $0.isFlavor })
       
//        if preferredFlavors.isEmpty {
    
//            for flavor in Flavor.allCases {
//                preferredFlavors.append(CocktailComponent(for: flavor))
//            }
//        }

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
                            matchedCount += 1
                        }
                    }
                }
            }
            if matchedCount > flavorCount  {
                totalMatchedCocktails.append(matched)
                matchedCount = 0
            }
        }
        if flavorCount == 0 {
            totalMatchedCocktails = matchedProfilesTexturesBasesAndStylesCocktails
        }
        
        var matchedSet = Set(totalMatchedCocktails)
        
            for cocktail in matchedSet {
                //print("TOP: The cocktail is \(cocktail.cocktailName). Matched count is \(matchedCount). prefered count is \(preferedCount)")
                if let bases = cocktail.CompileTags().bases {
                    for base in bases {
                        for unwanted in unwantedArray {
                            if base.rawValue.lowercased() == unwanted.name.lowercased() {
                                matchedSet.remove(cocktail)
                                matchedCount -= 1
                            }
                        }
                        for preferred in preferredArray {
                            if base.rawValue.lowercased() == preferred.name.lowercased() {
                                matchedCount += 1
                            }
                        }
                    }
                }
                if let styles = cocktail.CompileTags().styles {
                    for style in styles {
                        for unwanted in unwantedArray {
                            if style.rawValue.lowercased() == unwanted.name.lowercased() {
                                matchedSet.remove(cocktail)
                                matchedCount -= 1
                            }
                        }
                        for preferred in preferredArray {
                            if style.rawValue.lowercased() == preferred.name.lowercased() {
                                matchedCount += 1
                            }
                        }

                    }
                }
                if let flavors = cocktail.CompileTags().flavors {
                    for flavor in flavors {
                        for unwanted in unwantedArray {
                            if flavor.rawValue.lowercased() == unwanted.name.lowercased() {
                                matchedSet.remove(cocktail)
                                matchedCount -= 1
                            }
                        }
                        for preferred in preferredArray {
                            if flavor.rawValue.lowercased() == preferred.name.lowercased() {
                                matchedCount += 1
                            }
                        }

                    }
                }
                if let profiles = cocktail.CompileTags().profiles {
                    for profile in profiles {
                        for unwanted in unwantedArray {
                            if profile.rawValue.lowercased() == unwanted.name.lowercased() {
                                matchedSet.remove(cocktail)
                                matchedCount -= 1
                            }
                        }
                        for preferred in preferredArray {
                            if profile.rawValue.lowercased() == preferred.name.lowercased() {
                                matchedCount += 1
                            }
                        }

                    }
                }
                if let textures = cocktail.CompileTags().textures {
                    for texture in textures {
                        for unwanted in unwantedArray {
                            if texture.rawValue.lowercased() == unwanted.name.lowercased() {
                                matchedSet.remove(cocktail)
                                matchedCount -= 1
                            }
                        }
                        for preferred in preferredArray {
                            if texture.rawValue.lowercased() == preferred.name.lowercased() {
                                matchedCount += 1
                            }
                        }

                    }
                }
                //print("BOTTOM: The cocktail is \(cocktail.cocktailName). Matched count is \(matchedCount). prefered count is \(preferedCount)")
                if matchedCount == preferedCount {
                    perfectMatchCocktails.append(cocktail)
                  
                }
                matchedCount = 0
        }
        print("Thses are the cocktails that matched 100% of your preferences:")
        for perfect in perfectMatchCocktails {
            print(perfect.cocktailName)
        }
        
        print("Here are all of the matched cocktails:")
        for matched in matchedSet {
            print(matched.cocktailName)
        }
    }
}

class CocktailComponent: Identifiable, ObservableObject {
    
    // I don't love this, but it will work for now..
    
    @Published var matchesCurrentSearch: Bool
    var id = UUID()
    var name: String
    var isPreferred: Bool = false
    var isUnwanted: Bool = false
    var isSpirit: Bool = false
    var isFlavor: Bool = false
    var isProfile: Bool = false
    var isStyle: Bool = false
    var isTexture: Bool = false
    var preferenceType: PreferenceType
 

    init(name: String, isFlavor: Bool = false, isProfile: Bool = false, isStyle: Bool = false, isSpirit: Bool = false, isTexture: Bool = false, matchesCurrentSearch: Bool = true) {
        self.name = name
        self.isSpirit = isSpirit
        self.isFlavor = isFlavor
        self.isStyle = isStyle
        self.isProfile = isProfile
        self.isTexture = isTexture
        self.matchesCurrentSearch = matchesCurrentSearch
       
        if isFlavor {
            preferenceType = .flavors
        } else if isStyle {
            preferenceType = .style
        } else if isSpirit {
            preferenceType = .spirits
        } else if isProfile {
            preferenceType = .profiles
        } else {
            preferenceType = .textures
        }
    }
    
    init(for flavor: Flavor) {
        self.name = flavor.rawValue
        self.isFlavor = true
        self.preferenceType = .flavors
        self.matchesCurrentSearch = true
    }
    
    init(for spirit: Booze) {
        self.name = spirit.rawValue
        self.isSpirit = true
        self.preferenceType = .spirits
        self.matchesCurrentSearch = true
    }
    
    init(for profile: Profile) {
        self.name = profile.rawValue
        self.isProfile = true
        self.preferenceType = .profiles
        self.matchesCurrentSearch = true
    }
    
    init(for style: Style) {
        self.name = style.rawValue
        self.isStyle = true
        self.preferenceType = .style
        self.matchesCurrentSearch = true
    }
    init(for texture: Texture) {
        self.name = texture.rawValue
        self.isTexture = true
        self.preferenceType = .textures
        self.matchesCurrentSearch = true
    }
}


