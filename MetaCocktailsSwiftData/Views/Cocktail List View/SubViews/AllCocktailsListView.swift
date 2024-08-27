//
//  AllCocktailsListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI
import SwiftData

struct AllCocktailsListView: View {
    @Bindable var viewModel = CocktailListViewModel()
    var cocktails: [Cocktail]
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<Cocktail> { cocktail in
        cocktail.isCustomCocktail == true
    }, sort: \Cocktail.cocktailName) private var customCocktails: [Cocktail]
    var body: some View {
        
        ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
            Section {
                if letter == CocktailListViewModel.sfSymbolForCustomCocktails {
                    ForEach(customCocktails, id: \.id) { cocktail in
                        CocktailListItemView(viewModel: viewModel, cocktail: cocktail, isInCustomSection: true)
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            modelContext.delete(cocktails[index])
                        }
                    }
                    .listRowBackground(Color.clear)
                    
                } else {
                    ForEach(cocktails.filter { $0.cocktailName.hasPrefix(letter) }, id: \.id) { cocktail in
                        CocktailListItemView(viewModel: viewModel, cocktail: cocktail, isInCustomSection: false)
                    }
                    .listRowBackground(Color.clear)
                }
            } header: {
                Text(letter == CocktailListViewModel.sfSymbolForCustomCocktails ? "" : letter)
                    .font(FontFactory.regularFont(size: 28))
            }
            .id(letter)
        }
    }
}

struct SearchBarAllCocktailsListView: View {
    @Bindable var viewModel: CocktailListViewModel
    var cocktails: [Cocktail]

    var body: some View {
        ForEach(cocktails, id: \.id) { cocktail in
            //This prevents duplicate listings of variation cocktails
            if cocktail.variation == nil || cocktail.titleCocktail == true {
                CocktailListItemView(viewModel: viewModel, cocktail: cocktail, isInCustomSection: false)
            }
        }
        .listRowBackground(Color.clear)
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
                    .font(FontFactory.regularFont(size: 18))
                Spacer()
                if cocktail.collection == .custom && !isInCustomSection {
                    Text("Custom")
                        .foregroundStyle(Color.brandPrimaryGold)
                        .font(FontFactory.regularFont(size: 15))
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
            ForEach(viewModel.selectedCocktailVariations(for: cocktail), id: \.id) { variationCocktail in
                NavigationLinkWithoutIndicator {
                    HStack {
                        Text(variationCocktail.cocktailName)
                            .font(FontFactory.regularFont(size: 18))
                        Spacer()
                    }
                } destination: {
                    SwipeRecipeView(variations: viewModel.selectedCocktailVariations(for: variationCocktail))
                        .navigationBarBackButtonHidden(true)
                }
            }
        } label: {
            Text(cocktail.variation?.rawValue ?? cocktail.cocktailName)
                .font(FontFactory.regularFont(size: 18))
        }
        .disclosureGroupStyle(InlineDisclosureGroupStyle())
    }
}




