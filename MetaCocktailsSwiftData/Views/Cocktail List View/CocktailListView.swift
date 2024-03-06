//
//  CocktailListView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import SwiftData
import UIKit

struct CocktailListView: View {
    
    @Bindable var viewModel = CocktailListViewModel()
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @Environment(\.modelContext) private var modelContext
    
    
    func selectedCocktailVariations(for cocktail: Cocktail) -> [Cocktail] {
        if let variation = cocktail.variation {
            let variationsWithSelectedCocktailFirst = cocktails.filter({$0.variation == variation}).sorted {
                $1.cocktailName == cocktail.cocktailName ? false :
                $0.cocktailName == cocktail.cocktailName ? true :
                $0.cocktailName < $1.cocktailName
            }
            return variationsWithSelectedCocktailFirst
        } else {
            return [cocktail]
        }
    }
    
    
    
    var body: some View {
        
        NavigationStack{
            VStack {
                HStack {
                    Text("Cocktails")
                        .font(.largeTitle).bold()
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                    Spacer()
                    Button {
                        modelContext.insert(TestCocktails.textCocktail1)
                        modelContext.insert(TestCocktails.textCocktail2)
                        modelContext.insert(TestCocktails.textCocktail3)
                        modelContext.insert(TestCocktails.textCocktail4)
                        modelContext.insert(TestCocktails.textCocktail5)
                        modelContext.insert(TestCocktails.textCocktail6)
                        modelContext.insert(TestCocktails.textCocktail7)
                        modelContext.insert(TestCocktails.textCocktail8)
                        modelContext.insert(TestCocktails.textCocktail9)
                        modelContext.insert(TestCocktails.textCocktail10)
                    } label: {
                        Text("Load Custom Cocktails")
                    }

                }
                
                
                GeometryReader { listGeo in
                    
                    ScrollView {
                        ScrollViewReader { value in
                            HStack {
                                List{
                                    if viewModel.isShowingWnGCocktailsOnly {
                                        ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
                                            Section{
                                                ForEach(viewModel.justWilliamsAndGrahamCocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.cocktailName) { item in
                                                    NavigationLink {
                                                        RecipeView(viewModel: RecipeViewModel(cocktail: item))
                                                        //.navigationBarBackButtonHidden(true)
                                                    } label: {
                                                        Text(item.cocktailName)
                                                        
                                                    }
                                                }
                                            } header: {
                                                Text("\(letter)")
                                                    .fontWeight(.bold)
                                                    .font(.title)
                                            }.id(letter)
                                        }
                                        
                                    } else {

                                        ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
                                            Section{
                                                if letter == CocktailListViewModel.sfSymbolForCustomCocktails {
                                                    ForEach(cocktails) { cocktail in
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
                                                        }
                                                    }
                                                    .onDelete { indexSet in
                                                        for index in indexSet {
                                                            modelContext.delete(cocktails[index])
                                                        }
                                                    }
                                                }
                                                ForEach(cocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.self) { cocktail in
                                                    
                                                    
                                                    if cocktail.variation == nil  {
                                                        
                                                        if cocktail.collection == .custom {
                                                            NavigationLinkWithoutIndicator {
                                                                HStack{
                                                                    Text(cocktail.cocktailName)
                                                                    Spacer()
                                                                    Text("Custom")
                                                                        .foregroundStyle(Color.brandPrimaryGold)
                                                                        .font(.subheadline)
                                                                }
                                                                .bold()
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
                                                                .bold()
                                                            } destination: {
                                                                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                                                    .navigationBarBackButtonHidden(true)
                                                            }
                                                        }
                                                    } else {
                                                        if cocktail.titleCocktail == true {
                                                            let variations = cocktails.filter({$0.variation == cocktail.variation})
                                                            DisclosureGroup {
                                                                ForEach(variations, id: \.cocktailName) { variationCocktail in
                                                                    
                                                                    NavigationLinkWithoutIndicator {
                                                                        HStack{
                                                                            Text(variationCocktail.cocktailName)
                                                                            Spacer()
                                                                        }
                                                                        .bold()
                                                                    } destination: {
                                                                        SwipeRecipeView(variations: selectedCocktailVariations(for: variationCocktail))
                                                                            .navigationBarBackButtonHidden(true)
                                                                    }
                                                                    
                                                                }
                                                            } label: {
                                                                Text(cocktail.cocktailName)
                                                            }
                                                            .disclosureGroupStyle(InlineDisclosureGroupStyle())
                                                        }
                                                    }
                                                }
                                               
                                            } header: {
                                                if letter == CocktailListViewModel.sfSymbolForCustomCocktails {
                                                    Text("Custom")
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                } else {
                                                    Text("\(letter)")
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                }
                                                
                                            }.id(letter)
                                        }
                                    }
                                }
                                .listStyle(.plain)
                                .frame(width: listGeo.size.width * 0.9, height: listGeo.size.height)
                                VStack {

                                    ForEach(0..<viewModel.cocktailListAlphabet.count, id: \.self) { i in
                                        Button(action: {
                                            withAnimation {
                                                value.scrollTo(viewModel.cocktailListAlphabet[i], anchor: .top)
                                            }
                                        }, label: {
                                            if i == 0 {
                                                Image(systemName: viewModel.cocktailListAlphabet[i] )
                                                    .resizable()
                                                    .frame(width: 15, height: 15, alignment: .center)
                                                    .tint(.white)
                                            } else {
                                                Text("\(viewModel.cocktailListAlphabet[i])")
                                                    .font(.headline).bold()
                                                    .frame(width: 17, height: 13, alignment: .center)
                                            }
                                            
                                        })
                                        .buttonStyle(ScaleButtonStyle())
                                    }
                                }
                                .frame(width: listGeo.size.width * 0.1, height: listGeo.size.height)
                                .scaledToFit()
                                .offset(x: -10, y: 5)
                            }
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return CocktailListView(viewModel: CocktailListViewModel())
        .modelContainer(preview.container)
        
}
struct ScaleButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 2.5 : 1)
            .shadow(radius: 30)
        
    }
}




