//
//  CocktailListView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import SwiftData

struct CocktailListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
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
                                            SearchBarAllCocktailsListView()
                                        } else {
                                            AllCocktailsListView(animatingLetter: $selectedNavigationLetter)
                                        }
                                    }
                                    .frame(width: listGeo.size.width * 0.90)
                                    .onChange(of: selectedNavigationLetter) { oldValue, newValue in
                                        if let newValue = newValue {
                                            withAnimation(.easeOut(duration: 0.2)) {
                                                proxy.scrollTo(newValue, anchor: .top)
                                            }
                                            
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
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Cocktail List")
        }
    }
}

struct AlphabetNavigationView: View {
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

struct ScaleButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 2.5 : 1)
    }
}

struct SearchBarForCocktailListView: View {
    
    @FocusState.Binding var isFocused: Bool
    @Bindable var viewModel: CocktailListViewModel
    
    var body: some View {
        HStack {
            
            TextField("Search cocktails", text: $viewModel.searchText)
                .SearchBarTextField()
                .focused($isFocused)
                .sensoryFeedback(.impact(weight: .heavy), trigger: isFocused == true)
                .animation(.easeInOut(duration: 0.2), value: isFocused)
                .clearSearchButton(text: $viewModel.searchText) {
                    viewModel.searchText = ""
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
            
            NavigationStack {
                
                NavigationLink {
                    ResourcesView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    
                    FirstLoadAnimation(frame: 46,
                                       duration: 12,
                                       internalColor: ColorScheme.searchBarBackground,
                                       externalColor: LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange],
                                                                     startPoint: .topLeading,
                                                                     endPoint: .bottomTrailing),
                                       reverse: false)
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    CocktailListView()
        .modelContainer(preview.container)
    
}
