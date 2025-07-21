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
    
    
    var body: some View {
        
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
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Cocktail List")
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
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, 20)
                    .foregroundStyle(.white)
            }
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
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, 20)
                    .foregroundStyle(ColorScheme.tintColor)
                    .bold()
            }
            .frame(height: 50)
            .glassEffect(.clear)
        }
    }
}

