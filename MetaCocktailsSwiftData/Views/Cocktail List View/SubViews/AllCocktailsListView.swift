//
//  AllCocktailsListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI

struct AllCocktailsListView: View {
    @Bindable var viewModel = CocktailListViewModel()
    var cocktails: [Cocktail]
    @Environment(\.modelContext) private var modelContext
    
    func selectedCocktailVariations(for cocktail: Cocktail) -> [Cocktail] {
        if let variation = cocktail.variation {
            let variationsWithSelectedCocktailFirst = cocktails.filter({$0.variation == variation}).sorted {
                $1.cocktailName == cocktail.cocktailName ? false :
                $0.cocktailName == cocktail.cocktailName ? true :
                $0.cocktailName < $1.cocktailName
            }
            return variationsWithSelectedCocktailFirst
        } else {
            return [cocktail]
        }
    }
    
    var body: some View {
        ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
            Section{
                if letter == CocktailListViewModel.sfSymbolForCustomCocktails {
                    ForEach(cocktails) { cocktail in
                        if cocktail.collection == .custom {
                            NavigationLinkWithoutIndicator {
                                HStack{
                                    Text(cocktail.cocktailName)
                                    Spacer()
                                }
                            } destination: {
                                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                    .navigationBarBackButtonHidden(true)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            modelContext.delete(cocktails[index])
                        }
                    }
                }
                ForEach(cocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.self) { cocktail in
                    
                    
                    if cocktail.variation == nil  {
                        
                        if cocktail.collection == .custom {
                            NavigationLinkWithoutIndicator {
                                HStack{
                                    Text(cocktail.cocktailName)
                                    Spacer()
                                    Text("Custom")
                                        .foregroundStyle(Color.brandPrimaryGold)
                                        .font(.subheadline)
                                }
                                .bold()
                            } destination: {
                                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                    .navigationBarBackButtonHidden(true)
                            }
                        } else {
                            
                            NavigationLinkWithoutIndicator {
                                HStack{
                                    Text(cocktail.cocktailName)
                                    Spacer()
                                }
                                .bold()
                            } destination: {
                                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                    .navigationBarBackButtonHidden(true)
                            }
                        }
                    } else {
                        if cocktail.titleCocktail == true {
                            let variations = cocktails.filter({$0.variation == cocktail.variation})
                            DisclosureGroup {
                                ForEach(variations, id: \.cocktailName) { variationCocktail in
                                    
                                    NavigationLinkWithoutIndicator {
                                        HStack{
                                            Text(variationCocktail.cocktailName)
                                            Spacer()
                                        }
                                        .bold()
                                    } destination: {
                                        SwipeRecipeView(variations: selectedCocktailVariations(for: variationCocktail))
                                            .navigationBarBackButtonHidden(true)
                                    }
                                    
                                }
                            } label: {
                                Text(cocktail.cocktailName)
                            }
                            .disclosureGroupStyle(InlineDisclosureGroupStyle())
                        }
                    }
                }
               
            } header: {
                if letter == CocktailListViewModel.sfSymbolForCustomCocktails {
                    Text("Custom")
                        .fontWeight(.bold)
                        .font(.title)
                } else {
                    Text("\(letter)")
                        .fontWeight(.bold)
                        .font(.title)
                }
                
            }.id(letter)
        }
    }
}



#Preview {
    AllCocktailsListView()
}
