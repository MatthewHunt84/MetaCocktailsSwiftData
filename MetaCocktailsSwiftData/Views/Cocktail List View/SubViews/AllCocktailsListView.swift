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
                ForEach(organizedCocktails.keys.sorted().filter { $0.hasPrefix(letter) }, id: \.self) { titleCocktail in
                    if let cocktails = organizedCocktails[titleCocktail], !cocktails.isEmpty {
                        VStack(spacing: 0) {
                            if cocktails.count > 1 {
                                LazyListDisclosureGroupView(cocktails: cocktails, titleCocktail: titleCocktail)
                                    .padding(.vertical, 8)
                            } else {
                                SingleCocktailListView(cocktail: cocktails[0])
                                    .padding(.vertical, 8)
                            }
                            Divider()
                        }
                        
                    }
                }
            } header: {
                Text(letter)
                    .font(FontFactory.regularFont(size: 28))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .foregroundStyle(Color(UIColor.systemGray2))
                    .background(Color.black)
                    .id(letter)
            }
        }
    }
}

struct LazyListDisclosureGroupView: View {
    let cocktails: [Cocktail]
    let titleCocktail: String
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(titleCocktail)
                        .font(FontFactory.regularFont(size: 18))
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundStyle(.blueTint)
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(cocktails, id: \.id) { cocktail in
                        VStack(spacing: 0) {
                            MultipleCocktailsListView(cocktail: cocktail, cocktails: cocktails)
                                .padding(.vertical)
                            if cocktail.id != cocktails.last?.id {
                                Divider()
                            }
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
        .buttonStyle(PlainButtonStyle())
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
        .buttonStyle(PlainButtonStyle())
    }
}

struct SearchBarAllCocktailsListView: View {
    @Bindable var viewModel: CocktailListViewModel

    var body: some View {
        let organizedCocktails = viewModel.organizeCocktails(viewModel.filteredCocktails)
        ForEach(organizedCocktails.keys.sorted(), id: \.self) { titleCocktail in
            if let cocktails = organizedCocktails[titleCocktail], !cocktails.isEmpty {
                if cocktails.count > 1 {
                    LazyListDisclosureGroupView(cocktails: cocktails, titleCocktail: titleCocktail)
                        .padding(.vertical, 8)
                } else {
                    SingleCocktailListView(cocktail: cocktails[0])
                        .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .listRowBackground(Color.clear)
    }
}
