//
//  CocktailListView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import SwiftData

struct CocktailListView: View {
    @Bindable var viewModel = CocktailListViewModel()
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @FocusState private var searchBarIsFocused: Bool
    @State private var selectedNavigationLetter: String?
    
    var body: some View {
        NavigationStack {
            GeometryReader { outerGeo in
                ZStack {
                    ColorScheme.background.ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        SearchBarForCocktailListView(isFocused: $searchBarIsFocused, viewModel: viewModel)
                        GeometryReader { listGeo in
                            HStack(spacing: 0) {
                                ScrollViewReader { proxy in
                                    ScrollView {
                                        if searchBarIsFocused {
                                            SearchBarAllCocktailsListView(viewModel: viewModel)
                                        } else {
                                            AllCocktailsListView(viewModel: viewModel, animatingLetter: $selectedNavigationLetter)
                                        }
                                    }
                                    .frame(width: listGeo.size.width * 0.90)
                                    .onChange(of: selectedNavigationLetter) { oldValue, newValue in
                                        if let newValue = newValue {
                                            withAnimation(.easeOut(duration: 0.2)) {
                                                proxy.scrollTo(newValue, anchor: .top)
                                            }
                                            selectedNavigationLetter = nil
                                        }
                                    }
                                }
                                AlphabetNavigationView(selectedLetter: $selectedNavigationLetter, alphabet: viewModel.cocktailListAlphabet)
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
            .onAppear {
                viewModel.searchText = ""
                searchBarIsFocused = false
                viewModel.setAllCocktails(cocktails)
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Cocktail List")
        }
    }
}

struct AlphabetNavigationView: View {
    @Binding var selectedLetter: String?
    let alphabet: [String]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ForEach(alphabet, id: \.self) { letter in
                    Button(action: {
                        selectedLetter = letter
                    }) {
                        Text(letter)
                            .font(FontFactory.alphabetFont(for: geometry.size.height))
                            .frame(width: geometry.size.width, height: geometry.size.height / CGFloat(alphabet.count))
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(ScaleButtonStyle())
                    .sensoryFeedback(.impact, trigger: selectedLetter)
                }
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    CocktailListView(viewModel: CocktailListViewModel())
        .modelContainer(preview.container)
        
}
struct ScaleButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 2.5 : 1)
            .shadow(radius: 30)
        
    }
}

struct SearchBarForCocktailListView: View {
    
    @FocusState.Binding var isFocused: Bool
    @Bindable var viewModel: CocktailListViewModel
    
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
                        Image(systemName: "x.circle")
                            .tint(ColorScheme.interactionTint)
                            .bold()
                            .font(.system(size: 18))
                            .padding()
                            .frame(width: 60, height: 40)
                            .contentShape(Rectangle())
                    }
                }
            }
            .onChange(of: viewModel.searchText) { _, newValue in
                viewModel.updateSearch(newValue)
            }
            .onSubmit {
                viewModel.searchText = ""
            }
            .onTapGesture {
                isFocused = true
            }
            .onDisappear{
                viewModel.searchText = ""
                isFocused = false
                viewModel.updateAndCache()
            }
            .submitLabel(.done)
            .padding()
    }
}


struct CocktailRowView: View {
    
    let cocktail: Cocktail
    @Environment(\.modelContext) private var modelContext
    @Bindable var viewModel: CocktailListViewModel
    
    var body: some View {
        if cocktail.variation == nil  {
            if cocktail.collection == .custom {
                NavigationLinkWithoutIndicator {
                    HStack{
                        Text(cocktail.cocktailName)
                        Spacer()
                    }
                } destination: {
                    RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                        .navigationBarBackButtonHidden(true)
                }
            } else {
                NavigationLinkWithoutIndicator {
                    HStack{
                        Text(cocktail.cocktailName)
                        Spacer()
                    }
                } destination: {
                    RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                        .navigationBarBackButtonHidden(true)
                }
            }
        } else {
            if cocktail.titleCocktail == true {
                let variations = viewModel.selectedCocktailVariations(for: cocktail)
                DisclosureGroup {
                    ForEach(variations, id: \.cocktailName) { variationCocktail in
                        
                        if cocktail.collection == .custom {
                            NavigationLinkWithoutIndicator {
                                HStack{
                                    Text(cocktail.cocktailName)
                                    Spacer()
                                    Text("Custom")
                                        .foregroundStyle(Color.brandPrimaryGold)
                                        .font(.subheadline)
                                }
                            } destination: {
                                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                    .navigationBarBackButtonHidden(true)
                            }
                        } else {
                            NavigationLinkWithoutIndicator {
                                HStack{
                                    Text(cocktail.cocktailName)
                                    Spacer()
                                }
                            } destination: {
                                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                    .navigationBarBackButtonHidden(true)
                            }
                        }
                    }
                } label: {
                    if let variationName = cocktail.variation {
                        Text(variationName.rawValue)
                    } else {
                        Text(cocktail.cocktailName)
                    }
                }
                .disclosureGroupStyle(InlineDisclosureGroupStyle())
            }
        }
    }
}
