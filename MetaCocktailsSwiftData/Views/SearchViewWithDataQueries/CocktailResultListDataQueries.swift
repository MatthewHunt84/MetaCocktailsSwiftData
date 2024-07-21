//
//  CocktailResultListDataQueries.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct CocktailResultListDataQueries: View {
    @Bindable var viewModel: SearchViewModel
    @Query var fullMatchCocktails: [Cocktail]
    @Query var minusOneMatchCocktails: [Cocktail]
    @Query var minusTwoMatchCocktails: [Cocktail]

    var body: some View {
        NavigationStack {
            VStack {

                    if viewModel.preferredCount > 0 {
                        VStack{
                            List {
                               
                                ForEach(viewModel.sections, id: \.self.id) { result in
                                    Section(header: SearchedCocktailTitleHeader(searched: result.sectionsPreferredCount, matched: result.matched)) {
                                        if result.matched == result.sectionsPreferredCount {
                                            // The queries happen on the subview initializer, so that when the viewModel changes the subview gets re-drawn.
                                            PerfectMatchCocktailView(passedViewModel: viewModel)
                                        }
                                        if result.matched == (result.sectionsPreferredCount - 1)  {
                                            
                                            MinusOneMatchView(passedViewModel: viewModel, passedResultViewSectionData: result)
                                        }
                                    }
                                }
                            }
                            .listStyle(.plain)
                            .backgroundStyle(Color(.black))
                        }
                    } else  {
                        ZStack(alignment: .center) {
                            Color.black
                            
                            VStack {
                                Text("Add more preferences to continue")
                                    .font(.title).bold()
                                    .multilineTextAlignment(.center)
                                Image("Urkel")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
//                }
                Spacer()
            }
            .onAppear {
                viewModel.findIngredientNamesForCorrespondingSubCategories()
            }
            .task {
                if viewModel.willLoadOnAppear == true {
                    viewModel.createMatchContainers()
                }
                viewModel.willLoadOnAppear = false
            }
        }
    }
}

//#Preview {
//    CocktailResultListDataQueries(preferredIngredients: [], notPreferredIngredients: [], passedViewModel: SearchViewModel())
//     
//}


struct PerfectMatchCocktailView: View {
    
    @Query var fullMatchCocktails: [Cocktail]

    init(passedViewModel: SearchViewModel) {
        
       
        // First we grab explicitly what we need from the viewModel to pass it to the expressions
        // The expressions can only use primitive types directly, which you've already learned.
        let explicitPreferredCount = passedViewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = passedViewModel.preferredIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let unwantedIngredientsWithoutSubCategories: [String] = passedViewModel.unwantedIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        
        let unwantedIngredientsFromSubCategories = passedViewModel.unwantedIngredientsFromSubCategories
        //let preferredIngredientsFromSubCategories = passedViewModel.preferredIngredientsFromSubCategories
        
        let matchesAllPreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count == explicitPreferredCount
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
        let fullMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllPreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
        }
        
        _fullMatchCocktails = Query(filter: fullMatchPredicate, sort: \Cocktail.cocktailName)
        
    }

    var body: some View {
        
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

struct MinusOneMatchView: View {
    var resultViewSectionData: ResultViewSectionData
    @Bindable var viewModel: SearchViewModel
    @Query var minusOneMatchCocktails: [Cocktail]
    
    init(passedViewModel: SearchViewModel, passedResultViewSectionData: ResultViewSectionData ) {
        
        self.viewModel = passedViewModel
        
        let explicitPreferredCount = passedViewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = passedViewModel.preferredIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let unwantedIngredientsWithoutSubCategories: [String] = passedViewModel.unwantedIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        
        let unwantedIngredientsFromSubCategories = passedViewModel.unwantedIngredientsFromSubCategories
        self.resultViewSectionData = passedResultViewSectionData
        let matchesAllButOnePreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count == (explicitPreferredCount - 1)
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
        
        _minusOneMatchCocktails = Query(filter: minusOneMatchPredicate, sort: \Cocktail.cocktailName)
        
        
    }
    var body: some View {
        VStack{
            HStack{
                FilterMatchesMenuViewDataQueries(viewModel: viewModel)
                Spacer()
            }
            if viewModel.nonmatchSearchPreference == "none" {
                PartialMatchWithNoPreferenceViewDataQueries(viewModel: viewModel, resultViewSectionData: resultViewSectionData)
               
            } else {
                PartialMatchWithPreferenceViewDataQueries(viewModel: viewModel, resultViewSectionData: resultViewSectionData)
            }
        }
        .onAppear {
            resultViewSectionData.cocktails = viewModel.minusOneCocktailsAndMissingIngredients(minusOne: minusOneMatchCocktails)
        }
    }
}
struct FilterMatchesMenuViewDataQueries: View {
    
    @Bindable var viewModel: SearchViewModel
    
    var body: some View {
        Menu("Filter Matches") {
            ForEach(viewModel.preferredIngredients, id: \.self) { preference in
                
                Button("- \(preference)") {
                    viewModel.nonmatchSearchPreference = preference
                }
                .foregroundStyle(.brandPrimaryRed)
            }
            Button {
                viewModel.nonmatchSearchPreference = "none"
            } label: {
                Text("Show all")
            }
        }
    }
}


struct PartialMatchWithNoPreferenceViewDataQueries: View {
    
    @Bindable var viewModel: SearchViewModel
    var resultViewSectionData: ResultViewSectionData
    
    var body: some View {
        ForEach(resultViewSectionData.cocktails, id: \.cocktail.cocktailName) { cocktail in
            NavigationLink {
                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail.cocktail))
                    .navigationBarBackButtonHidden(true)
            } label: {
                VStack {
                    HStack{
                        Text(cocktail.cocktail.cocktailName)
                        Spacer()
                    }
                    HStack{
                        ForEach(cocktail.missingIngredients, id: \.self) { nonMatch in
                            Text("-\(nonMatch) ")
                                .foregroundStyle(.brandPrimaryRed)
                                .font(.caption)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}


struct PartialMatchWithPreferenceViewDataQueries: View {
    
    @Bindable var viewModel: SearchViewModel
    var resultViewSectionData: ResultViewSectionData
    
    var body: some View {
        ForEach(resultViewSectionData.cocktails.filter({ $0.missingIngredients.contains(viewModel.nonmatchSearchPreference) }), id: \.self.id) { cocktail in
            NavigationLink {
                
                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail.cocktail))
                
                    .navigationBarBackButtonHidden(true)
            } label: {
                VStack {
                    HStack{
                        Text(cocktail.cocktail.cocktailName)
                        Spacer()
                    }
                    HStack{
                        ForEach(cocktail.missingIngredients, id: \.self) { nonMatch in
                            Text("-\(nonMatch) ")
                                .foregroundStyle(.brandPrimaryRed)
                                .font(.caption)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}
