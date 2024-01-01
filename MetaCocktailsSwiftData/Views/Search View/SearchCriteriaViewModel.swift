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
    @Published var finalMatchedCocktails = [MatchedCocktail]()
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
    
    func selectedUnwantedIngredients() -> [String] {
        self.cocktailComponents.filter({ $0.isUnwanted }).map({$0.name})
    }
    
    func add(_ ingredient: CocktailComponent){
        cocktailComponents.append(ingredient)
    }
    
    func remove(at offsets: IndexSet){
        cocktailComponents.remove(atOffsets: offsets)
    }
    
    func resetSearchCriteria() {
        preferredCount = 0
        finalMatchedCocktails.removeAll()
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
    func getFilteredCocktails2() {
        // start loading bool at true so that we can add a loading animation when the data gets larger
        // MARK: isLoading = true
        // reset search criteria
        // MARK: resetSearchCriteria()
        //         create an array of selectedPreferredIngredients that are of type CocktailComponent
        // MARK: let preferredArray = selectedPreferredIngredients()
        //         create an array of UnwantedIngredients that are of type CocktailComponent
        // MARK: let unwantedArray = selectedUnwantedIngredients()
        //         create a preference count that is the total number of preferences
        // MARK: preferredCount = selectedPreferredIngredients().count
        // create an array, called matchedCocktails, of resultViewSectionData objects by going over the preferredCount and creating an object for each number that is above %50 of the preferred count.
        // MARK: finalMatchedCocktails: [ResultViewSectionData] = {   loop over the number of preferredCount / 2 and create empty ResultViewSectionData objects   }
        // say the preferred count is 5. make one object for 5 matches, one object for 4 matches and one object for 3 matches. No more objects will be made for 2 or 1 because those are less than a 50% match. This means we have the possibility for 3 total sections in the returned ResultViewSectionData.
        
        //first, loop over every cocktail in CocktailListViewModel().cocktails and add any cocktails that don't match any unwanted preferences to create the STARTINGCOCKTAILS array.
        // MARK: let startingCocktails: [Cocktail] =  CocktailListViewModel().cocktails.filter { filter out any cocktails that don't have any unwanted ingredients and add them to the starting cocktails array. }
        //         Then, loop over every cocktail in STARTINGCOCKTAILSARRAY and pull out the cocktails that match with each ingredient in the preferredArray, keeping track of the matched count, and add them to the appropriate object in the array of finalMatchedCocktails. As in the example above, there are three options for matches: 5,4 and 3.
        // MARK:  for cocktail in startingCocktails { for ingredient in preferredArray { for ingredients in cocktail { if an ingredient is matched, 1 point is added to the internal matched count. Points are added up until they've gone over every ingredient in preferredArray. if the matched count is 3, the cocktail gets added to finalMatchedCocktails[0].cocktails. If the match is 4, the cocktail gets added to finalMatchedCocktails[1].cocktails etc.
        //
        //         Finally, we then return an array of matching cocktails as an array of ResultSectionViewData objects, checking to make sure the sections aren't empty.
        //  MARK: for sections in finalMatchedCocktails { if !bucketOfCocktails.isEmpty { sections.append(ResultViewSectionData(count: preferredCount, matched: preferredCount - i,  cocktails: bucketOfCocktails)) }
        //
        
        //
        //
    }
    
     
    func getFilteredCocktails() {
        
        isLoading = true
        resetSearchCriteria()
        
        let preferredArray = selectedPreferredIngredients()
        preferredCount = selectedPreferredIngredients().count
        
        let unwantedArray = selectedUnwantedIngredients()
        var totalMatchedCocktails: [Cocktail] = []
        var allCocktailsThatMatchBySpirit: [Cocktail] = []
        var matchedStylesAndBasesCocktails: [Cocktail] = []
        var matchedTexturesBasesAndStylesCocktails: [Cocktail] = []
        var matchedProfilesTexturesBasesAndStylesCocktails: [Cocktail] = []
        let flavorCount = selectedPreferredIngredients().filter({ $0.isFlavor }).count
        var matchedCount = 0
        
        // Make an array of selected bases called PREFERREDBASES. If no bases are selected, include all.
        
        var preferredBases: [CocktailComponent] = preferredArray.filter({ $0.isSpirit })
        if preferredBases.isEmpty {
            let convertedArray: [CocktailComponent] = SearchCriteriaViewModel.generatedBoozeCocktailComponents
            preferredBases.append(contentsOf: convertedArray)
        }
        // Make an array of selected styles called PREFERREDSTYLES. If no styles are selected, include all.
        
        var preferredStyles = preferredArray.filter({ $0.isStyle })
        if preferredStyles.isEmpty {
            preferredStyles = Style.allCases.map({CocktailComponent(for: $0)})
        }
        
        // Make an array of selected profiles called PREFERREDPROFILES. If no profiles are selected, include all.
        
        var preferredProfiles = preferredArray.filter({ $0.isProfile })
        if preferredProfiles.isEmpty {
            preferredProfiles = Profile.allCases.map({CocktailComponent(for: $0)})
        }
        
        // Make an array of selected textures called PREFERREDTEXTURES. If no textures are selected, include all.
        
        var preferredTextures = preferredArray.filter({ $0.isTexture })
        if preferredTextures.isEmpty {
            preferredTextures = Texture.allCases.map({CocktailComponent(for: $0)})
        }
        
        
        // Finally, make an array of selected flavors called PREFERREDFLAVORS only.
        let preferredFlavors = preferredArray.filter({ $0.isFlavor })
        
        // So we now have five arrays of preferred cocktail components by type.
        // For every cocktail we got, rip out the bases from each one, and if one of those bases matches one from the PREFERREDBASES array, create a NEW array called MATCHEDBASESCOCKTAILS and throw 'em in.
        // A better way to do this would be to filter the CocktailListViewModel().cocktails.CompileTags().bases by those contained in PREFERREDBASES - but that's a TBD.
        
        for cocktail in CocktailListViewModel().cocktails {
            
            if let boozeTypes = cocktail.compiledTags.booze { // called first here, which is to be expected
                for booze in boozeTypes {
                    for preferred in preferredBases {
                        if booze.name.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last  {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                }
            }
        }
        
        // Take our new matchedBasesCocktails array, and rip out all the styles. Filter out the styles that match our PREFERREDSTYLESARRAY, and then add those to a new array called matchedStylesAndBasesCocktails.
        // matchedStylesAndBasesCocktails is therefor a subset of matchedBasesCocktails, that could be filtered
        
        for cocktailWithMatchedSpirit in allCocktailsThatMatchBySpirit {
            if let styles = cocktailWithMatchedSpirit.compiledTags.styles {
                for style in styles {
                    for preferred in preferredStyles {
                        if style.rawValue.lowercased() == preferred.name.lowercased() && cocktailWithMatchedSpirit != matchedStylesAndBasesCocktails.last {
                            matchedStylesAndBasesCocktails.append(cocktailWithMatchedSpirit)
                        }
                    }
                }
            }
        }
        
        // Take this smaller subset of cocktails, rip out the textures, and if any of them match selected textures make a NEW ARRAY of just those.
        
        for matchedBasesAndStyles in matchedStylesAndBasesCocktails {
            if let textures = matchedBasesAndStyles.compiledTags.textures {
                for texture in textures {
                    for preferredTexture in preferredTextures {
                        if texture.rawValue.lowercased() == preferredTexture.name.lowercased() && matchedBasesAndStyles != matchedTexturesBasesAndStylesCocktails.last {
                            matchedTexturesBasesAndStylesCocktails.append(matchedBasesAndStyles)
                        }
                    }
                }
            }
        }
        
        // Finally, rip out the profiles and create a new array containing any that match.
        for matched in matchedTexturesBasesAndStylesCocktails {
            if let profiles = matched.compiledTags.profiles {
                for profile in profiles {
                    for preferredProfile in preferredProfiles {
                        if profile.rawValue.lowercased() == preferredProfile.name.lowercased() && matched != matchedProfilesTexturesBasesAndStylesCocktails.last {
                            matchedProfilesTexturesBasesAndStylesCocktails.append(matched)
                        }
                    }
                }
            }
        }
        
        // So at this point we have 4 different arrays, like Russian dolls. Flavors have not been considered at this point.
        // We instantiate a var called matchedCount as zero
        // Then for every cocktail in the smallest Russian doll, rip out all the flavors. If any of those match against what we have in the preferredFlavors array, up the matchedCount by 1
        
        for matched in matchedProfilesTexturesBasesAndStylesCocktails {
            var internalMatchedCounter = 0
            
            if let flavors = matched.compiledTags.flavors {
                for flavor in flavors {
                    for preferredFlavor in preferredFlavors {
                        if flavor.rawValue.lowercased() == preferredFlavor.name.lowercased() {
                            internalMatchedCounter += 1
                        }
                    }
                }
            }
            
            // If a cocktail from the shortlist matches EVERY flavor from the preferredFlavor array add that cocktail to the totalMatchedCocktail array.
            if internalMatchedCounter == flavorCount  {
                totalMatchedCocktails.append(matched)
            }
        }
        
        // if the user hasn't selected any flavors, move all the cocktails through to the totalMatchedCocktails array.
        if flavorCount == 0 {
            totalMatchedCocktails = matchedProfilesTexturesBasesAndStylesCocktails
        }
        
        var matchedSet = Set(totalMatchedCocktails)
        
        
        
        // take each cocktail from the new final array that also matches flavors, and rip out the bases..
        // if the base is in the unwanted array, remove it from the final array and update the matchedcount.
        
        for cocktail in matchedSet {
            
            if let boozeTypes = cocktail.compiledTags.booze {
                for booze in boozeTypes {
                    for unwanted in unwantedArray {
                        if booze.name.lowercased() == unwanted.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                        
                    }
                    for preferred in preferredArray {
                        if booze.name.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            
            // rip out and remove unwanted styles
            if let styles = cocktail.compiledTags.styles {
                for style in styles {
                    for unwanted in unwantedArray {
                        if style.rawValue.lowercased() == unwanted.lowercased() {
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
            
            
            // rip out and remove unwanted flavors
            if let flavors = cocktail.compiledTags.flavors {
                for flavor in flavors {
                    for unwanted in unwantedArray {
                        if flavor.rawValue.lowercased() == unwanted.lowercased() {
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
            
            
            // rip out and remove unwanted profiles
            if let profiles = cocktail.compiledTags.profiles {
                for profile in profiles {
                    for unwanted in unwantedArray {
                        if profile.rawValue.lowercased() == unwanted.lowercased() {
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
            
            // rip out and remove unwanted textures
            if let textures = cocktail.compiledTags.textures {
                for texture in textures {
                    for unwanted in unwantedArray {
                        if texture.rawValue.lowercased() == unwanted.lowercased() {
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
            
            // If the matchedCount is above the threshold (more than half of the preferredCount) we'll store it in an array with its matchedCount data (see MatchedCocktail struct)
            if matchedCount >= (preferredCount / 2) {
                finalMatchedCocktails.append(MatchedCocktail(cocktail: cocktail, count: preferredCount, matchedCount: matchedCount))
            }
            // reset matchedCount for the next loop.
            matchedCount = 0
        }
        // All the loops are done, and the matchedCocktails array should now be filled with data.
        
        // create sections for the Listview using the matchedCocktails array data we just gathered.
        for i in 0...Int(preferredCount / 2) {
            let numberOfMatches = (preferredCount - i)
            // numberOfMatches will give us a the right section name. For example if preferredCount = 4 then numberOfMatches will be: (4-0 = 4 on the first loop, 4 - 1 = 3 on the second loop, 4 - 2 = 2 on the next loop, and then we stop because our cutoff is preferredCount / 2. Note that if preferredCount is an odd number, Int(count / 2) will round down which is why we're starting the loop at 0 instead of 1)
            
            // then yank all the cocktails that match and chuck them in an array
            var bucketOfCocktails = [Cocktail]()
            
            for matchedCocktail in finalMatchedCocktails where matchedCocktail.matchedCount == numberOfMatches {
                bucketOfCocktails.append(matchedCocktail.cocktail)
            }
            
            // then pass that bucket of cocktails into a ResultViewSectionData struct, which is just a simple struct that also has the total count and matched count info. This struct has all the data we'll need to pass to the List Section header so it can say "Matched 3 of 4" or whatever at the top and the pass the in the appropriate cocktail array
            if !bucketOfCocktails.isEmpty {
                
                sections.append(ResultViewSectionData(count: preferredCount,
                                                      matched: preferredCount - i,
                                                      cocktails: bucketOfCocktails))
            } else {
                
            }
        }
        isLoading = false
    }
    
    
}
struct CocktailResultList: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel
    var body: some View {
        
        
        VStack {
            
            if viewModel.isLoading {
                ZStack(alignment: .center) {
                    
                    Color.red
                    
                    Text("Couldn't load in time")
                }
            } else {
                if viewModel.preferredCount > 0 {
                    
                    List {
                        ForEach(viewModel.sections, id: \.self.id) { result in
                            
                            Section(header: SearchedCocktailTitleHeader(searched: result.count, matched: result.matched)) {
                                
                                ForEach(result.cocktails, id: \.self.id) { cocktail in
                                    
                                    NavigationLink {
                                        RecipeIngredientsView(cocktail: cocktail)
                                    } label: {
                                        Text(cocktail.cocktailName)
                                    }
                                    
                                }
                            }
                        }
                    }
                    .listStyle(.grouped)
                } else  {
                    
                    ZStack(alignment: .center) {
                        
                        Color.teal
                        
                        Text("Add more preferences to continue")
                    }
                }
            }
            Spacer()
        }
    }
}


struct MatchedCocktail: Equatable {
    let cocktail: Cocktail
    let count: Int
    let matchedCount: Int
}

struct ResultViewSectionData {
    let id = UUID()
    let count: Int
    let matched: Int
    let cocktails: [Cocktail]
}

class CocktailComponent: Identifiable, ObservableObject, Hashable {
    
    // I don't love this, but it will work for now..
    
    @Published var matchesCurrentSearch: Bool
    var id = UUID()
    var name: String
    @Published var isPreferred: Bool = false
    @Published var isUnwanted: Bool = false
    var isSpirit: Bool = false
    var isFlavor: Bool = false
    var isProfile: Bool = false
    var isStyle: Bool = false
    var isTexture: Bool = false
    var preferenceType: PreferenceType
    var spiritCategory: IngredientType?
    var spiritCategoryName: String = ""
    
    
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
    
    init(for booze: Booze) {
        self.name = booze.ingredientType.name
        self.isSpirit = true
        self.preferenceType = .spirits
        self.matchesCurrentSearch = true
        self.spiritCategory = booze.ingredientType
        self.spiritCategoryName = booze.ingredientType.category
    }
    
    static func == (lhs: CocktailComponent, rhs: CocktailComponent) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
}


