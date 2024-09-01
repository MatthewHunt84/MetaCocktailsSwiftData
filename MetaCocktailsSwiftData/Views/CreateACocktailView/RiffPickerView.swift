//
//  RiffPickerView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/31/24.
//


import SwiftUI
import SwiftData

struct RiffPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Bindable var viewModel: AddCocktailViewModel
    @Bindable var cocktailListViewModel = CocktailListViewModel()
    @FocusState private var isSearchFocused: Bool
    
    @Query(sort: \Cocktail.cocktailName) private var allCocktails: [Cocktail]
    
    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradients.meshRedRibbonBackground.ignoresSafeArea()
                VStack {
                    SearchBarForCocktailListView(isFocused: $isSearchFocused, viewModel: cocktailListViewModel)
                    List {
                        ForEach(cocktailListViewModel.filteredCocktails, id: \.self) { cocktail in
                            if !cocktailListViewModel.searchText.isEmpty {
                                NavigationLinkWithoutIndicator {
                                    HStack {
                                        Text(cocktail.cocktailName)
                                            .foregroundColor(.white)
                                            .font(FontFactory.fontBody16)
                                        Spacer()
                                    }
                                } destination: {
                                    AddCocktailView(viewModel: AddCocktailViewModel(basedOn: cocktail), isRiff: true)
                                        .navigationBarBackButtonHidden(true)
                                }
                            } else {
                                EmptyView()
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Choose A Cocktail", dismiss: dismiss)
        }
        .onAppear {
            cocktailListViewModel.setAllCocktails(allCocktails)
            isSearchFocused = true
            
        }
    }
}
