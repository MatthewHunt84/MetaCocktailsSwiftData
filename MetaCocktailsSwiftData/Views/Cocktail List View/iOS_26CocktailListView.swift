//
//  iOS_26CocktailListView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/18/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct iOS_26CocktailListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    @State private var selectedNavigationLetter: String?
    @State private var navigationManager = iOS_26_SearchViewNavigationManager()
    
    var body: some View {
        
        NavigationStack(path: $navigationManager.path ) {
            
            GeometryReader { outerGeo in
                
                ZStack {
                    
                    ColorScheme.background.ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        
                        GeometryReader { listGeo in
                            
                            HStack(spacing: 0) {
                                
                                ScrollViewReader { proxy in
                                    
                                    ScrollView {
                                        AllCocktailsListView(animatingLetter: $selectedNavigationLetter)
                                    }
                                    .scrollEdgeEffectStyle(.soft, for: .all)
                                    .frame(width: listGeo.size.width * 0.90)
                                    .onChange(of: selectedNavigationLetter) { oldValue, newValue in
                                        if let newValue = newValue {
                                            withAnimation(.easeOut(duration: 0.2)) {
                                                proxy.scrollTo(newValue, anchor: .top)
                                            }
                                        }
                                    }
                                }
                                
                                AlphabetNavigationView(selectedLetter: $selectedNavigationLetter, alphabet: viewModel.cocktailListAlphabet)
                                    .frame(width: listGeo.size.width * 0.1)
                                    .offset(y: -7)
                            }
                        }
                    }
                    .frame(height: outerGeo.size.height)
                }
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeader("Cocktail List")
                .navigationDestination(for: Cocktail.self) { cocktail in
                    RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    
                    // Hack due to .searchable nav link / nav bar space bug (iOS 17/18/26)
                    // https://www.hackingwithswift.com/forums/swiftui/searchable-navigationlinks-seem-to-present-views-which-ignore-navigationbar-modifiers/29864
                        .padding(.top, 50)
                        .ignoresSafeArea(.all, edges: .top)
                }
                .listStyle(.grouped)
                .searchable(text: $viewModel.searchText, prompt: "Search cocktails")
                .searchSuggestions {
                    // SearchSuggestions formatting is a pain, but everything here that looks wrong is necessary as of the iOS26 beta
                    LazyVStack {
                        if let top = viewModel.filteredResults.top {
                            iOS26_SingleCocktailListViewTop(cocktail: top)
                                .listRowSeparator(.hidden)
                                .padding(.leading, -10)
                        }
                        
                        ForEach(viewModel.filteredResults.others) { cocktail in
                            iOS26_SingleCocktailListView(cocktail: cocktail)
                                .listRowSeparator(.hidden)
                        }
                    }
//                    .frame(height: 500)
                    .listRowSeparator(.hidden)
//                    .environment(\.defaultMinListRowHeight, 0)

                }
                .environment(navigationManager)
                .onSubmit(of: .search) {
                    // This will still fire when the user taps a cocktail, so we check a flag here
                    // Otherwise when  we tap a cocktail that gets pushed AND the top cocktail still gets pushed
                    guard !viewModel.didTapCocktail else { return }
                    if let firstResult = viewModel.searchResultsCocktails.first {
                        navigationManager.path.append(firstResult)
                    }
                }
                .task {
                    viewModel.didTapCocktail = false
                    viewModel.searchText = ""
                }
                .environment(navigationManager)
            }
        }
    }
}


struct iOS26_SingleCocktailListView: View {
    let cocktail: Cocktail
    @Environment(iOS_26_SearchViewNavigationManager.self) var navigationManager
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    var body: some View {
        
        Button {
            viewModel.didTapCocktail = true
            navigationManager.path.append(cocktail)
        } label: {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 20))
                    .padding(5)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
//            .frame(height: 12)
        }
    }
}

@available(iOS 26.0, *)
struct iOS26_SingleCocktailListViewTop: View {
    let cocktail: Cocktail
    @Environment(iOS_26_SearchViewNavigationManager.self) var navigationManager
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    var body: some View {
        
        Button {
            viewModel.didTapCocktail = true
            navigationManager.path.append(cocktail)
        } label: {
            Text(cocktail.cocktailName)
                .ignoresSafeArea(.all)
                .font(FontFactory.regularFont(size: 20))
                .foregroundStyle(ColorScheme.tintColor)
                .bold()
                .padding(.vertical, 10)
                .padding(.leading, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                .glassEffect(.clear)
        }
    }
}

