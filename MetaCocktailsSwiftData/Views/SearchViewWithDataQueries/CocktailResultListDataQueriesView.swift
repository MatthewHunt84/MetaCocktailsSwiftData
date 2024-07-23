//
//  CocktailResultListDataQueries.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct CocktailResultListDataQueriesView: View {
    
    @Bindable var viewModel: SearchViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    List {
                        PerfectMatchCocktailView(passedViewModel: viewModel)
                        MinusOneMatchView(passedViewModel: viewModel)
                        MinusTwoMatchView(passedViewModel: viewModel)
                    }
                    .listStyle(.plain)
                    .backgroundStyle(Color(.black))
                }
            }
        }
    }
}

//#Preview {
//    CocktailResultListDataQueries(preferredIngredients: [], notPreferredIngredients: [], passedViewModel: SearchViewModel())
//     
//}


struct PerfectMatchCocktailView: View {
    
    @Bindable var viewModel: SearchViewModel
    @Query var fullMatchCocktails: [Cocktail]

    init(passedViewModel: SearchViewModel) {
        
        self.viewModel = passedViewModel
 
        let explicitPreferredCount = passedViewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = passedViewModel.preferredIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let unwantedIngredientsWithoutSubCategories: [String] = passedViewModel.unwantedIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        
        let unwantedIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().unwanted
        let preferredIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().preferred
        
//        let matchesAllPreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
//            ingredients.filter { ingredient in
//                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
//            }.count == explicitPreferredCount
//        }
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
        
//        let fullMatchPredicate = #Predicate<Cocktail> { cocktail in
//            matchesAllPreferredIngredients.evaluate(cocktail.spec)
//            && !includesUnwantedIngredients.evaluate(cocktail.spec)
//            && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
//        }
        
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
        
        let fullMatchPredicate2 = #Predicate<Cocktail> { cocktail in
            (preferredIngredientsTotalCount.evaluate(cocktail.spec) + preferredIngredientsFromSubCategoriesTotalCount.evaluate(cocktail.spec) == explicitPreferredCount)
            && !includesUnwantedIngredients.evaluate(cocktail.spec)
            && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
        }
        _fullMatchCocktails = Query(filter: fullMatchPredicate2, sort: \Cocktail.cocktailName)
        
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
    
    @Bindable var viewModel: SearchViewModel
    @Query var minusOneMatchCocktails: [Cocktail]
    @State var nonmatchSearchPreference = "none" 
    
    init(passedViewModel: SearchViewModel) {
        
        self.viewModel = passedViewModel
        let explicitPreferredCount = passedViewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = passedViewModel.preferredIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let unwantedIngredientsWithoutSubCategories: [String] = passedViewModel.unwantedIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        
        let unwantedIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().unwanted
        let preferredIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().preferred
        
//        let matchesAllButOnePreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
//            ingredients.filter { ingredient in
//                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
//            }.count == (explicitPreferredCount - 1)
//        }
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
//        let minusOneMatchPredicate = #Predicate<Cocktail> { cocktail in
//            matchesAllButOnePreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
//        }
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
            && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
        }
        
        _minusOneMatchCocktails = Query(filter: minusOneMatchPredicate2, sort: \Cocktail.cocktailName)
        
        
    }
    var body: some View {
        
        if minusOneMatchCocktails.isEmpty || viewModel.preferredIngredients.count < 2 {
            EmptyView()
        } else {
            Section(header: SearchedCocktailTitleHeader(searched: viewModel.preferredCount, matched: (viewModel.preferredCount - 1))) {
                
                HStack{
                    FilterMatchesMenuDataQueriesView(viewModel: viewModel, nonmatchSearchPreference: $nonmatchSearchPreference)
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
    @Bindable var viewModel: SearchViewModel
    @Query var minusTwoMatchCocktails: [Cocktail]
    
    init(passedViewModel: SearchViewModel) {
        
        self.viewModel = passedViewModel
        
        let explicitPreferredCount = passedViewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = passedViewModel.preferredIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let unwantedIngredientsWithoutSubCategories: [String] = passedViewModel.unwantedIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let unwantedIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().unwanted
        let preferredIngredientsFromSubCategories = passedViewModel.findIngredientNamesForCorrespondingSubCategories().preferred
       
     
//        let matchesAllButOnePreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
//            ingredients.filter { ingredient in
//                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
//            }.count == (explicitPreferredCount - 2)
//        }
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
//        let minusOneMatchPredicate = #Predicate<Cocktail> { cocktail in
//            matchesAllButOnePreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
//        }
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
        
        let minusTwoMatchPredicate = #Predicate<Cocktail> { cocktail in
            (preferredIngredientsTotalCount.evaluate(cocktail.spec) + preferredIngredientsFromSubCategoriesTotalCount.evaluate(cocktail.spec) == (explicitPreferredCount - 2))
            && !includesUnwantedIngredients.evaluate(cocktail.spec)
            && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
        }
        _minusTwoMatchCocktails = Query(filter: minusTwoMatchPredicate, sort: \Cocktail.cocktailName)
        
        
    }
    var body: some View {
        if minusTwoMatchCocktails.isEmpty  || viewModel.preferredIngredients.count < 4{
            EmptyView()
        } else {
            
            Section(header: SearchedCocktailTitleHeader(searched: viewModel.preferredCount, matched: (viewModel.preferredCount - 2))) {
                
                HStack{
                    FilterMatchesMenuDataQueriesView(viewModel: viewModel, nonmatchSearchPreference: $nonmatchSearchPreference)
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
        let preferredIngredientArray = viewModel.preferredIngredients
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
    
    @Bindable var viewModel: SearchViewModel
    @Binding var nonmatchSearchPreference: String
    
    var body: some View {
        Menu("Filter Matches") {
            ForEach(viewModel.preferredIngredients, id: \.self) { preference in
                
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
