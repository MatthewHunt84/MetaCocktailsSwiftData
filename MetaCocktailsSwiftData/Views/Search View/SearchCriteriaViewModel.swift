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
    @Published var basicCocktailComponents = createBasicComponentArray().sorted(by: { $0.name < $1.name })
    @Published var preferredCount = 0
    @Published var sections = [ResultViewSectionData]()
    @Published var enableMultipleSpiritSelection: Bool = false
    @Published var isLoading = true
    @Published var multipleBaseSpiritsSelected: Bool = false
    @Published var boozeCategories = {Array(Set(generatedBoozeCocktailComponents.map({$0.spiritCategoryName}))).sorted()}()
    @Published var nACategories = {Array(Set(generatedNACocktailComponents.map({$0.nACategoryName}))).sorted()}()
   
    
    static var generatedBoozeCocktailComponents: [CocktailComponent] = {
        return IngredientType.getBoozeComponents()
    }()
    static var generatedNACocktailComponents: [CocktailComponent] = {
        return IngredientType.getNAComponents()
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
            if component.name.localizedCaseInsensitiveContains(searchText) {
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
        let convertedBoozeArray: [CocktailComponent] = SearchCriteriaViewModel.generatedBoozeCocktailComponents
        let convertedNAArray: [CocktailComponent] = SearchCriteriaViewModel.generatedNACocktailComponents
        
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
        for component in convertedBoozeArray {
            array.append(component)
        }
        for component in convertedNAArray {
            array.append(component)
        }
        
        return array
    }
    static func createBasicComponentArray() -> [CocktailComponent] {
        var array = [CocktailComponent]()
        let convertedBoozeArray: [CocktailComponent] = SearchCriteriaViewModel.generatedBoozeCocktailComponents
        let convertedNAArray: [CocktailComponent] = SearchCriteriaViewModel.generatedNACocktailComponents
        for component in convertedBoozeArray {
            array.append(component)
        }
        for component in convertedNAArray {
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
    func convertTagsAndSpecToStrings(tags: Tags, cocktail: Cocktail) -> [String] {
        var strings: [String] = [String]()
        strings.append(contentsOf: cocktail.spec.map({ $0.ingredient.name}))
        if let booze = tags.booze {
            strings.append(contentsOf: booze.map({$0.name}))
        }
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
        return Array(Set(strings))
    }
    func getFilteredCocktails() {
        isLoading = true
        resetSearchCriteria()

        /** First, loop over every cocktail and add any cocktails that don't match any unwanted preferences to create the StartingCocktails array. */
        let startingCocktails = filterUnwantedCocktails(cocktailComponentArray: selectedUnwantedIngredients(), cocktails: CocktailListViewModel().cocktails)
        
        /**loop over the number of preferredCount / 2 and create ResultViewSectionData objects with count and matched numbers filled in but empty cocktail arrays.
        Let's say the preferred count is 5. make one object for 5 matches with the count being 5 and the matched being 5 but and empty cocktail array, one object for 4 matches with the count being 5 and the matched being 4 but and empty cocktail array. Finally, an object for 3 matches with the count being 5 but the matched being 3. No more objects will be made for 2 or 1 because those are less than a 50% match. This means we have the possibility for 3 total sections in the returned ResultViewSectionData. */
        let finalMatchContainers: [ResultViewSectionData] = {
            var dataShells = [ResultViewSectionData]()
            if enableMultipleSpiritSelection == true {
                /** If we're searching for separate base spirits, we need to add more shells. One for each base spirit searched in each match number about 50%. We also need to use a modified preferredCount that counts all spirits as a total of one. */
                preferredCount = modifiedPreferredCount()
                for i in 0...Int(preferredCount / 2) {
                    let numberOfMatches = (preferredCount - i)
                    for spirit in returnPreferredBaseSpirits() {
                        dataShells.append(ResultViewSectionData(count: preferredCount, matched: numberOfMatches, baseSpirit: spirit, cocktails: []))
                    }
                }
                return dataShells
            } else {
                /**Otherwise search normaly, allowing individual base spirits to add to the total search count.**/
                preferredCount = selectedPreferredIngredients().count
                for i in 0...Int(preferredCount / 2) {
                    let numberOfMatches = (preferredCount - i)
                    dataShells.append(ResultViewSectionData(count: preferredCount, matched: numberOfMatches, baseSpirit: "N/A", cocktails: []))
                }
                return dataShells
            }
        }()
        
        /**Then, loop over every cocktail in the startingCocktailsArray and pull out the cocktails that match with > 50% of the ingredients in the preferredArray. Keeping track of the matched count, add them to the appropriate object in the array of finalMatchedCocktails. */
        for cocktail in startingCocktails {
            
            /** We use let _ = ... to loop over finalMatchContainers to append cocktails that match preferred components to the right section without creating a new array in the process */
            let _ = finalMatchContainers.map { resultViewSectionData in
                
            /** Then we want to match cocktails to sections by calculating the number of components that match the preferred array. */
                if enableMultipleSpiritSelection == false {
                    if resultViewSectionData.matched == selectedPreferredIngredients().reduce(0, { countMatches($0, for: $1, in: cocktail)}) {
                        resultViewSectionData.cocktails.append(cocktail)
                    }
                } else {
                    if resultViewSectionData.matched == selectedPreferredIngredients().reduce(0, { countMatchesForMultipleSpirits($0, for: $1, in: cocktail)}) {
                        if resultViewSectionData.baseSpirit == returnMatchedBase(cocktail, matchedComponents: selectedPreferredIngredients()) && resultViewSectionData.cocktails.last != cocktail {
                            resultViewSectionData.cocktails.append(cocktail)
                        }
                        
                    }
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
    private func modifiedPreferredCount() -> Int {
        // compare preferredComponent against current cocktail of loop, then return number of matches.
        var baseMatches = 0
        multipleBaseSpiritsSelected = false 
        let preferredStrings = selectedPreferredIngredients().map({ $0.name })
        for base in convertOnlyBaseSpiritsIntoStrings() {
            if preferredStrings.contains(base) {
                baseMatches += 1
                multipleBaseSpiritsSelected = true
            }
        }
        let modifiedCount = selectedPreferredIngredients().count - baseMatches + 1
        return modifiedCount
    }
    private func countMatchesForMultipleSpirits(_ currentCount: Int, for preferredComponent: CocktailComponent, in cocktail: Cocktail) -> Int {
        // compare preferredComponent against current cocktail of loop, then return number of matches.
        var matches = currentCount
        var alreadyMatchedSpec = 0
        if let booze = cocktail.compiledTags.booze {
            for spec in booze {
                if spec.name == preferredComponent.name && alreadyMatchedSpec == 0 {
                    matches += 1
                    alreadyMatchedSpec += 1
                }
            }
        }
        if convertAllTagsOmittingBaseSpirits(tags: cocktail.compiledTags, cocktail: cocktail).contains(preferredComponent.name){
            matches += 1
        }
        return matches
    }
    private func convertAllTagsOmittingBaseSpirits(tags: Tags, cocktail: Cocktail) -> [String] {
        var strings: [String] = [String]()
        for bitters in Bitters.allCases {
            strings.append(bitters.rawValue)
        }
        for fortifiedWine in FortifiedWine.allCases {
            strings.append(fortifiedWine.rawValue)
        }
        for liqueur in Liqueur.allCases {
            strings.append(liqueur.rawValue)
        }
        for wine in Wine.allCases {
            strings.append(wine.rawValue)
        }
        for amaro in Amaro.allCases {
            strings.append(amaro.rawValue)
        }
        if let nA = tags.nA {
            strings.append(contentsOf: nA.map({$0.name}))
        }
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
    private func convertOnlyBaseSpiritsIntoStrings() -> [String] {
        var stringArray: [String] = [String]()
        for gin in Gin.allCases {
            stringArray.append(gin.rawValue)
        }
        for brandy in Brandy.allCases {
            stringArray.append(brandy.rawValue)
        }
        for agave in Agave.allCases {
            stringArray.append(agave.rawValue)
        }
        for otherAlcohol in OtherAlcohol.allCases {
            stringArray.append(otherAlcohol.rawValue)
        }
        for rum in Rum.allCases {
            stringArray.append(rum.rawValue)
        }
        for vodka in Vodka.allCases {
            stringArray.append(vodka.rawValue)
        }
        for whiskey in Whiskey.allCases {
            stringArray.append(whiskey.rawValue)
        }
        return stringArray
    }
    func returnMatchedBase(_ cocktail: Cocktail, matchedComponents: [CocktailComponent]) -> String {
        var matchedString = ""
        if let boozeComponents = cocktail.compiledTags.booze {
            for booze in boozeComponents {
                for matched in matchedComponents {
                    if matched.name == booze.name && matched.isSpirit == true && convertOnlyBaseSpiritsIntoStrings().contains(matched.name) {
                        matchedString = matched.name
                    }
                }
            }
        }

        return matchedString
    }
    
    func returnPreferredBaseSpirits() -> [String] {
        var baseArray: [String] = [String]()
        
        for component in selectedPreferredIngredients() {
            if convertOnlyBaseSpiritsIntoStrings().contains(component.name) {
                baseArray.append(component.name)
            }
        }
        return baseArray
    }

}

