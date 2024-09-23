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
    @Binding var animatingLetter: String?

    var body: some View {
        let organizedCocktails = viewModel.organizeCocktails(viewModel.filteredCocktails)
        
        ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
            Section {
                ForEach(organizedCocktails.keys.sorted().filter { $0.hasPrefix(letter) }, id: \.self) { key in
                    if let cocktails = organizedCocktails[key], !cocktails.isEmpty {
                        if cocktails.count > 1 {
                            DisclosureGroup {
                                ForEach(cocktails, id: \.id) { cocktail in
                                    MultipleCocktailsListView(cocktail: cocktail, cocktails: cocktails)
                                        .padding(.leading)
                                }
                            } label: {
                                Text(key)
                                    .font(FontFactory.regularFont(size: 18))
                            }
                            .disclosureGroupStyle(InlineDisclosureGroupStyle())
                        } else {
                            SingleCocktailListView(cocktail: cocktails[0])
                        }
                    }
                }
                .listRowBackground(Color.clear)
            } header: {
               AnimatedSectionHeader(letter: letter, animatingLetter: $animatingLetter)
//                Text(letter)
//                    .font(FontFactory.listLetter(size: 28))
//                    .foregroundColor(Color.secondary)
            }
            .id(letter)
        }
    }
}

struct AnimatedSectionHeader: View {
    let letter: String
    @Binding var animatingLetter: String?
    
    @State private var isAnimating = false
    
    var body: some View {
        Text(letter)
            .font(FontFactory.listLetter(size: 28))
            .foregroundColor(Color.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isAnimating ? Color.brandPrimaryGold : Color.clear)
                    .animation(.easeInOut(duration: 0.3), value: isAnimating)
            )
            .onChange(of: animatingLetter) { oldValue, newValue in
                if newValue == letter {
                    isAnimating = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isAnimating = false
                        animatingLetter = nil
                    }
                }
            }
    }
}

struct SingleCocktailListView: View {
    let cocktail: Cocktail
    
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

        }
    }
}
struct MultipleCocktailsListView: View {
    let cocktail: Cocktail
    let cocktails: [Cocktail]
    
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
        }
    }
}

struct SearchBarAllCocktailsListView: View {
    @Bindable var viewModel: CocktailListViewModel

    var body: some View {
        let organizedCocktails = viewModel.organizeCocktails(viewModel.filteredCocktails)
        
        ForEach(organizedCocktails.keys.sorted(), id: \.self) { key in
            if let cocktails = organizedCocktails[key], !cocktails.isEmpty {
                if cocktails.count > 1 {
                    DisclosureGroup {
                        ForEach(cocktails, id: \.id) { cocktail in
                            MultipleCocktailsListView(cocktail: cocktail, cocktails: cocktails)
                                .padding(.leading)
                        }
                    } label: {
                        Text(key)
                            .font(FontFactory.regularFont(size: 18))
                    }
                    .disclosureGroupStyle(InlineDisclosureGroupStyle())
                } else {
                    SingleCocktailListView(cocktail: cocktails[0])
                }
            }
        }
        .listRowBackground(Color.clear)
    }
}
