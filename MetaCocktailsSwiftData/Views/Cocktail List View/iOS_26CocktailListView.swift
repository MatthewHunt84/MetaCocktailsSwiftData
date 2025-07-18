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
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $navigationPath) {
            
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
                    ForEach(viewModel.searchResultsCocktails, id: \.self) { cocktail in
                        iOS26_SingleCocktailListView(cocktail: cocktail)
                            .navigationBarBackButtonHidden(true)
                    }
                }
                .onSubmit(of: .search) {
                    if let firstResult = viewModel.searchResultsCocktails.first {
                        navigationPath.append(firstResult)
                    }
                }
            }
            .task {
                viewModel.searchText = ""
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Cocktail List")
        }
    }
}

struct iOS26_SingleCocktailListView: View {
    let cocktail: Cocktail
    
    var body: some View {
        NavigationLink(value: cocktail) {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, 20)
                    .foregroundStyle(.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 35)
        .padding(.vertical, 2)
    }
}

