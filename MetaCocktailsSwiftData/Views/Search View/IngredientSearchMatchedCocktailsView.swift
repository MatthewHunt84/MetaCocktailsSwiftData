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
            PerfectMatchCocktailView(passedViewModel: viewModel)
            MinusOneMatchView(passedViewModel: viewModel)
            MinusTwoMatchView(passedViewModel: viewModel)
        }
        .listStyle(.plain)
        .backgroundStyle(.black)
    }
}

struct MissingIngredientsView: View {
    
    var missingIngredientArray: [String]
    
    init(for cocktail: Cocktail, in viewModel: SearchViewModel) {
        let preferredSelectionsArray = viewModel.preferredSelections
        var cocktailIngredients = cocktail.spec.map { $0.ingredientBase.name }
        cocktailIngredients += cocktail.spec.map { $0.ingredientBase.baseCategory }
        cocktailIngredients += cocktail.spec.map { $0.ingredientBase.specialtyCategory }
        cocktailIngredients += cocktail.spec.map { $0.ingredientBase.umbrellaCategory }
        let cocktailIngredientsNoDoubles = Array(Set(cocktailIngredients))
        let missingIngredientsArray = preferredSelectionsArray.filter { !cocktailIngredientsNoDoubles.contains($0) }
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




struct PerfectMatchCocktailView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @Query var fullMatchCocktails: [Cocktail]
    
    init(passedViewModel: SearchViewModel) {
        let predicate = passedViewModel.predicateFactory(for: passedViewModel.preferredCount)
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

struct MinusOneMatchView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @Query var minusOneMatchCocktails: [Cocktail]
    @State var nonmatchSearchPreference = "none"
    
    init(passedViewModel: SearchViewModel) {
        let predicate = passedViewModel.predicateFactory(for: passedViewModel.preferredCount - 1)
        _minusOneMatchCocktails = Query(filter: predicate, sort: \Cocktail.cocktailName)
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
                ingredient.ingredientBase.name == nonmatchSearchPreference ||
                ingredient.ingredientBase.umbrellaCategory == nonmatchSearchPreference ||
                ingredient.ingredientBase.baseCategory == nonmatchSearchPreference ||
                ingredient.ingredientBase.specialtyCategory == nonmatchSearchPreference
            }.count == 0
        }
    }
}

struct MinusTwoMatchView: View {
    @State var nonmatchSearchPreference = "none"
    @EnvironmentObject var viewModel: SearchViewModel
    @Query var minusTwoMatchCocktails: [Cocktail]
    
    init(passedViewModel: SearchViewModel) {
        let predicate = passedViewModel.predicateFactory(for: passedViewModel.preferredCount - 2)
        _minusTwoMatchCocktails = Query(filter: predicate, sort: \Cocktail.cocktailName)
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
                ingredient.ingredientBase.name == nonmatchSearchPreference ||
                ingredient.ingredientBase.umbrellaCategory == nonmatchSearchPreference ||
                ingredient.ingredientBase.baseCategory == nonmatchSearchPreference ||
                ingredient.ingredientBase.specialtyCategory == nonmatchSearchPreference
            }.count == 0
        }
    }
}
