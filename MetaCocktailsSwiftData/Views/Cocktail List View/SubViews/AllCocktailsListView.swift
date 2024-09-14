//
//  AllCocktailsListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI
import SwiftData

struct AllCocktailsListView: View {
    @Bindable var viewModel: CocktailListViewModel
    @Environment(\.modelContext) private var modelContext
    @Binding var isReturningFromRecipe: Bool
    

    var body: some View {
        let organizedCocktails = viewModel.organizeCocktails(viewModel.filteredCocktails)
        
        ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
            Section {
                ForEach(organizedCocktails.keys.sorted().filter { $0.hasPrefix(letter) }, id: \.self) { key in
                    if let cocktails = organizedCocktails[key], !cocktails.isEmpty {
                        if cocktails.count > 1 {
                            DisclosureGroup {
                                ForEach(cocktails, id: \.id) { cocktail in
                                    MultipleCocktailsListView(cocktail: cocktail, cocktails: cocktails, isReturningFromRecipe: $isReturningFromRecipe)
                                        .padding(.leading)
                                }
                            } label: {
                                Text(key)
                                    .font(FontFactory.regularFont(size: 18))
                            }
                            .disclosureGroupStyle(InlineDisclosureGroupStyle())
                        } else {
                            SingleCocktailListView(cocktail: cocktails[0], isReturningFromRecipe: $isReturningFromRecipe)
                        }
                    }
                }
                .listRowBackground(Color.clear)
            } header: {
                Text(letter)
                    .font(FontFactory.listLetter(size: 28))
                    .foregroundColor(Color.secondary)
            }
            .id(letter)
        }
    }
}
struct SingleCocktailListView: View {
    let cocktail: Cocktail
    @Binding var isReturningFromRecipe: Bool
    
    var body: some View {
        NavigationLinkWithoutIndicator {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, 20)
                Spacer()
                if cocktail.isCustomCocktail == true {
                    Text("Custom")
                        .foregroundStyle(Color.brandPrimaryGold)
                        .font(FontFactory.regularFont(size: 15))
                }
            }
        } destination: {
            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                .navigationBarBackButtonHidden(true)
                .onDisappear {
                    isReturningFromRecipe = true
                }
        }
    }
}

struct MultipleCocktailsListView: View {
    let cocktail: Cocktail
    let cocktails: [Cocktail]
    @Binding var isReturningFromRecipe: Bool
    
    var body: some View {
        NavigationLinkWithoutIndicator {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                Spacer()
                if cocktail.isCustomCocktail == true {
                    Text("Custom")
                        .foregroundStyle(Color.brandPrimaryGold)
                        .font(FontFactory.regularFont(size: 15))
                }
            }
        } destination: {
            SwipeRecipeView(variations: cocktails, initialSelection: cocktail)
                .navigationBarBackButtonHidden(true)
                .onDisappear {
                    isReturningFromRecipe = true
                }
        }
    }
}

struct SearchBarAllCocktailsListView: View {
    @Bindable var viewModel: CocktailListViewModel
    @Binding var isReturningFromRecipe: Bool

    var body: some View {
        let organizedCocktails = viewModel.organizeCocktails(viewModel.filteredCocktails)
        
        ForEach(organizedCocktails.keys.sorted(), id: \.self) { key in
            if let cocktails = organizedCocktails[key], !cocktails.isEmpty {
                if cocktails.count > 1 {
                    DisclosureGroup {
                        ForEach(cocktails, id: \.id) { cocktail in
                            MultipleCocktailsListView(cocktail: cocktail, cocktails: cocktails, isReturningFromRecipe: $isReturningFromRecipe)
                                .padding(.leading)
                        }
                    } label: {
                        Text(key)
                            .font(FontFactory.regularFont(size: 18))
                    }
                    .disclosureGroupStyle(InlineDisclosureGroupStyle())
                } else {
                    SingleCocktailListView(cocktail: cocktails[0], isReturningFromRecipe: $isReturningFromRecipe)
                }
            }
        }
        .listRowBackground(Color.clear)
    }
}
