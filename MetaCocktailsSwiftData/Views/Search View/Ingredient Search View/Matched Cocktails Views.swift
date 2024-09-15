//
//  Matched Cocktails Views.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/13/24.
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
        .listStyle(.insetGrouped)
        .backgroundStyle(.clear)
    }
}

struct FilterMatchesMenuDataQueriesView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @Binding var nonmatchSearchPreference: String
    
    var body: some View {
        
        Menu {
            Text("Show only cocktails missing:")
            
            ForEach(viewModel.preferredSelections, id: \.self) { preference in
                
                Button {
                    nonmatchSearchPreference = preference
                } label: {
                    Text("- \(preference)")
                }
            }
            
            Button {
                nonmatchSearchPreference = "none"
            } label: {
                Text("- Show all cocktails")
            }
            
        } label: {
            HStack {
                Text("Filter Matches")
                    .fontWeight(.semibold)
                    .tint(ColorScheme.interactionTint)
            }
        }
        .tint(ColorScheme.interactionTint)
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
                                .foregroundStyle(.secondary)
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
    
    init(passedViewModel: SearchViewModel) {
        let predicate = passedViewModel.predicateFactory(for: passedViewModel.preferredCount - 1)
        _minusOneMatchCocktails = Query(filter: predicate, sort: \Cocktail.cocktailName)
    }
    
    var body: some View {
        if minusOneMatchCocktails.isEmpty || viewModel.preferredSelections.count < 2 {
            EmptyView()
        } else {
            Section(header: SearchedCocktailTitleHeader(searched: viewModel.preferredCount, matched: (viewModel.preferredCount - 1))) {
                ForEach(viewModel.groupMinusOne(cocktails: minusOneMatchCocktails), id: \.0) { missingIngredient, cocktails in
                    if !cocktails.isEmpty {
                        Section(header: viewModel.minusOneHeader(missingIngredient: missingIngredient)) {
                            ForEach(cocktails, id: \.self) { cocktail in
                                NavigationLink {
                                    RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                        .navigationBarBackButtonHidden(true)
                                } label: {
                                    Text(cocktail.cocktailName)
                                        .font(FontFactory.mediumFont(size: 16))
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
            }
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
                ForEach(filtered(minusTwoMatchCocktails), id: \.self) { cocktail in
                    
                    NavigationLink {
                        RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        VStack {
                            HStack {
                                Text(cocktail.cocktailName)
                                    .foregroundStyle(.secondary)
                                Spacer()
                            }
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
