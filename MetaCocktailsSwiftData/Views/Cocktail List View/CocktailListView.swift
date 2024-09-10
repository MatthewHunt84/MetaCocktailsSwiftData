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
    @State private var scrollProxy: ScrollViewProxy?

    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradients.meshBlueTwoRibbonBackground.ignoresSafeArea()
                MeshGradients.meshTealRibbonBackground.ignoresSafeArea()
                
                VStack {
                    ListSearchBarView(text: $viewModel.searchText, isFocused: $searchBarIsFocused, viewModel: viewModel)
                        .padding()
                    
                    GeometryReader { listGeo in
                        HStack(spacing: 0) {
                            ScrollViewReader { value in
                                ScrollView {
                                    LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                                        if searchBarIsFocused {
                                            SearchBarAllCocktailsListView(viewModel: viewModel)
                                        } else {
                                            AllCocktailsListView(viewModel: viewModel)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                .frame(width: listGeo.size.width * 0.9)
                                .onAppear {
                                    scrollProxy = value
                                }
                            }
                            
                            AlphabetNavigationView(scrollProxy: $scrollProxy, alphabet: viewModel.cocktailListAlphabet)
                                .frame(width: listGeo.size.width * 0.1)
                                .scaledToFit()
                                .offset(x: searchBarIsFocused ? listGeo.size.width * 0.1 : -10, y: 5)
                                .opacity(searchBarIsFocused ? 0 : 1)
                                .animation(.easeInOut(duration: 0.8), value: searchBarIsFocused)
                        }
                    }
                }
                .onAppear {
                    viewModel.searchText = ""
                    viewModel.setAllCocktails(cocktails)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Cocktail List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    LoadSampleCocktailsButton()
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

struct AlphabetNavigationView: View {
    @Binding var scrollProxy: ScrollViewProxy?
    let alphabet: [String]
    
    var body: some View {
        VStack {
            ForEach(alphabet, id: \.self) { letter in
                Button(action: {
                    withAnimation {
                        scrollProxy?.scrollTo(letter, anchor: .top)
                    }
                }, label: {
                    Text(letter)
                        .font(FontFactory.regularFont(size: 15))
                        .frame(width: 17, height: 13, alignment: .center)
                })
                .buttonStyle(ScaleButtonStyle())
            }
        }
    }
}

struct ListSearchBarView: View {
    
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    @Bindable var viewModel: CocktailListViewModel
    
    var body: some View {
        HStack {
            SearchBarForCocktailListView(isFocused: $isFocused, viewModel: viewModel)
            if isFocused {
                Button("Done") {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isFocused = false
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.blueTint)
                .foregroundColor(.black)
                .cornerRadius(8)
                
            }
        }
        .animation(.default, value: isFocused)
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
