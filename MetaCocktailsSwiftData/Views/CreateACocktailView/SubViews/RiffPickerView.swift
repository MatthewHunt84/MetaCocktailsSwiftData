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
            
            HStack(alignment: .firstTextBaseline) {
                
                FontFactory.mediumText("Choose a cocktail recipe", size: 20)
                
                Image(systemName: "info.circle")
                    .font(.system(size: 16))
                    .foregroundStyle(isShowingRiffPickerInfo ? ColorScheme.tintColor : ColorScheme.interactionTint)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isShowingRiffPickerInfo.toggle()
                        }
                    }
            }
            
            if isShowingRiffPickerInfo {
                Text("The recipe will be used as a starting template")
                    .font(FontFactory.regularFont(size: 16))
                    .foregroundStyle(.secondary)
            }
            
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

