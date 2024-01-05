//
//  SearchCriteriaViewModel2.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/10/23.
//

import SwiftUI


final class SearchCriteriaViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var cocktailComponents = createComponentArray().sorted(by: { $0.name < $1.name })
    @Published var preferredCount = 0
    @Published var sections = [ResultViewSectionData]()
    @Published var isLoading = true
    @Published var boozeCategories = { var array: [BoozeCategory] = [BoozeCategory]()
        for booze in BoozeCategory.allCases {
            array.append(booze)
        }
        return array
    }()
    
    static var generatedBoozeCocktailComponents: [CocktailComponent] = {
        return IngredientType.getBoozeComponents()
    }()
    
    func matchAllTheThings() {
        // if searchText is empty, show everything again
        
        if searchText == "" {
            for component in cocktailComponents {
                component.matchesCurrentSearch = true
            }
            // this forces an update when the search bar is empty, instead of waiting for the user to hit return
            self.objectWillChange.send()
            return
        }
        
        // if searchText has text, match it and set the viewModel properties accordingly
        for component in cocktailComponents {
            if component.name.lowercased().contains(searchText.lowercased()) {
                component.matchesCurrentSearch = true
            } else {
                component.matchesCurrentSearch = false
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
    
    func resetSearchCriteria() {
        preferredCount = 0
        sections.removeAll()
    }
    
    func removePreference(for component: CocktailComponent) {
        // When we click a green bubble to remove a preferred tag, we change the data and the UI updates.
        
        preferredCount -= 1
        let cocktailComponent = cocktailComponents.filter ({ $0.id == component.id })
        cocktailComponent.first?.isPreferred = false
        
        getFilteredCocktails()
        
    }
    
    func removeUnwanted(for component: CocktailComponent) {
        // When we click a red bubble to remove an unwanted tag, we change the data and the UI updates.
        let cocktailComponent = cocktailComponents.filter ({ $0.id == component.id })
        cocktailComponent.first?.isUnwanted = false
        
        
        getFilteredCocktails()
    }
    static func createComponentArray() ->  [CocktailComponent] {
        
        var array = [CocktailComponent]()
        let convertedArray: [CocktailComponent] = SearchCriteriaViewModel.generatedBoozeCocktailComponents
        
        for flavor in Flavor.allCases {
            array.append(CocktailComponent(for: flavor))
        }
        for profile in Profile.allCases {
            array.append(CocktailComponent(for: profile))
        }
        for texture in Texture.allCases {
            array.append(CocktailComponent(for: texture))
        }
        for style in Style.allCases {
            array.append(CocktailComponent(for: style))
        }
        for component in convertedArray {
            array.append(component)
        }
        return array
    }

    func filterUnwantedCocktails(cocktailComponentArray: [CocktailComponent], cocktails: [Cocktail]) -> [Cocktail] {
        cocktails.filter { cocktail in
            cocktail.spec.filter { cocktailIngredient in
                cocktailComponentArray.allSatisfy { unwantedComponent in
                    return unwantedComponent.name != cocktailIngredient.ingredient.name && !convertTagsToStrings(tags: cocktail.compiledTags).contains(unwantedComponent.name)
                }
            }.count == cocktail.spec.count
        }
    }
    
    // this converts all the tags into one strings array so we can easily compare them to the unwanted.name or the preferred.name. It's used in both.
    func convertTagsToStrings(tags: Tags) -> [String] {
        var strings: [String] = [String]()
        if let flavors = tags.flavors {
            strings.append(contentsOf: flavors.map({$0.rawValue}))
        }
        if let styles = tags.styles {
            strings.append(contentsOf: styles.map({$0.rawValue}))
        }
        if let textures = tags.textures {
            strings.append(contentsOf: textures.map({$0.rawValue}))
        }
        if let profiles = tags.profiles {
            strings.append(contentsOf: profiles.map({$0.rawValue}))
        }
        return strings
    }
    func getFilteredCocktails() {
        //set loading to true
        isLoading = true
        // reset search criteria for the cocktail results list view.
        resetSearchCriteria()
        //create an array of selected preferred ingredients
        let preferredArray = selectedPreferredIngredients()
        //create an array of selected unwanted ingredients
        let unwantedArray = selectedUnwantedIngredients()
        // set a count to the number of preferred ingredients
        preferredCount = preferredArray.count
        //loop over the number of preferredCount / 2 and create ResultViewSectionData objects with count and matched numbers filled in but empty cocktail arrays.
        // say the preferred count is 5. make one object for 5 matches with the count being 5 and the matched being 5 but and empty cocktail array, one object for 4 matches with the count being 5 and the matched being 4 but and empty cocktail array. Finally, an object for 3 matches with the count being 5 but the matched being 3. No more objects will be made for 2 or 1 because those are less than a 50% match. This means we have the possibility for 3 total sections in the returned ResultViewSectionData.
        let finalMatchContainers: [ResultViewSectionData] = {
            var dataShells = [ResultViewSectionData]()
            for i in 0...Int(preferredCount / 2) {
                let numberOfMatches = (preferredCount - i)
                dataShells.append(ResultViewSectionData(count: preferredCount, matched: numberOfMatches, cocktails: []))
            }
            return dataShells
        }()
        
        //first, loop over every cocktail in CocktailListViewModel().cocktails and add any cocktails that don't match any unwanted preferences to create the STARTINGCOCKTAILS array.
        // first check agains the cocktail spec. Then turn all the tags into an array of strings to check if each unwanted component is contained in the array. If it is, don't add it to the array of cocktails. 
        let startingCocktails = filterUnwantedCocktails(cocktailComponentArray: unwantedArray, cocktails: CocktailListViewModel().cocktails)
        //         Then, loop over every cocktail in STARTINGCOCKTAILSARRAY and pull out the cocktails that match with > 50% of the ingredients in the preferredArray. Keeping track of the matched count, add them to the appropriate object in the array of finalMatchedCocktails. 
        for cocktail in startingCocktails {
            var matchCounter = 0
            for preferred in preferredArray {
                for booze in cocktail.spec {
                    if booze.ingredient.name == preferred.name {
                        matchCounter += 1
                    }
                }
                if convertTagsToStrings(tags: cocktail.compiledTags).contains(preferred.name){
                    matchCounter += 1
                }
            }
            for container in finalMatchContainers {
                if container.matched == matchCounter {
                    container.cocktails.append(cocktail)
                }
            }
        }
        // Finally, we then return an array of matching cocktails as an array of ResultSectionViewData objects, checking to make sure the sections aren't empty.
        for container in finalMatchContainers {
            if !container.cocktails.isEmpty {
                sections.append(container)
            }
        }
        // set loading to false
        isLoading = false
    }
    
}


