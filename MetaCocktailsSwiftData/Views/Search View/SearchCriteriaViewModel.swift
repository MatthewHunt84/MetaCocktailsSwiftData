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
    @Published var matchedCocktails = [MatchedCocktail]()
    @Published var preferredCount = 0
    @Published var sections = [ResultViewSectionData]()
    @Published var isLoading = true
    @Published var spiritsCategories = [Agave().type.rawValue, Brandy().type.rawValue, Gin().type.rawValue, Other().type.rawValue, Rum().type.rawValue, Vodka().type.rawValue, Whiskies().type.rawValue, Liqueur().type.rawValue, FortifiedWine().type.rawValue, Wine().type.rawValue, Bitters().type.rawValue, Amari().type.rawValue]
    
    
    static func generateBoozeCocktailComponents()  -> [CocktailComponent] {
        
        let boozeCategoryArray: [BoozeCategoryProtocol] = [Agave(), Brandy(), Gin(), Other(), Rum(), Vodka(), Whiskies(), Liqueur(), FortifiedWine(), Wine(), Bitters(), Amari()]
        var boozeArray: [Booze] =  [Booze]()
        var arrayOfComponents: [CocktailComponent] = [CocktailComponent]()
        
        for category in boozeCategoryArray {
            for expression in category.expressions {
                let boozeObject = Booze(expressionName: expression, umbrellaCategory: category.type)
                boozeArray.append(boozeObject)
            }
        }
        for booze in boozeArray {
            arrayOfComponents.append(CocktailComponent(for: booze))
        }
        
        return arrayOfComponents
    }

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
        matchedCocktails.removeAll()
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
        let convertedArray: [CocktailComponent] = generateBoozeCocktailComponents()
        
        
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
    
    // getFilteredCocktails() works, but could be optimized greatly
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
            let convertedArray: [CocktailComponent] = SearchCriteriaViewModel.generateBoozeCocktailComponents()
            preferredBases.append(contentsOf: convertedArray)
        }
        // Make an array of selected styles called PREFERREDSTYLES. If no styles are selected, include all.
        
        var preferredStyles = preferredArray.filter({ $0.isStyle })
        if preferredStyles.isEmpty {
            for style in Style.allCases {
                preferredStyles.append(CocktailComponent(for: style))
            }
        }
        
        
        // Make an array of selected profiles called PREFERREDPROFILES. If no profiles are selected, include all.
        
        var preferredProfiles = preferredArray.filter({ $0.isProfile })
        if preferredProfiles.isEmpty {
            for profile in Profile.allCases {
                preferredProfiles.append(CocktailComponent(for: profile))
            }
        }
        
        // Make an array of selected textures called PREFERREDTEXTURES. If no textures are selected, include all.
        
        var preferredTextures = preferredArray.filter({ $0.isTexture })
        if preferredTextures.isEmpty {
            for texture in Texture.allCases {
                preferredTextures.append(CocktailComponent(for: texture))
            }
        }
        
        // Finally, make an array of selected flavors called PREFERREDFLAVORS only.
        let preferredFlavors = preferredArray.filter({ $0.isFlavor })
        
        // So we now have five arrays of preferred cocktail components by type.
        
        
        // For every cocktail we got, rip out the bases from each one, and if one of those bases matches one from the PREFERREDBASES array, create a NEW array called MATCHEDBASESCOCKTAILS and throw 'em in.
        // A better way to do this would be to filter the CocktailListViewModel().cocktails.CompileTags().bases by those contained in PREFERREDBASES - but that's a TBD.
        for cocktail in CocktailListViewModel().cocktails {
            if let agave = cocktail.CompileTags().agave {
                for agave in agave {
                    for preferred in preferredBases {
                        if agave.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let brandies = cocktail.CompileTags().brandy {
                for brandy in brandies {
                    for preferred in preferredBases {
                        if brandy.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                }
            }
            if let amari = cocktail.CompileTags().amari {
                for amaro in amari {
                    for preferred in preferredBases {
                        if amaro.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let bitters = cocktail.CompileTags().bitters{
                for bitter in bitters {
                    for preferred in preferredBases {
                        if bitter.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let fortifiedWines = cocktail.CompileTags().fortifiedWine {
                for fortifiedWine in fortifiedWines {
                    for preferred in preferredBases {
                        if fortifiedWine.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let gins = cocktail.CompileTags().gin {
                for gin in gins {
                    for preferred in preferredBases {
                        if gin.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let liqueurs = cocktail.CompileTags().liqueur {
                for liqueur in liqueurs {
                    for preferred in preferredBases {
                        if liqueur.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let others = cocktail.CompileTags().other {
                for other in others {
                    for preferred in preferredBases {
                        if other.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let rums = cocktail.CompileTags().rum {
                for rum in rums {
                    for preferred in preferredBases {
                        if rum.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let vodkas = cocktail.CompileTags().vodka {
                for vodka in vodkas {
                    for preferred in preferredBases {
                        if vodka.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let whiskies = cocktail.CompileTags().whiskies {
                for whisky in whiskies {
                    for preferred in preferredBases {
                        if whisky.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
            if let wines = cocktail.CompileTags().wine {
                for wine in wines {
                    for preferred in preferredBases {
                        if wine.rawValue.lowercased() == preferred.name.lowercased() && cocktail != allCocktailsThatMatchBySpirit.last {
                            allCocktailsThatMatchBySpirit.append(cocktail)
                        }
                    }
                    
                }
            }
        }
//        for i in allCocktailsThatMatchBySpirit {
//            print(i.cocktailName)
//        }
        
        // Take our new matchedBasesCocktails array, and rip out all the styles. Filter out the styles that match our PREFERREDSTYLESARRAY, and then add those to a new array called matchedStylesAndBasesCocktails.
        // matchedStylesAndBasesCocktails is therefor a subset of matchedBasesCocktails, that could be filtered
        
        for cocktailWithMatchedSpirit in allCocktailsThatMatchBySpirit {
            if let styles = cocktailWithMatchedSpirit.CompileTags().styles {
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
            if let textures = matchedBasesAndStyles.CompileTags().textures {
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
            if let profiles = matched.CompileTags().profiles {
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

            if let flavors = matched.CompileTags().flavors {
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
            
            if let agave = cocktail.CompileTags().agave {
                for agave in agave {
                    for unwanted in unwantedArray {
                        if agave.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if agave.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let amari = cocktail.CompileTags().amari {
                for amaro in amari {
                    for unwanted in unwantedArray {
                        if amaro.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if amaro.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let bitters = cocktail.CompileTags().bitters {
                for bitter in bitters {
                    for unwanted in unwantedArray {
                        if bitter.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if bitter.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let brandies = cocktail.CompileTags().brandy {
                for brandy in brandies {
                    for unwanted in unwantedArray {
                        if brandy.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if brandy.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let fortifiedWines = cocktail.CompileTags().fortifiedWine {
                for fortifiedWine in fortifiedWines {
                    for unwanted in unwantedArray {
                        if fortifiedWine.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if fortifiedWine.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let gins = cocktail.CompileTags().gin {
                for gin in gins {
                    for unwanted in unwantedArray {
                        if gin.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if gin.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let liqueurs = cocktail.CompileTags().liqueur {
                for liqueur in liqueurs {
                    for unwanted in unwantedArray {
                        if liqueur.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if liqueur.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let others = cocktail.CompileTags().other {
                for other in others {
                    for unwanted in unwantedArray {
                        if other.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if other.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let rums = cocktail.CompileTags().rum {
                for rum in rums {
                    for unwanted in unwantedArray {
                        if rum.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if rum.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let vodkas = cocktail.CompileTags().vodka {
                for vodka in vodkas {
                    for unwanted in unwantedArray {
                        if vodka.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if vodka.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let whiskies = cocktail.CompileTags().whiskies {
                for whisky in whiskies {
                    for unwanted in unwantedArray {
                        if whisky.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if whisky.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            if let wines = cocktail.CompileTags().wine {
                for wine in wines {
                    for unwanted in unwantedArray {
                        if wine.rawValue.lowercased() == unwanted.name.lowercased() {
                            matchedSet.remove(cocktail)
                            matchedCount -= 1
                        }
                    }
                    for preferred in preferredArray {
                        if wine.rawValue.lowercased() == preferred.name.lowercased() {
                            matchedCount += 1
                        }
                    }
                }
            }
            
            // rip out and remove unwanted styles
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
            
            // rip out and remove unwanted flavors
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
            
            // rip out and remove unwanted profiles
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
            
            // rip out and remove unwanted textures
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

            // If the matchedCount is above the threshold (more than half of the preferredCount) we'll store it in an array with its matchedCount data (see MatchedCocktail struct)
            if matchedCount >= (preferredCount / 2) {
                matchedCocktails.append(MatchedCocktail(cocktail: cocktail, count: preferredCount, matchedCount: matchedCount))
            }

            // reset matchedCount for the next loop.
            matchedCount = 0
        }
        // All the loops are done, and the matchedCocktails array should now be filled with data.
        
        // create sections for the Listview using the matchedCocktails array data we just gathered.
        for i in 0...Int(preferredCount / 2) {

            let numberOfMatches = (preferredCount - i)
            // numberOfMatches will give us a the right section name. For example if preferredCount = 4 then numberOfMatches will be: (4-0 = 4 on the first loop, 4 - 1 = 3 on the second loop, 4 - 2 = 2 on the next loop, and then we stop because our cutoff is preferredCount / 2. Note that if preferredcount is an odd number, Int(count / 2) will round down which is why we're starting the loop at 0 instead of 1)
            
            // then yank all the cocktails that match and chuck them in an array
            var bucketOfCocktails = [Cocktail]()
            
            for matchedCocktail in matchedCocktails where matchedCocktail.matchedCount == numberOfMatches {
                bucketOfCocktails.append(matchedCocktail.cocktail)
            }
            
            // then pass that bucket of cocktails into a ResultViewSectionData struct, which is just a simple struct that also has the total count and matched count info. This struct has all the data we'll need to pass to the List Section header so it can say "Matched 3 of 4" or whatever at the top and the pass the in the appropriate cocktail array
            if !bucketOfCocktails.isEmpty {
                sections.append(ResultViewSectionData(count: preferredCount,
                                                      matched: preferredCount - i,
                                                      cocktails: bucketOfCocktails))
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
    
    static func == (lhs: CocktailComponent, rhs: CocktailComponent) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    
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
    var spiritCategory: boozeCategory?
 

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
        self.name = booze.expressionName
        self.isSpirit = true
        self.preferenceType = .spirits
        self.matchesCurrentSearch = true
        self.spiritCategory = booze.umbrellaCategory
    }
   
}


