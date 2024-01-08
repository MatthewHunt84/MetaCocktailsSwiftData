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

    private func filterUnwantedCocktails(cocktailComponentArray: [CocktailComponent], cocktails: [Cocktail]) -> [Cocktail] {
         cocktails.filter { cocktail in
             cocktailComponentArray.allSatisfy { unwantedComponent in
                !convertTagsAndSpecToStrings(tags: cocktail.compiledTags, cocktail: cocktail).contains(unwantedComponent.name)
            }
        }
    }
    
    private func countMatches(_ currentCount: Int, for preferredComponent: CocktailComponent, in cocktail: Cocktail) -> Int {
        // compare preferredComponent against current cocktail of loop, then return number of matches.
        var matches = currentCount
        if convertTagsAndSpecToStrings(tags: cocktail.compiledTags, cocktail: cocktail).contains(preferredComponent.name){
            matches += 1
        }
        return matches
    }
    
    // this converts all the tags into one strings array so we can easily compare them to the unwanted.name or the preferred.name. It's used in both.
    func convertTagsAndSpecToStrings(tags: Tags, cocktail: Cocktail) -> [String] {
        var strings: [String] = [String]()
        strings.append(contentsOf: cocktail.spec.map({ $0.ingredient.name}))
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
        isLoading = true
        resetSearchCriteria()

        /** First, loop over every cocktail and add any cocktails that don't match any unwanted preferences to create the StartingCocktails array. */
        let startingCocktails = filterUnwantedCocktails(cocktailComponentArray: selectedUnwantedIngredients(), cocktails: CocktailListViewModel().cocktails)
        
        /**loop over the number of preferredCount / 2 and create ResultViewSectionData objects with count and matched numbers filled in but empty cocktail arrays.
        Let's say the preferred count is 5. make one object for 5 matches with the count being 5 and the matched being 5 but and empty cocktail array, one object for 4 matches with the count being 5 and the matched being 4 but and empty cocktail array. Finally, an object for 3 matches with the count being 5 but the matched being 3. No more objects will be made for 2 or 1 because those are less than a 50% match. This means we have the possibility for 3 total sections in the returned ResultViewSectionData. */
        var finalMatchContainers: [ResultViewSectionData] = {
            var dataShells = [ResultViewSectionData]()
            preferredCount = selectedPreferredIngredients().count
            for i in 0...Int(preferredCount / 2) {
                let numberOfMatches = (preferredCount - i)
                dataShells.append(ResultViewSectionData(count: preferredCount, matched: numberOfMatches, cocktails: []))
            }
            return dataShells
        }()
        
        /**Then, loop over every cocktail in the startingCocktailsArray and pull out the cocktails that match with > 50% of the ingredients in the preferredArray. Keeping track of the matched count, add them to the appropriate object in the array of finalMatchedCocktails. */
        for cocktail in startingCocktails {
            
            /** We use let _ = ... to loop over finalMatchContainers to append cocktails that match preferred components to the right section without creating a new array in the process */
            let _ = finalMatchContainers.map { resultViewSectionData in
                
            /** Then we want to match cocktails to sections by calculating the number of components that match the preferred array. */
                if resultViewSectionData.matched == selectedPreferredIngredients().reduce(0, { countMatches($0, for: $1, in: cocktail)}) {
                    resultViewSectionData.cocktails.append(cocktail)
                }
            }
        }
        
        /** Finally, we then return an array of matching cocktails as an array of ResultSectionViewData objects, checking to make sure the sections aren't empty. */
        sections.append(contentsOf: finalMatchContainers.filter({ !$0.cocktails.isEmpty}))
         
        /** (alternatively we do the same thing with compactMap and just cast the non-matches as optionals and compactMap will remove them for us)
                i.e.
            sections = finalMatchContainers.compactMap { resultSectionData in
            return resultSectionData.cocktails.isEmpty ? nil : resultSectionData } */

        isLoading = false
    }
}


