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
    @Environment(\.modelContext) var modelContext
    @State private var nonmatchSearchPreference: String = "none"
    @State var unwantedSubCategories: [String]
    @State var preferredSubCategories: [String]
    @Query var fullMatchCocktails: [Cocktail]
    @Query var minusOneMatchCocktails: [Cocktail]
    @Query var minusTwoMatchCocktails: [Cocktail]
    @Query var minusThreeMatchCocktails: [Cocktail]
    @Query var minusFourMatchCocktails: [Cocktail]

    
    init(preferredIngredients: [String], notPreferredIngredients: [String], passedViewModel: SearchViewModel) {
        self.viewModel = passedViewModel
        
        self.unwantedSubCategories = {
            return notPreferredIngredients.filter({ passedViewModel.subCategoryStrings.contains($0)})
        }()
        self.preferredSubCategories = {
           return preferredIngredients.filter({ passedViewModel.subCategoryStrings.contains($0)})
            
        }()
        
        let explicitPreferredCount = viewModel.preferredCount
        let preferredIngredientsWithoutSubCategories = preferredIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        let unwantedIngredientsWithoutSubCategories = notPreferredIngredients.filter({ !passedViewModel.subCategoryStrings.contains($0)})
        
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
        let matchesAllButThreePreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count == (explicitPreferredCount - 3)
        }
        let matchesAllButFourPreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count == (explicitPreferredCount - 4)
        }
        let includesUnwantedIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                unwantedIngredientsWithoutSubCategories.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
//        let includesUnwantedCategory = #Expression<[Ingredient], Bool> { ingredients in
//            ingredients.filter { ingredient in
//                notPreferredSubCategories.contains(ingredient.ingredientBase.name)
//            }.count > 0
//        }
        let fullMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllPreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec)
        }
        let minusOneMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllButOnePreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec)
        }
        let minusTwoMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllButTwoPreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec)
        }
        let minusThreeMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllButThreePreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec)
        }
        let minusFourMatchPredicate = #Predicate<Cocktail> { cocktail in
            matchesAllButFourPreferredIngredients.evaluate(cocktail.spec) && !includesUnwantedIngredients.evaluate(cocktail.spec) 
        }
        
        _fullMatchCocktails = Query(filter: fullMatchPredicate, sort: \Cocktail.cocktailName)
        _minusOneMatchCocktails = Query(filter: minusOneMatchPredicate, sort: \Cocktail.cocktailName)
        _minusTwoMatchCocktails = Query(filter: minusTwoMatchPredicate, sort: \Cocktail.cocktailName)
        _minusThreeMatchCocktails = Query(filter: minusThreeMatchPredicate, sort: \Cocktail.cocktailName)
        _minusFourMatchCocktails = Query(filter: minusFourMatchPredicate, sort: \Cocktail.cocktailName)
        
        
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
                                            
                                            TotalMatchViewDataQueries(viewModel: viewModel, resultViewSectionData: result)
                                            
                                       
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
            .task {
                if viewModel.willLoadOnAppear == true {
                    viewModel.sections.removeAll()
                    viewModel.sections = viewModel.createMatchContainers()
                    viewModel.createResultsForSectionData(perfectMatch: fullMatchCocktails, minusOne: minusOneMatchCocktails, minusTwo: minusTwoMatchCocktails, minusThree: minusThreeMatchCocktails, minusFour: minusFourMatchCocktails)
                    print("OOOOO            preferred ingredients")
                    for ingredient in viewModel.preferredIngredients {
//                        if !viewModel.subCategoryStrings.contains(ingredient){
//                            print(ingredient)
//                        }
                        print(ingredient)
                    }
                    print("XXXXX            unwanted ingredients")
                    for ingredient in viewModel.unwantedIngredients {
//                        if !viewModel.subCategoryStrings.contains(ingredient){
//                            print(ingredient)
//                        }
                        print(ingredient)
                    }
                    print("---------      preferred Sub Categories")
                    for ingredient in preferredSubCategories {
                        print(ingredient)
                    }
                    print("XXXXXXX       unwanted Sub Categories")
                    for ingredient in unwantedSubCategories {
                        print(ingredient)
                    }
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
        
        
        //        .onAppear() {
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
