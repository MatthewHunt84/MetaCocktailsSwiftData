//
//  PrepBibleView.swift
//  MetaCocktails
//
//  Created on 4/8/25.
//

import SwiftUI
import SwiftData

struct PrepBibleView: View {
    
    @StateObject private var viewModel = PrepBibleViewModel()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @FocusState private var searchBarIsFocused: Bool
    @State private var selectedNavigationLetter: String?
    @Query private var ingredientBases: [IngredientBase]
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { outerGeo in
                ZStack {
                    ColorScheme.background.ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        SearchBarForPrepBibleView(
                            isFocused: $searchBarIsFocused,
                            searchText: $viewModel.searchText,
                            onSearchChanged: viewModel.updateSearch
                        )
                        
                        GeometryReader { listGeo in
                            HStack(spacing: 0) {
                                ScrollViewReader { proxy in
                                    ScrollView {
                                        if searchBarIsFocused {
                                            SearchBarPrepResultsView(prepRecipes: viewModel.filteredPrepRecipes)
                                        } else {
                                            AllPrepRecipesListView(
                                                prepAlphabet: viewModel.prepAlphabet,
                                                organizedPrep: viewModel.organizedPrepRecipes,
                                                animatingLetter: $selectedNavigationLetter
                                            )
                                        }
                                    }
                                    .frame(width: listGeo.size.width * 0.90)
                                    .onChange(of: selectedNavigationLetter) { _, newValue in
                                        guard let newValue else { return }
                                        withAnimation(.easeOut(duration: 0.2)) {
                                            proxy.scrollTo(newValue, anchor: .top)
                                        }
                                    }
                                }
                                
                                AlphabetNavigationViewForPrep(
                                    selectedLetter: $selectedNavigationLetter,
                                    alphabet: viewModel.prepAlphabet
                                )
                                .frame(width: listGeo.size.width * 0.1)
                                .opacity(searchBarIsFocused ? 0 : 1)
                                .animation(.easeInOut(duration: 0.3), value: searchBarIsFocused)
                                .offset(y: -7)
                                
                            }
                        }
                    }
                    .frame(height: outerGeo.size.height)
                }
            }
            .task {
                viewModel.loadPrepRecipes(from: ingredientBases)
                searchBarIsFocused = false
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Prep Bible", dismiss: dismiss)
        }
    }
}

struct SearchBarForPrepBibleView: View {
    @FocusState.Binding var isFocused: Bool
    @Binding var searchText: String
    var onSearchChanged: (String) -> Void
    
    var body: some View {
        HStack {
            TextField("Search prep recipes", text: $searchText)
                .searchBarTextField()
                .focused($isFocused)
                .sensoryFeedback(.impact(weight: .heavy), trigger: isFocused == true)
                .animation(.easeInOut(duration: 0.2), value: isFocused)
                .clearSearchButton(text: $searchText) {
                    searchText = ""
                    onSearchChanged("")
                }
                .onChange(of: searchText) { _, newValue in
                    onSearchChanged(newValue)
                }
                .onSubmit {
                    searchText = ""
                }
                .onTapGesture {
                    isFocused = true
                }
                .onDisappear{
                    searchText = ""
                    isFocused = false
                }
                .submitLabel(.done)
        }
        .padding()
    }
}

struct AlphabetNavigationViewForPrep: View {
    @Binding var selectedLetter: String?
    let alphabet: [String]
    @State private var animatingLetter: String?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ForEach(alphabet, id: \.self) { letter in
                    Button(action: {
                        selectedLetter = letter
                        withAnimation(.none) {
                            animatingLetter = letter
                        }
                        withAnimation(.easeOut(duration: 0.5).delay(0.1)) {
                            animatingLetter = nil
                        }
                    }) {
                        Text(letter)
                            .font(FontFactory.alphabetFont(for: geometry.size.height, isSelected: animatingLetter == letter))
                            .foregroundColor(animatingLetter == letter ? ColorScheme.tintColor : .primary)
                            .frame(width: geometry.size.width, height: geometry.size.height / CGFloat(alphabet.count))
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(ScaleButtonStyle())
                    .sensoryFeedback(.impact(weight: .heavy), trigger: selectedLetter == letter)
                }
            }
        }
    }
}

struct AllPrepRecipesListView: View {
    let prepAlphabet: [String]
    let organizedPrep: [String: [Prep]]
    @Binding var animatingLetter: String?
    
    var body: some View {
        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
            ForEach(prepAlphabet, id: \.self) { letter in
                if let preps = organizedPrep[letter], !preps.isEmpty {
                    Section {
                        ForEach(preps, id: \.prepIngredientName) { prep in
                            PrepItemView(prep: prep)
                        }
                    } header: {
                        PrepSectionHeaderView(letter: letter, animatingLetter: $animatingLetter)
                    }
                    .id(letter)
                }
            }
        }
    }
}

struct PrepItemView: View {
    let prep: Prep
    
    var body: some View {
        NavigationLink{
            PrepBibleRecipeView(prep: prep)
        } label: {
            HStack {
                Text(prep.prepIngredientName)
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

struct PrepSectionHeaderView: View {
    let letter: String
    @Binding var animatingLetter: String?
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            BlackGlassBackgroundView()
                .clipShape(RoundedRectangle(cornerRadius: 4))
            
            headerSelectionGradient
            
            HStack {
                Text(letter)
                    .font(FontFactory.listLetter(size: 28))
                    .foregroundColor(isAnimating ? ColorScheme.tintColor : .secondary)
                    .padding(.horizontal)
                Spacer()
            }
        }
        .task(id: animatingLetter) {
            if letter == animatingLetter {
                isAnimating = true
                try? await Task.sleep(for: .milliseconds(100))
                withAnimation(.easeOut(duration: 1.5)) {
                    isAnimating = false
                }
                animatingLetter = nil
            }
        }
    }
    
    var headerSelectionGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                isAnimating ? ColorScheme.tintColor.opacity(0.2) : .clear,
                ColorScheme.background
            ]),
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
    }
}

struct SearchBarPrepResultsView: View {
    let prepRecipes: [Prep]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(prepRecipes, id: \.prepIngredientName) { prep in
                PrepItemView(prep: prep)
            }
        }
    }
}

#Preview {
    PrepBibleView()
}
