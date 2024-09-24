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
    @State private var isExpanded: Bool = false
    
    var body: some View {
        if cocktails.count > 1 {
            VStack(spacing: 0) {
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundColor(ColorScheme.interactionTint)
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
                        SingleCocktailListView(cocktail: cocktail, isInGroupedList: true)
                            .transition(.opacity)
                            
                    }
                }
            }
        } else {
            SingleCocktailListView(cocktail: cocktails[0], isInGroupedList: false)
        }
    }
}

struct SingleCocktailListView: View {
    let cocktail: Cocktail
    @State var isInGroupedList: Bool?
    
    var body: some View {
        NavigationLink {
            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                    .padding(.leading, isInGroupedList ?? false ? 35 : 20)
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
