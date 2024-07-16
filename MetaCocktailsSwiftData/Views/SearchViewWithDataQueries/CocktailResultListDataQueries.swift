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
//    @Binding var isLoading: Bool
    @Environment(\.modelContext) var modelContext
    @State private var nonmatchSearchPreference: String = "none"
    @Query var cocktails: [Cocktail]
    
    init(preferredIngredients: [IngredientBase], notPreferredIngredients: [IngredientBase], passedViewModel: SearchViewModel) {
        self.viewModel = passedViewModel
//        self.isLoading = isLoading
        let explicitPreferredCount = viewModel.preferredCount
   
        let matchesAllPreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredients.contains(ingredient.ingredientBase)
            }.count == explicitPreferredCount
        }
        let excludesAllNotPreferredIngredients = #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                notPreferredIngredients.contains(ingredient.ingredientBase)
            }.count > 0
        }
        let predicate = #Predicate<Cocktail> { cocktail in
            matchesAllPreferredIngredients.evaluate(cocktail.spec) && !excludesAllNotPreferredIngredients.evaluate(cocktail.spec)
        }
        
        _cocktails = Query(filter: predicate, sort: \Cocktail.cocktailName)
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
//                if isLoading {
//                    Image("Couldn’tLoad")
//                        .resizable()
//                        .scaledToFit()
//                    
//                } else {
                    if viewModel.preferredCount > 0 {
                        VStack{
                            List {
                                ForEach(cocktails, id: \.cocktailName){ cocktail in
                                    Text(cocktail.cocktailName)
                                    
                                }
//                                ForEach(viewModel.sections, id: \.self.id) { result in
//                                    Section(header: SearchedCocktailTitleHeader(searched: result.count, matched: result.matched)) {
//                                        if result.matched == result.count {
//                                            
//                                            TotalMatchView(resultViewSectionData: result)
//                                            
//                                        } else {
//                                            
//                                            FilterMatchesMenuViewDataQueries(viewModel: viewModel, resultViewSectionData: result, nonmatchSearchPreference: $nonmatchSearchPreference)
//                                            
//                                            if nonmatchSearchPreference == "none" {
//                                                PartialMatchWithNoPreferenceViewDataQueries(viewModel: viewModel, resultViewSectionData: result)
//                                            } else {
//                                                ForEach(result.cocktails.filter({$0.missingIngredients.contains(nonmatchSearchPreference)}), id: \.self.id) { cocktail in
//                                                    NavigationLink {
//                                                        
//                                                        RecipeView(viewModel: RecipeViewModel(cocktail: cocktail.cocktail))
//                                                        
//                                                            .navigationBarBackButtonHidden(true)
//                                                    } label: {
//                                                        VStack {
//                                                            HStack{
//                                                                Text(cocktail.cocktail.cocktailName)
//                                                                Spacer()
//                                                            }
//                                                            HStack{
//                                                                ForEach(cocktail.missingIngredients, id: \.self) { nonMatch in
//                                                                    Text("-\(nonMatch) ")
//                                                                        .foregroundStyle(.brandPrimaryRed)
//                                                                        .font(.caption)
//                                                                }
//                                                                Spacer()
//                                                            }
//                                                        }
//                                                    }
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
                                
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
//            .onAppear() {
//                viewModel.createAPerfectMatchResultViewSectionData(cocktails: cocktails)
//            }
        }
    }
}
//
//#Preview {
//    CocktailResultListDataQueries(viewModel: SearchViewModel(), isLoading: .constant(false))
//     
//}

struct FilterMatchesMenuViewDataQueries: View {
    
    @Bindable var viewModel: SearchViewModel
    var resultViewSectionData: ResultViewSectionData
    @Binding var nonmatchSearchPreference: String
    
    var body: some View {
        Menu("Filter Matches") {
            ForEach(viewModel.preferredIngredients, id: \.id) { preference in
                
                Button("- \(preference.name)") {
                    nonmatchSearchPreference = preference.name
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
    
    var resultViewSectionData: ResultViewSectionData
    
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
    }
}

struct PartialMatchWithNoPreferenceViewDataQueries: View {
    
    @Bindable var viewModel: SearchViewModel
    var resultViewSectionData: ResultViewSectionData
    
    var body: some View {
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
