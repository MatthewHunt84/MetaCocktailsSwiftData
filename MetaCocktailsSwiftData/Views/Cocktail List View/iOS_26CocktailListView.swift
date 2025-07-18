//
//  iOS_26CocktailListView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/18/25.
//

import SwiftUI


@Observable
class iOS_26NavigationManager {
    var path = NavigationPath()
    
    func navigateTo<T: Hashable>(_ destination: T) {
        path.append(destination)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func popLast() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func pop(_ count: Int) {
        guard count <= path.count else { return }
        path.removeLast(count)
    }
}

@available(iOS 26.0, *)
struct iOS_26CocktailListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    @State private var selectedNavigationLetter: String?
    @State private var navigationManager = iOS_26NavigationManager()
    
    var body: some View {
        
        NavigationStack(path: $navigationManager.path) {
            
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
                .navigationDestination(for: Cocktail.self) { cocktail in
                    RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                        .navigationBarBackButtonHidden(true)
                }
                .searchable(text: $viewModel.searchText, prompt: "Search for cocktails")
                .searchSuggestions {

                            if let top = viewModel.filteredResults.top {
                                iOS26_SingleCocktailListViewTop(cocktail: top)
                                    .listRowSeparator(.hidden)
                            }
                            
                            ForEach(viewModel.filteredResults.others) { cocktail in
                                iOS26_SingleCocktailListView(cocktail: cocktail)
                                    .listRowSeparator(.hidden)
                            }
                }
                .onSubmit(of: .search) {
                    if let firstResult = viewModel.searchResultsCocktails.first {
                        navigationManager.path.append(firstResult)
                    }
                }
            }
            .task {
                viewModel.searchText = ""
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Cocktail List")
            .environment(navigationManager)
        }
    }
}


struct iOS26_SingleCocktailListView: View {
    let cocktail: Cocktail
    @Environment(iOS_26NavigationManager.self) var navigationManager
    
    var body: some View {
        
        Button {
            navigationManager.path.append(cocktail)
        } label: {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, 20)
                    .foregroundStyle(.white)
            }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 35)
        .padding(.vertical, 2)
        }
    }
}

@available(iOS 26.0, *)
struct iOS26_SingleCocktailListViewTop: View {
    let cocktail: Cocktail
    @Environment(iOS_26NavigationManager.self) var navigationManager
    
    var body: some View {
        
        Button {
            navigationManager.path.append(cocktail)
        } label: {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, 20)
                    .foregroundStyle(ColorScheme.tintColor)
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 35)
            .padding(.vertical, 2)
        }
        .buttonStyle(.glass)
    }
    
}

