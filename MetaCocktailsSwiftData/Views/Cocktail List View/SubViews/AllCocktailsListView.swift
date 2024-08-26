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
    
    var body: some View {
        ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
            Section {
                if letter == CocktailListViewModel.sfSymbolForCustomCocktails {
                    customCocktailsSection
                } else {
                    ForEach(cocktails.filter { $0.cocktailName.hasPrefix(letter) }, id: \.self) { cocktail in
                        CocktailListItemView(viewModel: viewModel, cocktail: cocktail, isInCustomSection: false)
                    }
                }
            } header: {
                Text(letter == CocktailListViewModel.sfSymbolForCustomCocktails ? "Custom" : letter)
                    .fontWeight(.bold)
                    .font(.title)
            }
            .id(letter)
        }
    }
    
    private var customCocktailsSection: some View {
        ForEach(cocktails.filter { $0.collection == .custom }) { cocktail in
            CocktailListItemView(viewModel: viewModel, cocktail: cocktail, isInCustomSection: true)
        }
        .onDelete { indexSet in
            for index in indexSet {
                modelContext.delete(cocktails[index])
            }
        }
    }
}

struct SearchBarAllCocktailsListView: View {
    @Bindable var viewModel = CocktailListViewModel()
    var cocktails: [Cocktail]
    
    var body: some View {
        ForEach(cocktails, id: \.self) { cocktail in
            CocktailListItemView(viewModel: viewModel, cocktail: cocktail, isInCustomSection: false)
        }
    }
}

struct CocktailListItemView: View {
    @Bindable var viewModel: CocktailListViewModel
    var cocktail: Cocktail
    @State var isInCustomSection: Bool
    
    var body: some View {
        if cocktail.variation == nil {
            SingleCocktailView(viewModel: viewModel, cocktail: cocktail, isInCustomSection: $isInCustomSection)
        } else if cocktail.titleCocktail == true {
            VariationCocktailView(viewModel: viewModel, cocktail: cocktail)
        } else {
            SingleCocktailView(viewModel: viewModel, cocktail: cocktail, isInCustomSection: $isInCustomSection)
        }
    }
}
struct SingleCocktailView: View {
    
    @Bindable var viewModel: CocktailListViewModel
    let cocktail: Cocktail
    @Binding var isInCustomSection: Bool
    
    var body: some View {
        NavigationLinkWithoutIndicator {
            HStack {
                Text(cocktail.cocktailName)
                Spacer()
                if cocktail.collection == .custom && !isInCustomSection {
                    Text("Custom")
                        .foregroundStyle(Color.brandPrimaryGold)
                        .font(.subheadline)
                }
            }
        } destination: {
            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                .navigationBarBackButtonHidden(true)
        }
    }
    
}
struct VariationCocktailView: View {
    @Bindable var viewModel: CocktailListViewModel
    let cocktail: Cocktail
    
    var body: some View {
        DisclosureGroup {
            ForEach(viewModel.selectedCocktailVariations(for: cocktail), id: \.cocktailName) { variationCocktail in
                NavigationLinkWithoutIndicator {
                    HStack {
                        Text(variationCocktail.cocktailName)
                        Spacer()
                    }
                } destination: {
                    SwipeRecipeView(variations: viewModel.selectedCocktailVariations(for: variationCocktail))
                        .navigationBarBackButtonHidden(true)
                }
            }
        } label: {
            Text(cocktail.variation?.rawValue ?? cocktail.cocktailName)
        }
        .disclosureGroupStyle(InlineDisclosureGroupStyle())
    }
}




