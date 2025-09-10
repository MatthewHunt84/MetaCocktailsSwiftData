//
//  AllCocktailsListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI
import SwiftData

struct AllCocktailsListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    @Environment(\.modelContext) private var modelContext
    @Binding var animatingLetter: String?
    
    var body: some View {
        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
            ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
                Section {
                    let organizedCocktails = viewModel.getOrganizedCocktails(for: letter)
                    VStack {
                        ForEach(organizedCocktails.keys.sorted(), id: \.self) { key in
                            if let cocktails = organizedCocktails[key], !cocktails.isEmpty {
                                CocktailGroupView(key: key, cocktails: cocktails)
                            }
                        }
                        
                    }
                } header: {
                    SectionHeaderView(letter: letter, animatingLetter: $animatingLetter)
                }
                .id(letter)
            }
        }
    }
}

struct SectionHeaderView: View {
    let letter: String
    @Binding var animatingLetter: String?
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        if #available(iOS 26.0, *) {

                HStack {
                    Text(letter)
                        .font(FontFactory.listLetter(size: 28))
                        .foregroundColor(isAnimating ? ColorScheme.tintColor : .secondary)
                        .padding(.leading, 18)
                    Spacer()
                }
                .padding(.vertical, 4)
                .glassEffect(.regular)
            
            .padding(.top, letter.contains("#") ? 40 : 0)
            .task(id: animatingLetter) {
                if letter == animatingLetter {
                    isAnimating = true
                    try? await Task.sleep(for: .milliseconds(100))
                    withAnimation(.easeOut(duration: 1)) {
                        isAnimating = false
                    }
                    animatingLetter = nil
                }
            }
            
        } else {
            
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
                HStack {
                    Text(letter)
                        .font(FontFactory.listLetter(size: 28))
                        .foregroundColor(isAnimating ? ColorScheme.tintColor : .secondary)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .padding(.top, letter.contains("#") ? 40 : 0)
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

struct CocktailGroupView: View {
    let key: String
    let cocktails: [Cocktail]
    @State private var isExpanded: Bool = false
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    var body: some View {
        if cocktails.count > 1 {
            VStack(spacing: 0) {
                Button(action: {
                    // Tried to dial this in so it's bouncy but doesn't overshoot / oscillate an annoying amount
                     withAnimation(.interpolatingSpring(stiffness: 240, damping: 23)) {
                         isExpanded.toggle()
                     }
                }) {
                    HStack {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundColor(ColorScheme.interactionTint)
                            .rotationEffect(.degrees(isExpanded ? 90 : 0))
                        
                        Text(key)
                            .font(FontFactory.regularFont(size: 18))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .frame(height: 35)
                    .padding(.vertical, 2)
                }
                if isExpanded {
                    ForEach(cocktails, id: \.id) { cocktail in
                        MultipleCocktailsListView(cocktail: cocktail, cocktails: cocktails)
                            .transition(.asymmetric(
                                // The content will insert and remove from the top with the appropriate fade depending on direction
                                insertion: .move(edge: .top).combined(with: .opacity.animation(.easeIn)),
                                removal: .move(edge: .top).combined(with: .opacity.animation(.easeOut.speed(2)))
                            ))
                    }
                }
            }
        } else {
            SingleCocktailListView(cocktail: cocktails[0])
        }
    }
}


struct SingleCocktailListView: View {
    let cocktail: Cocktail
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    var body: some View {
        NavigationLink {
            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        } label: {
            HStack {
                Text(cocktail.cocktailName)
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

struct MultipleCocktailsListView: View {
    let cocktail: Cocktail
    let cocktails: [Cocktail]
    
    var body: some View {
       
        NavigationLink {
            SwipeRecipeView(variations: cocktails, initialSelection: cocktail)
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, 35)
                    .foregroundStyle(.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 35)
        .padding(.vertical, 2)
    }
}

struct SearchBarAllCocktailsListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.searchResultsCocktails, id: \.self) { cocktail in
                SingleCocktailListView(cocktail: cocktail)
            }
            .listRowBackground(Color.clear)
        }
    }
}

