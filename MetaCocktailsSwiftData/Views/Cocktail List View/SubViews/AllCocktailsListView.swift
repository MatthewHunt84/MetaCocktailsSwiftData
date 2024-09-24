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
                    ForEach(organizedCocktails.keys.sorted(), id: \.self) { key in
                        if let cocktails = organizedCocktails[key], !cocktails.isEmpty {
                            CocktailGroupView(key: key, cocktails: cocktails)
                                .zIndex(1)
                        }
                    }
                } header: {
                    SectionHeaderView(letter: letter, animatingLetter: $animatingLetter)
                        .zIndex(2)
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
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .systemThickMaterialDark))
                .clipShape(RoundedRectangle(cornerRadius: 4))
            
            headerSelectionGradient
                .clipShape(RoundedRectangle(cornerRadius: 4))
            
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
                isAnimating ? ColorScheme.tintColor.opacity(0.15) : .clear,
                .black
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

struct CocktailGroupView: View {
    let key: String
    let cocktails: [Cocktail]
    
    var body: some View {
        Group{
            if cocktails.count > 1 {
                DisclosureGroup {
                    ForEach(cocktails, id: \.id) { cocktail in
                        MultipleCocktailsListView(cocktail: cocktail, cocktails: cocktails)
                            .padding(.leading)
                    }
                } label: {
                    Text(key)
                        .font(FontFactory.regularFont(size: 18))
                }
                .disclosureGroupStyle(InlineDisclosureGroupStyle())
                
            } else {
                SingleCocktailListView(cocktail: cocktails[0])
            }
        }
        .frame(height: 35)
        .padding(.vertical, 2)
    }
    
}

struct SingleCocktailListView: View {
    let cocktail: Cocktail
    
    var body: some View {
        NavigationLink {
            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, 20)
                    .foregroundStyle(.white)
                Spacer()
                if cocktail.isCustomCocktail == true {
                    Text("Custom")
                        .foregroundStyle(Color.brandPrimaryGold)
                        .font(FontFactory.regularFont(size: 15))
                        
                }
            }
        }
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
                    .foregroundStyle(.white)
                Spacer()
                if cocktail.isCustomCocktail == true {
                    Text("Custom")
                        .foregroundStyle(Color.brandPrimaryGold)
                        .font(FontFactory.regularFont(size: 15))
                }
            }
        }
        .frame(height: 35)
        .padding(.vertical, 2)
    }
}

struct SearchBarAllCocktailsListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    var body: some View {
        ForEach(viewModel.filteredCocktails, id: \.self) { cocktail in
            SingleCocktailListView(cocktail: cocktail)
        }
        .listRowBackground(Color.clear)
    }
}
