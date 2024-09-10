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

    var body: some View {
        let organizedCocktails = viewModel.organizeCocktails(viewModel.filteredCocktails)
        
        ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
            Section {
                ForEach(organizedCocktails.keys.sorted().filter { $0.hasPrefix(letter) }, id: \.self) { key in
                    if let cocktails = organizedCocktails[key], !cocktails.isEmpty {
                        if cocktails.count > 1 {
                            DisclosureGroupView(cocktails: cocktails, key: key)
                        } else {
                            SingleCocktailListView(cocktail: cocktails[0])
                        }
                    }
                    Divider()
                }
            } header: {
                Text(letter)
                    .font(FontFactory.regularFont(size: 28))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .foregroundStyle(Color(UIColor.systemGray2))
                    .background(Color.black.opacity(0.9))
                    .id(letter)
            }
        }
    }
}

struct DisclosureGroupView: View {
    let cocktails: [Cocktail]
    let key: String
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(key)
                        .font(FontFactory.regularFont(size: 18))
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundStyle(.blueTint)
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            if isExpanded {
                LazyVStack(spacing: 0) {
                    ForEach(cocktails, id: \.id) { cocktail in
                        MultipleCocktailsListView(cocktail: cocktail, cocktails: cocktails)
                            .padding()
                        if cocktail.id != cocktails.last?.id {
                            Divider()
                        }
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
    }
}

struct SingleCocktailListView: View {
    let cocktail: Cocktail
    
    var body: some View {
        NavigationLink(destination: RecipeView(viewModel: RecipeViewModel(cocktail: cocktail)).navigationBarBackButtonHidden(true)) {
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
        }
        .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to maintain tap area
    }
}

struct MultipleCocktailsListView: View {
    let cocktail: Cocktail
    let cocktails: [Cocktail]
    
    var body: some View {
        NavigationLink(destination: SwipeRecipeView(variations: cocktails, initialSelection: cocktail).navigationBarBackButtonHidden(true)) {
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
        }
        .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to maintain tap area
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
