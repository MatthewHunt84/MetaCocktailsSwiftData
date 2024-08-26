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
    @State private var showingModal = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Text("Cocktails")
                            .font(.largeTitle).bold()
                            .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                        Button {
                            showingModal = true
                        } label: {
                            Image(systemName: "questionmark.circle.fill")
                                .tint(.blueTint)
                        }
                        Spacer()
                        LoadSampleCocktailsButton()
                    }
                    GeometryReader { listGeo in
                        ScrollView {
                            ScrollViewReader { value in
                                HStack {
                                    List {
                                        if searchBarIsFocused {
                                            SearchBarAllCocktailsListView(viewModel: viewModel, cocktails: viewModel.filteredCocktails)
                                        } else {
                                            AllCocktailsListView(viewModel: viewModel, cocktails: cocktails)
                                        }
                                    }
                                    .listStyle(.plain)
                                    .frame(width: listGeo.size.width * 0.9, height: listGeo.size.height)
                                    
                                    AlphabetNavigationView(value: value, alphabet: viewModel.cocktailListAlphabet)
                                        .frame(width: listGeo.size.width * 0.1, height: listGeo.size.height)
                                        .scaledToFit()
                                        .offset(x: searchBarIsFocused ? listGeo.size.width * 0.1 : -10, y: 5)
                                        .opacity(searchBarIsFocused ? 0 : 1)
                                        .animation(.easeInOut(duration: 0.8), value: searchBarIsFocused)
                                }
                            }
                        }
                    }
                    ListSearchBarView(text: $viewModel.searchText, isFocused: $searchBarIsFocused, viewModel: viewModel)
                        .padding()
                }
                .onAppear {
                    viewModel.setAllCocktails(cocktails)
                }
            }
        }
        .fullScreenCover(isPresented: $showingModal) {
            HistoricalCocktailModalView(
                isPresented: $showingModal,
                alertContent: HistoricalCocktailAlert.standard
            ) {
                print("Modal dismissed")
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
                    if i == 0 {
                        Image(systemName: alphabet[i])
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                            .tint(.white)
                    } else {
                        Text(alphabet[i])
                            .font(.headline).bold()
                            .frame(width: 17, height: 13, alignment: .center)
                    }
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
            TextField("Search cocktails", text: $text)
                .focused($isFocused)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(alignment: .trailing) {
                    if !text.isEmpty {
                        Button {
                            viewModel.searchText = ""
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .tint(.blueTint)
                        }
                        .padding(.horizontal, 10)
                    }
                }
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
        .padding(.horizontal)
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
