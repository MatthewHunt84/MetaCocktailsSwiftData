//
//  CreateACocktailViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/26/24.
//


import SwiftUI
import SwiftData
import Combine

@Observable final class AddCocktailViewModel {

    var isRiff: Bool = false
    var isEdit: Bool = false
    var isAboutToClearForm = false
    var hasNoData: Bool = false 
    
    //AddIngredientView
    var category: UmbrellaCategory = UmbrellaCategory.agaves
    var ingredientAmount: Double? = nil
    var ingredientTags = Tags()
    var selectedMeasurementUnit = MeasurementUnit.fluidOunces
    var filteredIngredients: [IngredientBase] = []

    var isShowingAlert: Bool = false
    
    var  formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    // Required
    var cocktailName: String = ""
    var isShowingUniqueNameAlert: Bool = false
    
    // Ingredients
    var ingredientName = ""
    var info: String?
    var addedIngredients: [Ingredient] = []
    var editedIngredient: Ingredient? = nil  
    var didChooseExistingIngredient: Bool = false
    var isShowingingredientAlert: Bool = false
 
    //Garnish
    var addedGarnish: [Garnish] = []
    var currentGarnishName: String = ""
    var customGarnishNameEntered: String? 
    var didChooseExistingGarnish: Bool = false
    var filteredGarnish: [String] = []
    
    // Extras
    var uniqueGlasswareName: Glassware?
    var glasswareName = "None"
    var ice: Ice? = Ice.none
    var variation: Variation? = Variation.none
    var customVariationName: String?
    
    var currentIngredientUUID: UUID = UUID()
    
    //Custom ingredient recipe prep
    var prep: Prep?
    var prepIngredientRecipe: [Instruction] = []
    
    // Author
    var authorName: String = ""
    var authorPlace: String = ""
    var authorYear: String = ""
    var author: Author?
    
    // Cocktail Build Instructions
    var build: Build = Build(instructions: [])
    var currentBuildInstructionUUID: UUID = UUID()
    var currentBuildStep: Int = 0
    var currentMethod: String = ""
    var buildOption: Build?
    func validateBuildInstructions() {
        if build.instructions != [] {
            buildOption = build
        }
    }
    
    var searchText = ""
    private var debouncedSearchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let searchSubject = PassthroughSubject<String, Never>()
    
    func resetSearch() {
        searchText = ""
        debouncedSearchText = ""
        filteredCocktails = []
    }
    
    func listHasData() -> Bool {
        cocktailName == "" &&
        addedGarnish.isEmpty &&
        glasswareName == "None" &&
        ice == Ice.none &&
        variation == Variation.none &&
        addedIngredients.isEmpty &&
        authorName == "" &&
        authorPlace == "" &&
        authorYear == "" &&
        build.instructions.isEmpty
    }
    
    func clearData() {
        cocktailName = ""
        authorName = ""
        authorPlace = ""
        authorYear = ""
        currentGarnishName = ""
        uniqueGlasswareName = .blueBlazerMugs
        glasswareName = "None"
        ice = Ice.none
        addedGarnish = []
        variation = nil
        addedIngredients = []
        build = Build(instructions: [])
        buildOption = nil
        customVariationName = nil
        currentIngredientUUID = UUID()
        clearIngredientData()
        isAboutToClearForm = false
        hasNoData = true
    }
    
    func clearIngredientData() {
        ingredientName = ""
        currentGarnishName = ""
        ingredientAmount = nil
        prep = nil
        selectedMeasurementUnit = .fluidOunces
        prepIngredientRecipe = []
        didChooseExistingIngredient = false
        didChooseExistingGarnish = false
        isEdit = false
    }

    func populateFromCocktail(_ cocktail: Cocktail) {
        cocktailName = "Riff on " + cocktail.cocktailName
        
        // Clear existing ingredients first
        addedIngredients.removeAll()
        
        // Populate new ingredients one by one
        //Make a copy of the spec so SwiftData doesn't reassign the spec.
        for ingredientSpec in cocktail.spec {
            let newIngredientBase = IngredientBase(id: UUID(),
                                                   name: ingredientSpec.ingredientBase.name,
                                                   info: ingredientSpec.ingredientBase.info,
                                                   category: UmbrellaCategory(rawValue: ingredientSpec.ingredientBase.umbrellaCategory) ?? .otherAlcohol,
                                                   tags: ingredientSpec.ingredientBase.tags,
                                                   prep: ingredientSpec.ingredientBase.prep
            )
            let newIngredient = Ingredient(id: UUID(),
                                           ingredientBase: newIngredientBase,
                                           value: ingredientSpec.value,
                                           unit: ingredientSpec.unit
            )
            addedIngredients.append(newIngredient)
            
        }
        uniqueGlasswareName = Glassware(rawValue: cocktail.glasswareType.rawValue)
        glasswareName = cocktail.glasswareType.rawValue
        addedGarnish = cocktail.garnish.map { Garnish(name: $0.name) }
        if let cocktailIce = cocktail.ice {
            ice = Ice(rawValue: cocktailIce.rawValue)
        }
        authorYear = String(Calendar.current.component(.year, from: Date()))
        customVariationName = cocktail.cocktailName
        isRiff = true
    }

    
    func isValid() -> Bool {
        return cocktailName != "" && ((addedIngredients.count) > 1) && uniqueGlasswareName != nil
    }
    
    func existingIngredientIsValid(allIngredients: [IngredientBase]) -> Bool {
        return ingredientAmount != nil &&
        allIngredients.contains(where: { $0.name == ingredientName }) 
    }
    
    func existingGarnishIsValid(allGarnishes: [Garnish]) -> Bool {
        
        return didChooseExistingGarnish == true &&
        allGarnishes.contains(where: { $0.name == currentGarnishName }) &&
        !addedGarnish.contains(where: { $0.name == currentGarnishName })
    }
    
    @MainActor
    func addExistingGarnishToCocktail(context: ModelContext) {
        Task {
         
            let fetchDescriptor = FetchDescriptor<Garnish>(predicate: #Predicate { $0.name == currentGarnishName })
            
            await MainActor.run {
                let existingGarnish = try? context.fetch(fetchDescriptor).first
                if let foundGarnish =  existingGarnish {
                    addedGarnish.append(foundGarnish)
                } else {
                    isShowingingredientAlert.toggle()
                }
            }
            clearIngredientData()
        }
    }
    
    
    @MainActor
    func addCocktailToModel(context: ModelContext) {
        validateAuthor()
        validateBuildInstructions()

        let cocktail = Cocktail(cocktailName: cocktailName,
                                glasswareType: uniqueGlasswareName!,
                                garnish: addedGarnish,
                                ice: ice,
                                author: Author(person: authorName, place: authorPlace, year: authorYear),
                                spec: addedIngredients,
                                buildOrder: buildOption,
                                tags: ingredientTags,
                                variation: variation,
                                variationName: customVariationName,
                                collection: .custom,
                                isCustomCocktail: true)

        cocktail.spec.forEach { ingredient in
            // Check if an IngredientBase with the same name already exists
            let fetch = FetchDescriptor<IngredientBase>(predicate: #Predicate { $0.name == ingredient.ingredientBase.name })
            if let existingBase = try? context.fetch(fetch).first {
                // If it exists, update the existing IngredientBase
                existingBase.info = ingredient.ingredientBase.info
                existingBase.tags = ingredient.ingredientBase.tags
                existingBase.prep = ingredient.ingredientBase.prep
                ingredient.ingredientBase = existingBase
                ingredient.ingredientBase.isCustom = false
            } else {
                // If it doesn't exist, insert the new IngredientBase
                ingredient.ingredientBase.isCustom = false
                context.insert(ingredient.ingredientBase)
            }
        }
        context.insert(cocktail)
        do {
            try context.save()
        } catch {
            print("Error saving custom cocktail: \(error)")
        }
        clearData()
    }
    func populateExistingIngredient(ingredient: Ingredient) {
        ingredientName = ingredient.ingredientBase.name
        category = UmbrellaCategory(rawValue: ingredient.ingredientBase.umbrellaCategory) ?? UmbrellaCategory.agaves
        ingredientTags = ingredient.ingredientBase.tags ?? Tags()
        info = ingredient.ingredientBase.info
        dynamicallyChangeMeasurementUnit()
        didChooseExistingIngredient = true
        editedIngredient = ingredient
        isEdit = true
    }
    func populateCustomIngredient(ingredient: Ingredient) {
        if let prep = ingredient.ingredientBase.prep {
            prepIngredientRecipe = prep.prepRecipe
        }
        ingredientName = ingredient.ingredientBase.name
        category = UmbrellaCategory(rawValue: ingredient.ingredientBase.umbrellaCategory) ?? UmbrellaCategory.otherAlcohol
        prep = ingredient.ingredientBase.prep
        ingredientAmount = ingredient.value
        selectedMeasurementUnit = MeasurementUnit(rawValue: ingredient.unit.rawValue) ?? MeasurementUnit.fluidOunces
        editedIngredient = ingredient
        isEdit = true
    }
    func populateBuildStepFor(instruction: Instruction) {
        currentBuildStep = instruction.step
        currentMethod = instruction.method
        currentBuildInstructionUUID = instruction.id
    }
    func reEnumerateBuildSteps() {
        for (index, _) in build.instructions.enumerated() {
            build.instructions[index].step = index + 1
        }
    }
    func reEnumeratePrepIngredientRecipe() {
        for (index, _) in prepIngredientRecipe.enumerated() {
            prepIngredientRecipe[index].step = index + 1
        }
    }
    
    func updateBuildInstruction(id: UUID, newMethod: String) {
        if let index = build.instructions.firstIndex(where: { $0.id == id }) {
            build.instructions[index].method = newMethod
        }
    }
    func updatePrepIngredientRecipe(id: UUID, newMethod: String) {
        if let index = prepIngredientRecipe.firstIndex(where: { $0.id == id }) {
            prepIngredientRecipe[index].method = newMethod
        }
    }
 
    func customIngredientIsValid(allIngredients: [IngredientBase]) -> Bool {
        return ingredientName != "" &&
        ingredientAmount != nil &&
        !allIngredients.contains(where: { $0.name == ingredientName } )
    }

    func updateEditedIngredient(isCustom: Bool) {
        if let editedIngredient = editedIngredient,
           let index = addedIngredients.firstIndex(where: { $0.id == editedIngredient.id }),
           let ingredientValue = ingredientAmount {
            
            let updatedIngredient = Ingredient(
                id: editedIngredient.id,
                ingredientBase: IngredientBase(
                    name: ingredientName,
                    category: category,
                    prep: prep, isCustom: isCustom
                ),
                value: ingredientValue,
                unit: selectedMeasurementUnit
            )
            addedIngredients[index] = updatedIngredient
        }
    }
    func swipeToRemoveIngredient() {
        if let index = addedIngredients.firstIndex(where: { $0.id == currentIngredientUUID}) {
            addedIngredients.remove(at: index)
        }
    }
    
    func customGarnishIsValid(allGarnishes: [Garnish]) -> Bool {
        return currentGarnishName != "" &&
        !allGarnishes.contains(where: { $0.name == currentGarnishName })
    }
    
    func cantAddCocktailMessage() -> String {
        var text = ""
        
        if cocktailName == "" {
            text = "Your cocktail must have a name"
            if uniqueGlasswareName == nil {
                text += ", and a glass"
            }
        } else if uniqueGlasswareName == nil {
            text = "Select a glass"
        }
        if (addedIngredients.count) < 2 {
            if text == "" {
                text = "You must add at least two ingredients"
            } else {
                text += ", and at least two ingredients"
            }
        }
        return text
    }
    
    func matchAllIngredients(ingredients: [IngredientBase]) {
        
        guard !ingredientName.isEmpty else {
            return filteredIngredients = [] // Return all ingredients if search text is empty
         }
        
        let lowercasedSearchText = ingredientName.lowercased()
        
        filteredIngredients = ingredients.filter { $0.name.lowercased().contains(lowercasedSearchText) }
            .sorted { lhs, rhs in
                let lhsLowercased = lhs.name.lowercased()
                let rhsLowercased = rhs.name.lowercased()
                
                // prioritize ingredients that start with the search text
                let lhsStartsWith = lhsLowercased.hasPrefix(ingredientName.lowercased())
                let rhsStartsWith = rhsLowercased.hasPrefix(ingredientName.lowercased())
                
                if lhsStartsWith && !rhsStartsWith {
                    return true
                } else if !lhsStartsWith && rhsStartsWith {
                    return false
                }
                
                // if two ingredients start with the same search text, prioritize the shortest one
                if lhsStartsWith && rhsStartsWith {
                    return lhs.name.count < rhs.name.count
                }
                
                // If neither starts with the search text, prioritize the one with the search text appearing first in the word
                let lhsRange = lhsLowercased.range(of: ingredientName.lowercased())
                let rhsRange = rhsLowercased.range(of: ingredientName.lowercased())
                
                let matchedArray = (lhsRange?.lowerBound ?? lhsLowercased.endIndex) < (rhsRange?.lowerBound ?? rhsLowercased.endIndex)
                
                return matchedArray
            }
    }
    
    func matchAllGarnish(garnishes: [Garnish]) -> [String] {
        guard !currentGarnishName.isEmpty else {
            return []
        }
        let filteredGarnishes = garnishes.map {$0.name}.sorted(by: {$0 < $1 })
        let lowercasedSearchText = currentGarnishName.lowercased()

        return filteredGarnishes.filter { $0.lowercased().contains(lowercasedSearchText)}
            .sorted { lhs, rhs in
                let lhsLowercased = lhs.lowercased()
                let rhsLowercased = rhs.lowercased()
                
                // prioritize ingredients that start with the search text
                let lhsStartsWith = lhsLowercased.hasPrefix(lowercasedSearchText)
                let rhsStartsWith = rhsLowercased.hasPrefix(lowercasedSearchText)
                
                if lhsStartsWith && !rhsStartsWith {
                    return true
                } else if !lhsStartsWith && rhsStartsWith {
                    return false
                }
                
                // if two garnishes start with the same search text, prioritize the shortest one
                if lhsStartsWith && rhsStartsWith {
                    return lhs.count < rhs.count
                }
                
                // If neither starts with the search text, prioritize the one with the search text appearing first in the word
                let lhsRange = lhsLowercased.range(of: lowercasedSearchText)
                let rhsRange = rhsLowercased.range(of: lowercasedSearchText)
                
                let matchedArray = (lhsRange?.lowerBound ?? lhsLowercased.endIndex) < (rhsRange?.lowerBound ?? rhsLowercased.endIndex)
                
                return matchedArray
            }
    }

     func dynamicallyChangeMeasurementUnit() {
         switch category {
            case .herbs:
                selectedMeasurementUnit = MeasurementUnit.gentlyMuddled
            case .fruit:
                selectedMeasurementUnit = MeasurementUnit.muddled
            case .seasoning:
                selectedMeasurementUnit = MeasurementUnit.drops
            case .wines:
                selectedMeasurementUnit = MeasurementUnit.fluidOunces
            case .bitters:
                selectedMeasurementUnit = MeasurementUnit.dashes
            default:
                selectedMeasurementUnit = MeasurementUnit.fluidOunces
            }
        }
    
    func dynamicallyChangeMeasurementOptionsBasedOnChosenCategory() -> [MeasurementUnit] {
        
        switch category {
        case .herbs:
            return [.gentlyMuddled, .muddled, .nitroMuddled, .grams, .none]
        case .fruit:
            return [.gentlyMuddled, .muddled, .grams, .sliceOf, .whole, .nitroMuddled, .none]
        case .seasoning:
            return [.pinch, .drops, .grams, .dashes, .barSpoon, .teaspoon, .tablespoon, .none]
        case .otherNonAlc:
            return MeasurementUnit.allCases
        default:
            return [.fluidOunces, .barSpoon, .dashes, .drops, .grams, .ml,  .sprays, .teaspoon, .tablespoon, .bottles, .none]
        }
    }
    
    func validateAuthor() {
        if authorName != "" && authorYear != "" && authorPlace != "" {
            author = Author(person: authorName, place: authorYear, year: authorPlace)
        }
    }
    
    init() {
        setupSearch()
    }
    
    
    //MARK: TODO: Extract to shared view model
    
    private func setupSearch() {
        searchSubject
            .debounce(for: .milliseconds(400), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.performSearch(searchText)
            }
            .store(in: &cancellables)
    }
    
    func updateSearch(_ searchText: String) {
        searchSubject.send(searchText)
    }
    
    private func performSearch(_ searchText: String) {
        let lowercasedSearchText = searchText.lowercased()
        filteredCocktails = allCocktails.filter {
            $0.cocktailName.lowercased().contains(lowercasedSearchText)
        }.sorted { lhs, rhs in
            let lhsName = lhs.cocktailName.lowercased()
            let rhsName = rhs.cocktailName.lowercased()
            if lhsName.hasPrefix(lowercasedSearchText) != rhsName.hasPrefix(lowercasedSearchText) {
                return lhsName.hasPrefix(lowercasedSearchText)
            }
            return lhsName < rhsName
        }
    }
    
    private var allCocktails: [Cocktail] = []
    var filteredCocktails: [Cocktail] = []
    
    private func updateFilteredCocktails() {
        let lowercasedSearchText = debouncedSearchText.lowercased()
        
        if debouncedSearchText.isEmpty {
            filteredCocktails = []
        } else {
            filteredCocktails = allCocktails.filter { $0.cocktailName.localizedCaseInsensitiveContains(lowercasedSearchText) }
        }
    }
    
    func setAllCocktails(_ cocktails: [Cocktail]) {
        self.allCocktails = cocktails
        updateFilteredCocktails()
    }
}
