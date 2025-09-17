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
            
            VStack {
                
                List {
                    
                    if favoriteCocktails.count > 0 {
                        ForEach(favoriteCocktails, id: \.self) { favoriteCocktail in
                            FavoriteCocktailView(cocktail: favoriteCocktail)
                        }
                    } else {
                        ContentUnavailableView("No Favorites", systemImage: "magnifyingglass", description: Text("You may add or remove favorited cocktails from their recipe view"))
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
                        .padding(.top, 10)
                    }
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
            }
            .background(ColorScheme.background)
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Favorites")
            .navigationViewStyle(StackNavigationViewStyle())
            .task {
                organizedCocktails = viewModel.organizeCocktails(customCocktails)
            }
        }
        
    }
}

fileprivate struct CustomCocktailHeader: View {
    var body: some View {
        HStack {
            Spacer()
            FontFactory.titleHeader22(title: "Custom Cocktails")
            Spacer()
        }
        .textCase(nil)
        .listRowBackground(Color.clear)
    }
}
    
fileprivate struct CustomSingleCocktailListView: View {
    let cocktail: Cocktail
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var cocktailListViewModel: CocktailListViewModel
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
                cocktailListViewModel.shouldReloadCache = true
                Task {
                    await cocktailListViewModel.fetchCocktails(modelContext: modelContext)
                    cocktailListViewModel.updateAndCache()
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
    @EnvironmentObject var cocktailListViewModel: CocktailListViewModel
    
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
                cocktailListViewModel.shouldReloadCache = true
                Task {
                    await cocktailListViewModel.fetchCocktails(modelContext: modelContext)
                    cocktailListViewModel.updateAndCache()
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
            .tint(.red)
        }
    }
}
