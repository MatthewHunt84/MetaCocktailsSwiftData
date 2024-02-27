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
    @EnvironmentObject var criteria: SearchCriteriaViewModel
    @ObservedObject var viewModel = CocktailListViewModel()
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
//    func selectedCocktailVariations(for cocktail: Cocktail) -> [Cocktail] {
//        //viewModel.changePlaceholder(for: cocktail)
//        if let variation = cocktail.variation {
//            let variationsWithSelectedCocktailFirst = cocktails.filter({$0.variation == variation})
//            return variationsWithSelectedCocktailFirst
//        } else {
//            return [cocktail]
//        }
//    }
//    func convertCocktailsIntoCocktailListCocktails(cocktails: [Cocktail]) -> [CocktailListCocktail] {
//        var cocktailListCocktails: [CocktailListCocktail] = []
//        var currentVariation = ""
//        for cocktail in self.cocktails {
//            
//            if cocktail.variation != nil {
//                
//                
//                currentVariation = cocktail.variation!.rawValue
//                
//                
//            } else {
//                cocktailListCocktails.append(CocktailListCocktail(cocktailName: cocktail.cocktailName, cocktailVariations: [cocktail]))
//            }
//        }
//        
//        
//        return cocktailListCocktails
//    }
    
    
    var body: some View {
        
        NavigationStack{
            VStack {
                HStack {
                    Text("Cocktails")
                        .font(.largeTitle).bold()
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                    Spacer()
//                    Button {
//                      
//                    } label: {
//                        Image(systemName: isExpanded ? "line.3.horizontal.decrease" : "arrow.up.to.line")
//                    }
                }
                
                
                GeometryReader { listGeo in
                    
                    ScrollView {
                        ScrollViewReader { value in
                            HStack {
                                List{
                                    ForEach(criteria.alphabet, id: \.self) { letter in
                                        Section{
                                            ForEach(viewModel.bartenderViewCocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.self) { cocktail in
                                                if cocktail.cocktailVariations.count == 1   {
                                                    NavigationLinkWithoutIndicator {
                                                        HStack{
                                                            Text(cocktail.cocktailName)
                                                            Spacer()
                                                        }
                                                    } destination: {
                                                        RecipeView(viewModel: CocktailMenuViewModel(cocktail: cocktail.cocktailVariations[0]))
                                                            .navigationBarBackButtonHidden(true)
                                                    }
                                                    
                                                    
                                                } else {
                                                    DisclosureGroup {
                                                        ForEach(cocktail.cocktailVariations, id: \.cocktailName) { variationCocktail in
                                                            NavigationLinkWithoutIndicator {
                                                                HStack{
                                                                    Text(variationCocktail.cocktailName)
                                                                    Spacer()
                                                                }
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
                                                } header: {
                                                    Text("\(letter)")
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                }.id(letter)
                                            }
                                        }
                                }

                                .listStyle(.plain)
                                .frame(width: listGeo.size.width * 0.9, height: listGeo.size.height)
                                VStack {
                                    ForEach(0..<criteria.alphabet.count, id: \.self) { i in
                                        Button(action: {
                                            withAnimation {
                                                value.scrollTo(criteria.alphabet[i], anchor: .top)
                                            }
                                        }, label: {
                                            Text("\(criteria.alphabet[i])")
                                                .font(.headline).bold()
                                        })
                                        .buttonStyle(ScaleButtonStyle())
                                    }
                                }
                                .frame(width: listGeo.size.width * 0.1, height: listGeo.size.height)
                                .offset(x: -4, y: 5)
                            }
                        }
                    }
                }
            }
            
        }
    
}

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListView(viewModel: CocktailListViewModel())
            .environmentObject(SearchCriteriaViewModel())
    }
}
struct ScaleButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 2.5 : 1)
            .shadow(radius: 30)
        
    }
}





