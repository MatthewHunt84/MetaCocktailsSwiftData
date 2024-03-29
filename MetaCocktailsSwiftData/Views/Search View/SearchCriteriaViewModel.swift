//
//  SearchCriteriaViewModel2.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/10/23.
//

import SwiftUI
import Observation


@Observable
final class SearchCriteriaViewModel: ObservableObject {

    static var generatedNACocktailComponents: [CocktailComponent] = {
        var cocktailComponentArrayForNA = [CocktailComponent]()
        
        cocktailComponentArrayForNA.append(contentsOf: Syrup.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Juice.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Herbs.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Fruit.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Seasoning.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Soda.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: OtherNA.allCases.map({ $0.nAComponent}))
        return cocktailComponentArrayForNA
        //return cocktailComponentArrayForNA
    }()
    static var generatedBoozeCocktailComponents: [CocktailComponent] = {
        
        var CocktailComponentArrayForBooze = [CocktailComponent]()
        
        CocktailComponentArrayForBooze.append(contentsOf: Agave.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Brandy.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Gin.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: OtherAlcohol.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Rum.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Vodka.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Whiskey.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Liqueur.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: FortifiedWine.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Wine.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Bitters.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Amaro.allCases.map { $0.cockTailComponent })
        
        return CocktailComponentArrayForBooze
    }()
    var cocktailComponents:  [CocktailComponent] = {
        
        var array = [CocktailComponent]()
        let convertedBoozeArray: [CocktailComponent] = SearchCriteriaViewModel.generatedBoozeCocktailComponents
        let convertedNAArray: [CocktailComponent] = SearchCriteriaViewModel.generatedNACocktailComponents
        
        for flavor in Flavor.allCases {
            array.append(CocktailComponent(for: flavor))
        }
        for profile in Profile.allCases {
            array.append(CocktailComponent(for: profile))
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
        
        return array.sorted(by: { $0.name < $1.name })
    }()
 
    var searchText: String = ""
    var preferredCount = 0
    var sections = [ResultViewSectionData]()
    var enableResultsForMultipleBaseSpirits = false
    var isLoading = true
    var multipleBaseSpiritsSelectedToEnableMenu: Bool = false
    var isShowingSearchButton: Bool = false
    var showWilliamsAndGrahamCocktails: Bool = false
    var boozeCategories = {Array(Set(generatedBoozeCocktailComponents.map({$0.spiritCategoryName}))).sorted()}()
    var nACategories = {Array(Set(generatedNACocktailComponents.map({$0.nACategoryName}))).sorted()}()
    var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var cocktailListAlphabet = ["pencil.circle.fill", "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var baseSpiritsConvertedIntoStrings: [String] =  {
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
       
       return self.cocktailComponents.filter({ $0.isPreferred })
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
    
   func modifiedPreferredCount() -> Int {
        // compare preferredComponent against current cocktail of loop, then return number of matches.
        var baseMatches = 0

        let preferredStrings = selectedPreferredIngredients().map({ $0.name })
        for base in baseSpiritsConvertedIntoStrings {
            if preferredStrings.contains(base) {
                baseMatches += 1
            }
        }
        let modifiedCount = selectedPreferredIngredients().count - baseMatches + 1
        return modifiedCount
    }

    func returnPreferredBaseSpirits() -> [String] {
        var baseArray: [String] = [String]()
        
        for component in cocktailComponents.filter({ $0.isPreferred }) {
            if baseSpiritsConvertedIntoStrings.contains(component.name) {
                baseArray.append(component.name)
            }
        }
        return baseArray
    }
}



// MARK: VIEW MODEL MIGRATION

extension SearchResultsView {
    
    func getFilteredCocktailsSwiftData()  {
        var startingCocktails: [Cocktail] = []
        viewModel.isLoading = true
        viewModel.resetSearchCriteria()
        if viewModel.returnPreferredBaseSpirits().count > 1 {
            viewModel.multipleBaseSpiritsSelectedToEnableMenu = true
        } else {
            viewModel.multipleBaseSpiritsSelectedToEnableMenu = false
        }
       

        /** First, loop over every cocktail and add any cocktails that don't match any unwanted preferences to create the StartingCocktails array. */
        /// Start with the appropriate set of cocktails for the corresponding mode
        
        startingCocktails = filterUnwantedCocktails(cocktailComponentArray: viewModel.selectedUnwantedIngredients(), cocktails: cocktails)
        
//        if viewModel.showWilliamsAndGrahamCocktails {
//            startingCocktails = filterUnwantedCocktails(cocktailComponentArray: viewModel.selectedUnwantedIngredients(), cocktails: CocktailListViewModel().justWilliamsAndGrahamCocktails)
//        }
        
        /**loop over the number of preferredCount / 2 and create ResultViewSectionData objects with count and matched numbers filled in but empty cocktail arrays.
        Let's say the preferred count is 5. make one object for 5 matches with the count being 5 and the matched being 5 but and empty cocktail array, one object for 4 matches with the count being 5 and the matched being 4 but and empty cocktail array. Finally, an object for 3 matches with the count being 5 but the matched being 3. No more objects will be made for 2 or 1 because those are less than a 50% match. This means we have the possibility for 3 total sections in the returned ResultViewSectionData. */
        let finalMatchContainers: [ResultViewSectionData] = {
            var dataShells = [ResultViewSectionData]()
            if viewModel.enableResultsForMultipleBaseSpirits == true {
                /** If we're searching for separate base spirits, we need to add more shells. One for each base spirit searched in each match number about 50%. We also need to use a modified preferredCount that counts all spirits as a total of one. */
                viewModel.preferredCount = viewModel.modifiedPreferredCount()
                for i in 0...Int(viewModel.preferredCount / 2) {
                    let numberOfMatches = (viewModel.preferredCount - i)
                    for spirit in viewModel.returnPreferredBaseSpirits() {
                        dataShells.append(ResultViewSectionData(count: viewModel.preferredCount, matched: numberOfMatches, baseSpirit: spirit, cocktails: []))
                    }
                }
                return dataShells
            } else {
                /**Otherwise search normaly, allowing individual base spirits to add to the total search count.**/
                viewModel.preferredCount = viewModel.selectedPreferredIngredients().count
                for i in 0...Int(viewModel.preferredCount / 2) {
                    let numberOfMatches = (viewModel.preferredCount - i)
                    dataShells.append(ResultViewSectionData(count: viewModel.preferredCount, matched: numberOfMatches, baseSpirit: "N/A", cocktails: []))
                }
                return dataShells
            }
        }()
        /**Then, loop over every cocktail in the startingCocktailsArray and pull out the cocktails that match with > 50% of the ingredients in the preferredArray. Keeping track of the matched count, add them to the appropriate object in the array of finalMatchedCocktails. */
        for cocktail in startingCocktails {
            
            /** We use let _ = ... to loop over finalMatchContainers to append cocktails that match preferred components to the right section without creating a new array in the process */
            let _ = finalMatchContainers.map { resultViewSectionData in
                
            /** Then we want to match cocktails to sections by calculating the number of components that match the preferred array. */
                if viewModel.enableResultsForMultipleBaseSpirits == false {
                    if resultViewSectionData.matched == viewModel.selectedPreferredIngredients().reduce(0, { countMatches($0, for: $1, in: cocktail)}) {
                        resultViewSectionData.cocktails.append(cocktail)
                    }
                } else {
                    if resultViewSectionData.matched == countMatchesForMultipleSpirits(for: cocktail) && resultViewSectionData.baseSpirit == returnMatchedBase(cocktail) && resultViewSectionData.cocktails.last != cocktail {
                            resultViewSectionData.cocktails.append(cocktail)
                        //print("the count match for \(cocktail.cocktailName) is \(countMatchesForMultipleSpirits(for: cocktail))")
                    }
                }
            }
        }
        
        /** Finally, we then return an array of matching cocktails as an array of ResultSectionViewData objects, checking to make sure the sections aren't empty. */
        viewModel.sections.append(contentsOf: finalMatchContainers.filter({ !$0.cocktails.isEmpty}))
         
        /** (alternatively we do the same thing with compactMap and just cast the non-matches as optionals and compactMap will remove them for us)
                i.e.
            sections = finalMatchContainers.compactMap { resultSectionData in
            return resultSectionData.cocktails.isEmpty ? nil : resultSectionData } */
        print("The cocktail count is \(cocktails.count)")
        viewModel.isLoading = false
    }
    
    private func countMatchesForMultipleSpirits(for cocktail: Cocktail) -> Int {
        // compare preferredComponent against current cocktail of loop, then return number of matches.
        var justBases = [String]()
        var alreadyMatchedSpec = 0
        if let booze = cocktail.compiledTags.booze {
            for booze in booze {
                if !viewModel.baseSpiritsConvertedIntoStrings.contains(booze.name) {
                    justBases.append(booze.name)
                }
            }
        }

        let matches = viewModel.cocktailComponents.filter({ $0.isPreferred }).reduce(into: 0, { partialResult, component in
            for spec in justBases {
                if spec == component.name && alreadyMatchedSpec == 0 {
                    partialResult += 1
                    alreadyMatchedSpec += 1
                }
            }
            if convertAllTagsOmittingBaseSpirits(tags: cocktail.compiledTags, cocktail: cocktail).contains(component.name){
                    partialResult += 1
                }
        })
        return matches
    }
                                                                                        
    private func convertAllTagsOmittingBaseSpirits(tags: Tags, cocktail: Cocktail) -> [String] {
        var strings: [String] = [String]()
        if let boozeComponents = tags.booze {
            for booze in boozeComponents {
                if viewModel.baseSpiritsConvertedIntoStrings.contains(booze.name) {
                    strings.append(booze.name)
                }
            }
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
        if let profiles = tags.profiles {
            strings.append(contentsOf: profiles.map({$0.rawValue}))
        }
        return Array(Set(strings))
        
    }

    private func returnMatchedBase(_ cocktail: Cocktail) -> String {
        var matchedString = ""
        if let boozeComponents = cocktail.compiledTags.booze {
            for booze in boozeComponents {
                for matched in viewModel.cocktailComponents.filter({ $0.isPreferred }) {
                    if matched.name == booze.name && viewModel.baseSpiritsConvertedIntoStrings.contains(matched.name) {
                        matchedString = matched.name
                    }
                }
            }
        }
        return matchedString
    }
    
    // we had to move this into the view because it calls getFilteredCocktailsSwiftData() which can't be a static var.
    func removePreference(for component: CocktailComponent) {
        // When we click a green bubble to remove a preferred tag, we change the data and the UI updates.
        
        viewModel.preferredCount -= 1
        let cocktailComponent = viewModel.cocktailComponents.filter ({ $0.id == component.id })
        cocktailComponent.first?.isPreferred = false
        getFilteredCocktailsSwiftData()
    }
    
    // we had to move this into the view because it calls getFilteredCocktailsSwiftData() which can't be a static var.
    func removeUnwanted(for component: CocktailComponent) {
        // When we click a red bubble to remove an unwanted tag, we change the data and the UI updates.
        let cocktailComponent = viewModel.cocktailComponents.filter ({ $0.id == component.id })
        cocktailComponent.first?.isUnwanted = false
        getFilteredCocktailsSwiftData()
    }
    
    func convertTagsAndSpecToStrings(for cocktail: Cocktail) -> [String] {
        var strings: [String] = [String]()
        strings.append(contentsOf: cocktail.spec.map({$0.ingredient.name}))
        if let booze = cocktail.compiledTags.booze {
            strings.append(contentsOf: booze.map({$0.name}))
        }
        if let flavors = cocktail.compiledTags.flavors {
            strings.append(contentsOf: flavors.map({$0.rawValue}))
        }
        if let styles = cocktail.compiledTags.styles {
            strings.append(contentsOf: styles.map({$0.rawValue}))
        }
        if let profiles = cocktail.compiledTags.profiles {
            strings.append(contentsOf: profiles.map({$0.rawValue}))
        }
        if let nA = cocktail.compiledTags.nA {
            strings.append(contentsOf: nA.map({$0.name}))
        }
        return Array(Set(strings))
    }
    
    func filterUnwantedCocktails(cocktailComponentArray: [CocktailComponent], cocktails: [Cocktail]) -> [Cocktail] {
         cocktails.filter { cocktail in
             cocktailComponentArray.allSatisfy { unwantedComponent in
                !convertTagsAndSpecToStrings(for: cocktail).contains(unwantedComponent.name)
            }
        }
    }
    
    func countMatches(_ currentCount: Int, for preferredComponent: CocktailComponent, in cocktail: Cocktail) -> Int {
        // compare preferredComponent against current cocktail of loop, then return number of matches.
        var matches = currentCount
        if convertTagsAndSpecToStrings(for: cocktail).contains(preferredComponent.name){
            matches += 1
        }
        return matches
    }
    
   
}


