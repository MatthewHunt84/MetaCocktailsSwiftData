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
    @FocusState private var isSearchFocused: Bool
    
    @Query(sort: \Cocktail.cocktailName) private var allCocktails: [Cocktail]
    
    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradients.meshRedRibbonBackground.ignoresSafeArea()
                VStack {
                    SearchBarForCreateCocktailView(isFocused: $isSearchFocused, viewModel: viewModel)
                    List {
                        ForEach(viewModel.filteredCocktails, id: \.self) { cocktail in
                            Button {
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
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Choose A Cocktail", dismiss: dismiss)
        }
        .onAppear {
            viewModel.setAllCocktails(allCocktails)
            isSearchFocused = true
            
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
                            .tint(.blueTint)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .onChange(of: viewModel.searchText) { _, newValue in
                viewModel.updateSearch(newValue)
            }
    }
}

