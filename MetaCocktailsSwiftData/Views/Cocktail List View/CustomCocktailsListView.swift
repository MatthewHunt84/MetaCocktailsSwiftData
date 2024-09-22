//
//  CustomCocktailsListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/28/24.
//

import SwiftUI
import SwiftData

struct CustomCocktailsListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<Cocktail> { cocktail in cocktail.isCustomCocktail == true }) private var customCocktails: [Cocktail]
    @Query(filter: #Predicate<Cocktail> { cocktail in cocktail.favorite == true }) private var favoriteCocktails: [Cocktail]
    @State var organizedCocktails = [String: [Cocktail]]()

    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                VStack {
                    
                    List {
                        
                        if favoriteCocktails.count > 0 {
                            ForEach(favoriteCocktails, id: \.self) { favoriteCocktail in
                                FavoriteCocktailView(cocktail: favoriteCocktail)
                            }
                        } else {
                            NoFavoritesPlaceholderView()
                        }
                        
                        if customCocktails.count > 0 {
                            Section(header: CustomCocktailHeader()) {
                                
                                let organizedCocktails = viewModel.organizeCocktails(customCocktails)
                                
                                ForEach(organizedCocktails.keys.sorted(), id: \.self) { key in
                                    if let cocktails = organizedCocktails[key], !cocktails.isEmpty {
                                        if cocktails.count > 1 {
                                            DisclosureGroup {
                                                ForEach(cocktails, id: \.id) { cocktail in
                                                    CustomMultipleCocktailsListView(cocktail: cocktail, cocktails: cocktails)
                                                        .padding(.leading)
                                                }
                                            } label: {
                                                Text(key)
                                                    .font(FontFactory.regularFont(size: 18))
                                            }
                                            .disclosureGroupStyle(InlineDisclosureGroupStyle())
                                        } else {
                                            
                                            CustomSingleCocktailListView(cocktail: cocktails[0])
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Favorites")
            .navigationViewStyle(StackNavigationViewStyle())
            .task {
                organizedCocktails = viewModel.organizeCocktails(customCocktails)
            }
        }
        
    }
}

fileprivate struct NoFavoritesPlaceholderView: View {
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Spacer()
                Text("You have no favorite cocktails")
                    .font(FontFactory.regularFont(size: 20))
                    .foregroundStyle(.primary)
                Spacer()
            }
            HStack {
                Spacer()
                Text("No rush - Ernest Hemingway took 10 years to choose his favorite cocktail. Then he turned 11.")
                    .multilineTextAlignment(.center)
                    .font(FontFactory.regularFont(size: 16))
                    .italic()
                    .foregroundStyle(.secondary)
                Spacer()
            }
        }
        .listRowBackground(Color.clear)
    }
}

fileprivate struct CustomCocktailHeader: View {
    var body: some View {
        HStack {
            Spacer()
            FontFactory.titleHeader24(title: "Custom Cocktails")
            Spacer()
        }
        .textCase(nil)
        .listRowBackground(Color.clear)
    }
}
    
fileprivate struct CustomSingleCocktailListView: View {
    let cocktail: Cocktail
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationLinkWithoutIndicator {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                Spacer()
            }
        } destination: {
            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                .navigationBarBackButtonHidden(true)
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                modelContext.delete(cocktail)
                do {
                    try modelContext.save()
                } catch {
                    print("Error deleting cocktail: \(error)")
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
            .tint(.red)
        }
    }
}

fileprivate struct FavoriteCocktailView: View {
    let cocktail: Cocktail
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationLinkWithoutIndicator {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                Spacer()
            }
        } destination: {
            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                .navigationBarBackButtonHidden(true)
        }
        .swipeActions(edge: .trailing) {
            Button(role: .none) {
                cocktail.favorite.toggle()
            } label: {
                Label("Remove", systemImage: "heart.slash")
            }
            .tint(.red)
        }
    }
}

fileprivate struct CustomMultipleCocktailsListView: View {
    let cocktail: Cocktail
    let cocktails: [Cocktail]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationLinkWithoutIndicator {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                Spacer()
            }
        } destination: {
            SwipeRecipeView(variations: cocktails, initialSelection: cocktail)
                .navigationBarBackButtonHidden(true)
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                modelContext.delete(cocktail)
                do {
                    try modelContext.save()
                } catch {
                    print("Error deleting cocktail: \(error)")
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
            .tint(.red)
        }
    }
}
