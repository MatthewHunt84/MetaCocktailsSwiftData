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
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    
    @Query(sort: \Cocktail.cocktailName) private var allCocktails: [Cocktail]
    
    var filteredCocktails: [String] {
        guard !searchText.isEmpty else { return [] }
        return allCocktails.map { $0.cocktailName }
            .filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradients.meshRedRibbonBackground.ignoresSafeArea()
                
                VStack {
                    TextField("Search cocktails", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .focused($isSearchFocused)
                    
                    List {
                        ForEach(filteredCocktails, id: \.self) { cocktailName in
                            Button(action: {
                                viewModel.customVariationName = cocktailName
                                dismiss()
                            }) {
                                Text(cocktailName)
                                    .foregroundColor(.white)
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
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundStyle(isShowingInfo ? .brandPrimaryGold : .blue)
                        .onTapGesture {
                            isShowingInfo.toggle()
                        }
                    Spacer()
                    Text(viewModel.customVariationName ?? "None")
                        .font(FontFactory.formLabel18)
                        .foregroundColor(.gray)
                }
            }
            if isShowingInfo {
                Text("If this cocktail is a riff on another cocktail, you may add it here. Variations will be grouped together in the search list and in the custom cocktails tab.")
                    .font(FontFactory.sectionHeader12)
                    .foregroundStyle(.brandPrimaryGold)
                    .padding(.top, 10)
            }
        }
    }
}
