//
//  VariationPickerView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/29/24.
//

import SwiftUI
import SwiftData

struct VariationPickerDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState private var isSearchFocused: Bool
    
    @Query(sort: \Cocktail.cocktailName) private var allCocktails: [Cocktail]

    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                VStack {
                    SearchBarForCreateCocktailView(isFocused: $isSearchFocused, viewModel: viewModel)
                    List {
                        ForEach(viewModel.filteredCocktails, id: \.id) { cocktail in
                            if !viewModel.searchText.isEmpty {
                                Button(action: {
                                    viewModel.customVariationName = cocktail.cocktailName
                                    viewModel.searchText = ""
                                    dismiss()
                                }) {
                                    Text(cocktail.cocktailName)
                                        .foregroundColor(.white)
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
            .jamesHeader("Add Variation Name")
        }
        .onAppear {
            viewModel.setAllCocktails(allCocktails)
            isSearchFocused = true
        }
    }
}

struct VariationPicker: View {
    @Bindable var viewModel: AddCocktailViewModel
    @State private var isShowingVariationPicker = false
    @State private var isShowingInfo = false
    var body: some View {
        VStack {
            NavigationLink(destination: VariationPickerDetailView(viewModel: viewModel)) {
                HStack {
                    Text("Variation")
                        .font(FontFactory.formLabel18)
                    Image(systemName: "info.circle")
                        .foregroundStyle(ColorScheme.interactionTint)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                isShowingInfo.toggle()
                            }
                        }
                    Spacer()
                    Text(viewModel.customVariationName ?? "None")
                        .font(FontFactory.formLabel18)
                        .foregroundColor(.gray)
                }
            }
            
            if isShowingInfo {
                Text("If this cocktail is a riff on another cocktail, you may add it here. Variations will be grouped together in the search list and in the custom cocktails tab.")
                    .font(FontFactory.fontBody14)
                    .foregroundStyle(.brandPrimaryGold)
            }
            
        }
    }
}
