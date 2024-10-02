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
    @State var isShowingRiffPickerInfo = false
    
    @Query(sort: \Cocktail.cocktailName) private var allCocktails: [Cocktail]
    
    var body: some View {
        
        VStack {
            
            ModalHeader(title: "Cocktail Template")
            
            InfoDisclosureHeader(isShowingDetail: $isShowingRiffPickerInfo,
                                 text: "Choose a cocktail recipe",
                                 detail: "The recipe will be used as a starting template")
            
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
            
            Spacer()
        }
        .padding()
        .background(BlackGlassBackgroundView())
        .onAppear {
            viewModel.setAllCocktails(allCocktails)
            isSearchFocused = true
        }
        .onDisappear {
            viewModel.resetSearch()
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
            .clearSearchButton(text: $viewModel.searchText) {
                viewModel.searchText = ""
            }
            .onChange(of: viewModel.searchText) { _, newValue in
                viewModel.updateSearch(newValue)
            }
    }
}

