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
    @State private var nonmatchSearchPreference: String = "none"
    @Query var fullMatchCocktails: [Cocktail]
    @Query var minusOneMatchCocktails: [Cocktail]
    @Query var minusTwoMatchCocktails: [Cocktail]

    
    init(preferredIngredients: [String], notPreferredIngredients: [String], passedViewModel: SearchViewModel) {
        self.viewModel = passedViewModel
        
       
  
        let unwantedIngredientsFromSubCategories = passedViewModel.unwantedIngredientsFromSubCategories
        let preferredIngredientsFromSubCategories = passedViewModel.preferredIngredientsFromSubCategories
      
        let explicitPreferredCount = viewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = preferredIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let unwantedIngredientsWithoutSubCategories: [String] = notPreferredIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        
        let matchesAllPreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count == explicitPreferredCount
        }
        let matchesAllButOnePreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
                
            }.count == (explicitPreferredCount - 1)
        }
        let matchesAllButTwoPreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count == (explicitPreferredCount - 2)
        }
      
        // Exclude all cocktails with unwanted ingredients
        let includesUnwantedIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                unwantedIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
        // Exclude all cocktails with ingredients from unwanted sub categories
        let includesUnwantedIngredientsFromSubCategories = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                unwantedIngredientsFromSubCategories.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
        
        
        let fullMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllPreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
        }
        let minusOneMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllButOnePreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
        }
        let minusTwoMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllButTwoPreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredientsFromSubCategories.evaluate(cocktail.spec)
        }
      
        
        _fullMatchCocktails = Query(filter: fullMatchPredicate, sort: \Cocktail.cocktailName)
        _minusOneMatchCocktails = Query(filter: minusOneMatchPredicate, sort: \Cocktail.cocktailName)
        _minusTwoMatchCocktails = Query(filter: minusTwoMatchPredicate, sort: \Cocktail.cocktailName)
        
        
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {

                    if viewModel.preferredCount > 0 {
                        VStack{
                            List {
                               
                                ForEach(viewModel.sections, id: \.self.id) { result in
                                    Section(header: SearchedCocktailTitleHeader(searched: result.sectionsPreferredCount, matched: result.matched)) {
                                        if result.matched == result.sectionsPreferredCount {
                                            
                                            // NEW: This is how things should be.
                                            // The perfect match section is a subview initialized with published data - in this case the viewModel which is observable.
                                            // The queries happen on the subview initializer, so that when the viewModel changes the subview gets re-drawn.
                                            PerfectMatchCocktailView(passedViewModel: viewModel)
                                            
                                       
//                                        if result.matched == (result.sectionsPreferredCount - 1) {
//                                            MinusOneMatchView(preferredIngredients: viewModel.preferredIngredients, notPreferredIngredients: viewModel.unwantedIngredients, passedViewModel: viewModel, resultData: result)
//                                        }
                                        }  else {
                                            
                                            FilterMatchesMenuViewDataQueries(viewModel: viewModel, resultViewSectionData: result, nonmatchSearchPreference: $nonmatchSearchPreference)
                                            
                                            if nonmatchSearchPreference == "none" {
                                                PartialMatchWithNoPreferenceViewDataQueries(viewModel: viewModel, resultViewSectionData: result)
                                            } else {
                                                ForEach(result.cocktails.filter({$0.missingIngredients.contains(nonmatchSearchPreference)}), id: \.self.id) { cocktail in
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
                    print("Preferred Count = ")
                    print(viewModel.preferredCount)
                    for cocktail in fullMatchCocktails {
                        print(cocktail.cocktailName)
                    }
                    
                    viewModel.sections.removeAll()
                    viewModel.sections = viewModel.createMatchContainers()
                    viewModel.createResultsForSectionData(perfectMatch: fullMatchCocktails, minusOne: minusOneMatchCocktails, minusTwo: minusTwoMatchCocktails)
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

struct FilterMatchesMenuViewDataQueries: View {
    
    @Bindable var viewModel: SearchViewModel
    var resultViewSectionData: ResultViewSectionData
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

struct TotalMatchViewDataQueries: View {
    @Bindable var viewModel: SearchViewModel
    var resultViewSectionData: ResultViewSectionData
//    @Query var fullMatchCocktails: [Cocktail]
//    
//    init(preferredIngredients: [String], notPreferredIngredients: [String], passedViewModel: SearchViewModel, resultData: ResultViewSectionData) {
//        self.viewModel = passedViewModel
//        self.resultViewSectionData = resultData
//        let explicitPreferredCount = viewModel.preferredCount
//   
//        let matchesAllPreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
//            ingredients.filter { ingredient in
//                preferredIngredients.contains(ingredient.ingredientBase.name)
//            }.count == explicitPreferredCount
//        }
//        let includesUnwantedIngredients = #Expression<[Ingredient], Bool> { ingredients in
//            ingredients.filter { ingredient in
//                notPreferredIngredients.contains(ingredient.ingredientBase.name)
//            }.count > 0
//        }
//        let fullMatchPredicate = #Predicate<Cocktail> { cocktail in
//            matchesAllPreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec)
//        }
//        _fullMatchCocktails = Query(filter: fullMatchPredicate, sort: \Cocktail.cocktailName)
//        
//    }
    var body: some View {
        
        ForEach(resultViewSectionData.cocktails, id: \.self.id) { cocktail in
            
            NavigationLink {
                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail.cocktail))
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack {
                    Text(cocktail.cocktail.cocktailName)
                }
            }
        }
//        .onAppear {
//            viewModel.perfectMatch(perfectMatch: fullMatchCocktails)
//        }
    }
}
struct MinusOneMatchView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var viewModel: SearchViewModel
    var resultViewSectionData: ResultViewSectionData
    @Query var minusOneMatchCocktails: [Cocktail]
    
    init(preferredIngredients: [String], notPreferredIngredients: [String], passedViewModel: SearchViewModel, resultData: ResultViewSectionData) {
        self.viewModel = passedViewModel
        self.resultViewSectionData = resultData
        let explicitPreferredCount = viewModel.preferredCount
   
        let matchesAllButOnePreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredients.contains(ingredient.ingredientBase.name)
                
            }.count == (explicitPreferredCount - 1)
        }
        let includesUnwantedIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                notPreferredIngredients.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
        let minusOneMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllButOnePreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec)
        }

        _minusOneMatchCocktails = Query(filter: minusOneMatchPredicate, sort: \Cocktail.cocktailName)
        
    }
    var body: some View {
        VStack{
            List{
                ForEach(resultViewSectionData.cocktails, id: \.self.id) { cocktail in
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
        .onAppear() {
            viewModel.minusOne(minusOne: minusOneMatchCocktails)
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


struct PerfectMatchCocktailView: View {

    @Query var fullMatchCocktails: [Cocktail]

    init(passedViewModel: SearchViewModel) {
        
        
        // First we grab explicitly what we need from the viewModel to pass it to the expressions
        // The expressions can only use primitive types directly, which you've already learned.
        let explicitPreferredCount = passedViewModel.preferredCount
        let preferredIngredients = passedViewModel.preferredIngredients
        let notPreferredIngredients = passedViewModel.unwantedIngredients
        
        print("Hi James! Preferred count is now: \(preferredIngredients.count) and unwanted count is now: \(notPreferredIngredients.count)")
        print("Time to draw the view (which will run these predicates on the new arrays")
        
        let matchesAllPreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredients.contains(ingredient.ingredientBase.name)
            }.count == explicitPreferredCount
        }
        let includesUnwantedIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                notPreferredIngredients.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
        let fullMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllPreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec)
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
