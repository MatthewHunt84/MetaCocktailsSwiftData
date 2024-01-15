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
                    
                    
                    List {
                        Button {
                            viewModel.enableMultipleSpiritSelection.toggle()
                            viewModel.getFilteredCocktails()
                            
                        } label: {
                            if viewModel.enableMultipleSpiritSelection == true {
                                Label("Results for separate base spirits is enabled.", systemImage: "circle.fill")
                                    .tint(.green)
                                    .font(.footnote).bold()
                                
                                
                            } else {
                                Label("Results for separate base spirits is disabled.", systemImage: "circle")
                                    .tint(.red)
                                    .font(.footnote).bold()
                                
                            }
                            
                            
                        }
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

