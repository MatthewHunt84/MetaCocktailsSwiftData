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
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState private var isSearchFocused: Bool
    
    @Query(sort: \Cocktail.cocktailName) private var allCocktails: [Cocktail]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ColorScheme.background.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("Select a cocktail to riff on")
                        .font(FontFactory.regularFont(size: 18))
                    Text("The spec will be imported into your new cocktail as a starting template")
                        .font(FontFactory.regularFont(size: 16))
                        .foregroundStyle(.secondary)
                    SearchBarForCreateCocktailView(isFocused: $isSearchFocused, viewModel: viewModel)
                    List {
                        ForEach(viewModel.filteredCocktails, id: \.self) { cocktail in
                            Button {
                                viewModel.clearData()
                                viewModel.populateFromCocktail(cocktail)
                                dismiss()
                            } label: {
                                HStack {
                                    Text(cocktail.cocktailName)
                                        .font(FontFactory.formLabel18)
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                }
                .padding(.top, 20)
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Cocktail Template", dismiss: dismiss)
            .onAppear {
                viewModel.setAllCocktails(allCocktails)
                isSearchFocused = true
            }
            .onDisappear {
                viewModel.resetSearch()
            }
        }
    }
}


struct SearchBarForCreateCocktailView: View {
    
    @FocusState.Binding var isFocused: Bool
    @Bindable var viewModel: AddCocktailViewModel
    var body: some View {
        TextField("Search cocktails", text: $viewModel.searchText)
            .SearchBarTextField()
            .focused($isFocused)
            .animation(.easeInOut(duration: 0.2), value: isFocused)
            .overlay(alignment: .trailing) {
                if !viewModel.searchText.isEmpty {
                    Button {
                        viewModel.searchText = ""
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .tint(ColorScheme.interactionTint)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .onChange(of: viewModel.searchText) { _, newValue in
                viewModel.updateSearch(newValue)
            }
    }
}

