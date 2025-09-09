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
                        .padding()
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
            .jamesHeaderWithNavigation(title: "Add Variation Name")
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
    @Binding var isShowingInfo: Bool

    var body: some View {
        VStack(spacing: 0) {
            NavigationLink(destination: VariationPickerDetailView(viewModel: viewModel).navigationBarBackButtonHidden(true)) {
                HStack {
                    Text("Variation")
                        .font(FontFactory.formLabel18)
                    Image(systemName: "info.circle.fill")
                        .foregroundStyle(ColorScheme.interactionTint)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isShowingInfo.toggle()
                            }
                        }
                    Spacer()
                    Text(viewModel.customVariationName ?? "None")
                        .font(FontFactory.formLabel18)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct VariationInfoView: View {
    @Binding var isShowingInfo: Bool
    
    var body: some View {
        Section {
            if isShowingInfo {
                Text("If this cocktail is a riff on another cocktail, you may add it here. Variations will be grouped together in the search list and in the custom cocktails tab.")
                    .font(FontFactory.fontBody14)
                    .foregroundStyle(.brandPrimaryGold)
                    .backgroundStyle(Color.clear)
            }
        }
        .listSectionSpacing(0)
        .listRowBackground(Color.clear)
    }
}
