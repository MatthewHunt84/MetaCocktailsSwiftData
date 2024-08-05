//
//  CocktailResultListDataQueries.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct IngredientSearchMatchedCocktailsView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        
        List {
            PerfectMatchCocktailView_Improved(passedViewModel: viewModel)
            MinusOneMatchView(passedViewModel: viewModel)
            MinusTwoMatchView(passedViewModel: viewModel)
        }
        .listStyle(.plain)
        .backgroundStyle(.black)
    }
}

struct PerfectMatchCocktailView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @Query var fullMatchCocktails: [Cocktail]
    
    init(passedViewModel: SearchViewModel) {

        var explicitPreferredCount = passedViewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = passedViewModel.preferredSelections.filter({ !passedViewModel.baseCategoryStrings.contains($0)})
        let preferredBaseCategories = passedViewModel.preferredSelections.filter({ passedViewModel.baseCategoryStrings.contains($0)})
        let totalUnwantedIngredients: [String] = passedViewModel.unwantedSelections.filter({ !passedViewModel.baseCategoryStrings.contains($0)}) + passedViewModel.findIngredientNamesForCorrespondingSubCategories().unwanted
        
        let preferredIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().preferred

        
        
        //Unwanted
        let includesUnwantedIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                totalUnwantedIngredients.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
      
        //Preferred
        let preferredIngredientsTotalCount = #Expression<[Ingredient], Int> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count
        }
        
        
        let preferredIngredientsFromSubCategoriesTotalCount = #Expression<[Ingredient], Int> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsFromSubCategories.contains(ingredient.ingredientBase.name)
            }.count
        }
        if preferredIngredientsFromSubCategories.count > 0 {
            explicitPreferredCount -= passedViewModel.preferredSelections.filter({ passedViewModel.baseCategoryStrings.contains($0)}).count 
        }
        
    
        let fullMatchPredicateWithBaseCategories = #Predicate<Cocktail> { cocktail in
            
            (preferredIngredientsTotalCount.evaluate(cocktail.spec) == explicitPreferredCount)
            && !includesUnwantedIngredients.evaluate(cocktail.spec)
            && preferredIngredientsFromSubCategoriesTotalCount.evaluate(cocktail.spec) > 0
          
        }
        let fullMatchPredicateWithoutBaseCategories = #Predicate<Cocktail> { cocktail in
            
            (preferredIngredientsTotalCount.evaluate(cocktail.spec) == explicitPreferredCount)
            && !includesUnwantedIngredients.evaluate(cocktail.spec)
        }
        if preferredIngredientsFromSubCategories.count > 0 {
            _fullMatchCocktails = Query(filter: fullMatchPredicateWithBaseCategories, sort: \Cocktail.cocktailName)
        } else {
            _fullMatchCocktails = Query(filter: fullMatchPredicateWithoutBaseCategories, sort: \Cocktail.cocktailName)
        }
    }
    
    var body: some View {
        
        if fullMatchCocktails.isEmpty {
            EmptyView()
        } else {
            Section(header: SearchedCocktailTitleHeader(searched: viewModel.preferredCount, matched: viewModel.preferredCount)) {
                ForEach(fullMatchCocktails, id: \.self) { cocktail in
                    
                    NavigationLink {
                        RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack {
                            Text(cocktail.cocktailName)
                        }
                    }
                }
            }
        }
    }
}



struct MinusOneMatchView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @Query var minusOneMatchCocktails: [Cocktail]
    @State var nonmatchSearchPreference = "none" 
    
    init(passedViewModel: SearchViewModel) {

        let explicitPreferredCount = passedViewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = passedViewModel.preferredSelections.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let totalUnwantedIngredients: [String] = passedViewModel.unwantedSelections.filter({ !passedViewModel.subCategoryStrings.contains($0)}) + passedViewModel.findIngredientNamesForCorrespondingSubCategories().unwanted
        
        
        let preferredIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().preferred
        

        //Unwanted
        let includesUnwantedIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                totalUnwantedIngredients.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
     
        //Preferred
        let preferredIngredientsTotalCount = #Expression<[Ingredient], Int> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count
        }
        let preferredIngredientsFromSubCategoriesTotalCount = #Expression<[Ingredient], Int> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsFromSubCategories.contains(ingredient.ingredientBase.name)
            }.count
        }

        let minusOneMatchPredicate2 = #Predicate<Cocktail> { cocktail in
            (preferredIngredientsTotalCount.evaluate(cocktail.spec) + preferredIngredientsFromSubCategoriesTotalCount.evaluate(cocktail.spec) == (explicitPreferredCount - 1))
            && !includesUnwantedIngredients.evaluate(cocktail.spec)
        }

        _minusOneMatchCocktails = Query(filter: minusOneMatchPredicate2, sort: \Cocktail.cocktailName)
        
    }
    var body: some View {
        
        if minusOneMatchCocktails.isEmpty || viewModel.preferredSelections.count < 2 {
            EmptyView()
        } else {
            Section(header: SearchedCocktailTitleHeader(searched: viewModel.preferredCount, matched: (viewModel.preferredCount - 1))) {
                
                HStack{
                    FilterMatchesMenuDataQueriesView(nonmatchSearchPreference: $nonmatchSearchPreference)
                    Spacer()
                }
                ForEach(filtered(minusOneMatchCocktails), id: \.self) { cocktail in
                    NavigationLink {
                        RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        VStack {
                            HStack {
                                Text(cocktail.cocktailName)
                                Spacer()
                            }
                            MissingIngredientsView(for: cocktail, in: viewModel)
                        }
                    }
                }
            }
        }
    }
    func filtered(_ cocktails: [Cocktail]) -> [Cocktail] {
        guard nonmatchSearchPreference != "none" else { return cocktails }
        return cocktails.filter { cocktail in
            cocktail.spec.filter { ingredient in
                ingredient.ingredientBase.name == nonmatchSearchPreference
            }.count > 0
        }
    }
}

struct MinusTwoMatchView: View {
    @State var nonmatchSearchPreference = "none"
    @EnvironmentObject var viewModel: SearchViewModel
    @Query var minusTwoMatchCocktails: [Cocktail]
    
    init(passedViewModel: SearchViewModel) {
        let explicitPreferredCount = passedViewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = passedViewModel.preferredSelections.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let unwantedIngredientsWithoutSubCategories: [String] = passedViewModel.unwantedSelections.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        
        let unwantedIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().unwanted
        let preferredIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().preferred
     
        let matchesAllButOnePreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count == (explicitPreferredCount - 2)
        }
        let includesUnwantedIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                unwantedIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
        let includesUnwantedIngredientsFromSubCategories = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                unwantedIngredientsFromSubCategories.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
        let minusOneMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllButOnePreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
        }
        
        _minusTwoMatchCocktails = Query(filter: minusOneMatchPredicate, sort: \Cocktail.cocktailName)
        
        
    }
    var body: some View {
        if minusTwoMatchCocktails.isEmpty  || viewModel.preferredSelections.count < 4{
            EmptyView()
        } else {
            
            Section(header: SearchedCocktailTitleHeader(searched: viewModel.preferredCount, matched: (viewModel.preferredCount - 2))) {
                
                HStack{
                    FilterMatchesMenuDataQueriesView(nonmatchSearchPreference: $nonmatchSearchPreference)
                    Spacer()
                }
                ForEach(filtered(minusTwoMatchCocktails), id: \.self) { cocktail in
                    
                    NavigationLink {
                        RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        VStack {
                            HStack {
                                Text(cocktail.cocktailName)
                                Spacer()
                            }
                            MissingIngredientsView(for: cocktail, in: viewModel)
                        }
                    }
                }
            }
        }
    }
    func filtered(_ cocktails: [Cocktail]) -> [Cocktail] {
        guard nonmatchSearchPreference != "none" else { return cocktails }
        return cocktails.filter { cocktail in
            cocktail.spec.filter { ingredient in
                ingredient.ingredientBase.name == nonmatchSearchPreference
            }.count > 0
        }
    }
}

struct MissingIngredientsView: View {
    
    var missingIngredientArray: [String]
    
    init(for cocktail: Cocktail, in viewModel: SearchViewModel) {
        let preferredIngredientArray = viewModel.preferredSelections
        let cocktailIngredientBases = cocktail.spec.map { $0.ingredientBase.name }
        let missingIngredientsArray = preferredIngredientArray.filter { !cocktailIngredientBases.contains($0) }
        self.missingIngredientArray = missingIngredientsArray
    }
   
    var body: some View {
        HStack{
            ForEach(missingIngredientArray, id: \.self) { nonMatch in
                Text("-\(nonMatch) ")
                    .foregroundStyle(.brandPrimaryRed)
                    .font(.caption)
            }
            Spacer()
        }
    }
}

struct FilterMatchesMenuDataQueriesView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @Binding var nonmatchSearchPreference: String
    
    var body: some View {
        Menu("Filter Matches") {
            ForEach(viewModel.preferredSelections, id: \.self) { preference in
                
                Button("- \(preference)") {
                    nonmatchSearchPreference = preference
                }
                .foregroundStyle(.brandPrimaryRed)
            }
            Button {
                nonmatchSearchPreference = "none"
            } label: {
                Text("Show all")
            }
        }
    }
}




struct PerfectMatchCocktailView_Improved: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @Query var fullMatchCocktails: [Cocktail]
    
    init(passedViewModel: SearchViewModel) {
        let predicate = passedViewModel.predicateFactory(for: viewModel.preferredCount)
        _fullMatchCocktails = Query(filter: predicate, sort: \Cocktail.cocktailName)
    }
    
    var body: some View {
        
        if fullMatchCocktails.isEmpty {
            EmptyView()
        } else {
            Section(header: SearchedCocktailTitleHeader(searched: viewModel.preferredCount, matched: viewModel.preferredCount)) {
                ForEach(fullMatchCocktails, id: \.self) { cocktail in
                    
                    NavigationLink {
                        RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack {
                            Text(cocktail.cocktailName)
                        }
                    }
                }
            }
        }
    }
}
