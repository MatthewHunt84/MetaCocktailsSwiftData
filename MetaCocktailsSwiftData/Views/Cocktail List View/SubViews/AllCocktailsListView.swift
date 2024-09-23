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
        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
            ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
                Section {
                    let organizedCocktails = viewModel.getOrganizedCocktails(for: letter)
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
                                .frame(height: 35)
                                .padding(.vertical, 2)
                                
                              
                            } else {
                                SingleCocktailListView(cocktail: cocktails[0])
                            }
                        }
                    }
                } header: {
                    ZStack {
                        //copied BlackGlassBackground
                        VisualEffectView(effect: UIBlurEffect(style: .systemThickMaterialDark))
                            .opacity(0.85)
                        
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.2), Color.black.opacity(1)]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                        HStack{
                            Text(letter)
                                .font(FontFactory.listLetter(size: 28))
                                .foregroundColor(Color.secondary)
                                .padding(.horizontal)
                            Spacer()
                        }
                    }
                    .backgroundStyle(Color(UIColor.systemGray6).opacity(0.8))
                }
                .id(letter)
            }
        }
    }
}

struct SingleCocktailListView: View {
    let cocktail: Cocktail
    
    var body: some View {
        NavigationLink {
            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, 20)
                    .foregroundStyle(.white)
                Spacer()
                if cocktail.isCustomCocktail == true {
                    Text("Custom")
                        .foregroundStyle(Color.brandPrimaryGold)
                        .font(FontFactory.regularFont(size: 15))
                        
                }
            }
        }
        .frame(height: 35)
        .padding(.vertical, 2)
    }
}

struct MultipleCocktailsListView: View {
    let cocktail: Cocktail
    let cocktails: [Cocktail]
    
    var body: some View {
       
        NavigationLink {
            SwipeRecipeView(variations: cocktails, initialSelection: cocktail)
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .foregroundStyle(.white)
                Spacer()
                if cocktail.isCustomCocktail == true {
                    Text("Custom")
                        .foregroundStyle(Color.brandPrimaryGold)
                        .font(FontFactory.regularFont(size: 15))
                }
            }
        }
        .frame(height: 35)
        .padding(.vertical, 2)
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
