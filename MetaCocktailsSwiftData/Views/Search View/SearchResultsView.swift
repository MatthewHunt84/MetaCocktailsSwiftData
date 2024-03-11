//
//  SearchResultsView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 11/26/23.
//

import SwiftUI
import SwiftData

struct SearchResultsView: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        BackButton()
        VStack(alignment: .leading) {
            
            if viewModel.preferredCount > 0 {
                Text("Your Selections (tap to remove)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.leading, 20)
                    .padding(.top, 25)
            }
            
            if !viewModel.cocktailComponents.filter({ $0.isPreferred }).isEmpty {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(viewModel.cocktailComponents.filter({ $0.isPreferred }), id: \.self.id) { selectedIngredient in
                            TagView(selectedIngredient.name, .green, "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        removePreference(for: selectedIngredient)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                    .frame(height: 35)
                }
                .mask(LinearGradient(stops: [.init(color: .clear, location: 0), .init(color: .white, location: 0.05), .init(color: .white, location: 0.95), .init(color: .clear, location: 1)], startPoint: .leading, endPoint: .trailing))
                .scrollClipDisabled(true)
                .scrollIndicators(.hidden)
            }
            
            if !viewModel.cocktailComponents.filter({ $0.isUnwanted }).isEmpty {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(viewModel.cocktailComponents.filter({ $0.isUnwanted }), id: \.self) { selectedIngredient in
                            TagView(selectedIngredient.name, .red, "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                       removeUnwanted(for: selectedIngredient)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                    .frame(height: 35)
                }
                .scrollClipDisabled(true)
                .scrollIndicators(.hidden)
            }
           
            CocktailResultList(viewModel: viewModel, isLoading: $viewModel.isLoading)
                .navigationBarBackButtonHidden(true)
            if viewModel.multipleBaseSpiritsSelectedToEnableMenu {
                Menu("Sort Results") {
                    Button("By number of matches: Apply to a single cocktail.", action: {
                        viewModel.enableResultsForMultipleBaseSpirits = false
                        gitFilteredCocktailsSwiftData()
                    })
                    Button("By Spirit: Separate your results based on the spirit.", action: {
                        viewModel.enableResultsForMultipleBaseSpirits = true
                        gitFilteredCocktailsSwiftData()
                    })
                }
                .padding(10)
                .font(.headline).bold()
                .buttonStyle(BlackNWhiteButton())
                .frame(maxWidth: .infinity, alignment: .center)
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            
            gitFilteredCocktailsSwiftData()
     
        }
        
    }
    
    @ViewBuilder func TagView(_ tag: String, _ color: Color, _ icon: String) -> some View {
        HStack(spacing: 10) {
            Text(tag)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Image(systemName: icon)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 35)
        .foregroundStyle(.black)
        .padding(.horizontal, 15)
        .background {
            Capsule()
                .fill(color.gradient)
        }
        
    }
    // MARK: BEGINNING OF VIEW MODEL MIGRATION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    func gitFilteredCocktailsSwiftData()  {
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
        ///
        
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

        viewModel.isLoading = false
        print("The cocktail count is \(cocktails.count)")
       
        
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
        // FUNCTION NEED ACCESS TO VIEW MODEL
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
    // we had to move this into the view because it calls gitFilteredCocktailsSwiftData() which can't be a static var.
    func removePreference(for component: CocktailComponent) {
        // When we click a green bubble to remove a preferred tag, we change the data and the UI updates.
        
        viewModel.preferredCount -= 1
        let cocktailComponent = viewModel.cocktailComponents.filter ({ $0.id == component.id })
        cocktailComponent.first?.isPreferred = false
        gitFilteredCocktailsSwiftData()
    }
    // we had to move this into the view because it calls gitFilteredCocktailsSwiftData() which can't be a static var.
    func removeUnwanted(for component: CocktailComponent) {
        // When we click a red bubble to remove an unwanted tag, we change the data and the UI updates.
        let cocktailComponent = viewModel.cocktailComponents.filter ({ $0.id == component.id })
        cocktailComponent.first?.isUnwanted = false
        gitFilteredCocktailsSwiftData()
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
    // MARK: END OF VIEW MODEL MIGRATION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
}

struct SearchedCocktailTitleHeader: View {
    
    var searched: Int
    var matched: Int
    
    
    var body: some View {
        HStack {
            
            ForEach(0..<matched, id: \.self) { match in
                Image(systemName: "circle.fill")
                    .foregroundStyle(Color.green)
            }
            
            if matched - searched < 0 {
                ForEach(0..<(searched - matched), id: \.self) { nonMatch in
                    Image(systemName: "circle.fill")
                    
                }
            }
            
            Spacer()
            
            Text("^[\(matched)/\(searched) matches](inflect: true)")
        }
    }
}
struct SearchedCocktailTitleHeaderForMultipleSpirits: View {
    
    var searched: Int
    var matched: Int
    var baseSpirit: String
    
    
    var body: some View {
        HStack {
            Text(baseSpirit)
                .font(.headline).bold()
            ForEach(0..<matched, id: \.self) { match in
                Image(systemName: "circle.fill")
                    .foregroundStyle(Color.green)
            }
            
            if matched - searched < 0 {
                ForEach(0..<(searched - matched), id: \.self) { nonMatch in
                    Image(systemName: "circle.fill")
                    
                }
            }
            
            Spacer()
            
            Text("^[\(matched)/\(searched) matches](inflect: true)")
        }
    }
}


struct SearchedCocktailCell: View {
    
    var cocktail: Cocktail
    
    var body: some View {
        VStack {
            Text("\(cocktail.cocktailName)")
        }
    }
}


#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return SearchResultsView(viewModel: SearchCriteriaViewModel())
        .modelContainer(preview.container)
       
}
