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
    @State private var isSearchActive = false
    @State private var isReturningFromRecipe = false
    @FocusState private var isSearchFocused: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                ColorScheme.background.ignoresSafeArea()
                
                VStack {
                    GeometryReader { listGeo in
                        ScrollView {
                            ScrollViewReader { value in
                                HStack {
                                    List {
                                        if isSearchActive && !isReturningFromRecipe {
                                            SearchBarAllCocktailsListView(viewModel: viewModel, isReturningFromRecipe: $isReturningFromRecipe)
                                        } else {
                                            AllCocktailsListView(viewModel: viewModel, isReturningFromRecipe: $isReturningFromRecipe)
                                        }
                                    }
                                    .listStyle(.plain)
                                    .frame(width: listGeo.size.width * 0.9, height: listGeo.size.height)
                                    
                                    AlphabetNavigationView(value: value, alphabet: viewModel.cocktailListAlphabet)
                                        .frame(width: listGeo.size.width * 0.1, height: listGeo.size.height)
                                        .scaledToFit()
                                        .offset(x: isSearchActive ? listGeo.size.width * 0.1 : -10, y: 5)
                                        .opacity(isSearchActive ? 0 : 1)
                                        .animation(.easeInOut(duration: 0.8), value: isSearchActive)
                                }
                            }
                        }
                    }
                }
                .searchable(text: $viewModel.searchText, isPresented: $isSearchActive, prompt: "Search cocktails")
                .focused($isSearchFocused)
                .onSubmit(of: .search) {
                    viewModel.searchText = ""
                    isSearchFocused = false
                }
                .autocorrectionDisabled()
                .onChange(of: viewModel.searchText) { _, newValue in
                    viewModel.updateSearch(newValue)
                    isSearchActive = !newValue.isEmpty
                    isReturningFromRecipe = false
                }
                .onChange(of: isReturningFromRecipe) { _, newValue in
                    if newValue {
                        resetSearch()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Cocktail List")
        }
        .onAppear {
            viewModel.setAllCocktails(cocktails)
            if isReturningFromRecipe {
                resetSearch()
            }
        }
    }

    private func resetSearch() {
        isSearchActive = false
        isSearchFocused = false
        viewModel.searchText = ""
        isReturningFromRecipe = false
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

struct AlphabetNavigationView: View {
    let value: ScrollViewProxy
    let alphabet: [String]
    
    var body: some View {
        VStack {
            ForEach(0..<alphabet.count, id: \.self) { i in
                Button(action: {
                    withAnimation {
                        value.scrollTo(alphabet[i], anchor: .top)
                    }
                }, label: {
                    Text(alphabet[i])
                        .font(FontFactory.regularFont(size: 15))
                        .frame(width: 17, height: 13, alignment: .center)
                    
                })
                .buttonStyle(ScaleButtonStyle())
            }
        }
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
                        Image(systemName: "x.circle.fill")
                            .tint(ColorScheme.interactionTint)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .onChange(of: viewModel.searchText) { _, newValue in
                viewModel.updateSearch(newValue)
            }
            .onSubmit {
                viewModel.searchText = ""
            }
            .submitLabel(.done)
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
