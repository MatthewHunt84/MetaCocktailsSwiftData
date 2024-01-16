//
//  CocktailResultListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/4/24.
//

import SwiftUI

struct CocktailResultList: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel

    var body: some View {
        
        VStack {
            if viewModel.isLoading {
                ZStack(alignment: .center) {
                    Color.red
                    Text("Couldn't load in time")
                }
            } else {
                if viewModel.preferredCount > 0 {
                    VStack{
                        List {
                            if viewModel.enableMultipleSpiritSelection == false {
                                ForEach(viewModel.sections, id: \.self.id) { result in
                                    Section(header: SearchedCocktailTitleHeader(searched: result.count, matched: result.matched)) {
                                        ForEach(result.cocktails, id: \.self.id) { cocktail in
                                            NavigationLink {
                                                RecipeIngredientsView(cocktail: cocktail)
                                            } label: {
                                                HStack {
                                                    Text(cocktail.cocktailName)
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                ForEach(viewModel.sections, id: \.self.id) { result in
                                    Section(header: SearchedCocktailTitleHeaderForMultipleSpirits(searched: result.count, matched: result.matched, baseSpirit: result.baseSpirit)) {
                                        ForEach(result.cocktails, id: \.self.id) { cocktail in
                                            NavigationLink {
                                                RecipeIngredientsView(cocktail: cocktail)
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
                        .listStyle(.grouped)
                        ResultsConfigurationMenu(viewModel: viewModel)
                    }
                } else  {
                    ZStack(alignment: .center) {
                        Color.teal
                        Text("Add more preferences to continue")
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    CocktailResultList(viewModel: SearchCriteriaViewModel())
        .environmentObject(SearchCriteriaViewModel())
}
