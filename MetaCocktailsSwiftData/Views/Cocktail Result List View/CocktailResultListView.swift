//
//  CocktailResultListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/4/24.

import SwiftUI

struct CocktailResultList: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel
    @Binding var isLoading: Bool

    var body: some View {
        
        VStack {
            
            if isLoading {
//                ZStack(alignment: .center) {
//                    Color.black
//                    Text("Couldn't load in time. My bad.")
//                }
                Image("Couldn’tLoad")
                    .resizable()
                    .scaledToFit()
                
            } else {
                if viewModel.preferredCount > 0 {
                    VStack{
                        List {
                            if viewModel.enableMultipleSpiritSelection == false {
                                ForEach(viewModel.sections, id: \.self.id) { result in
                                    Section(header: SearchedCocktailTitleHeader(searched: result.count, matched: result.matched)) {
                                        ForEach(result.cocktails, id: \.self.id) { cocktail in
                                            NavigationLink {
                                                if viewModel.menuMode {
                                                    CocktailMenuView(viewModel: CocktailMenuViewModel(cocktail: cocktail))
                                                } else {
                                                    RecipeIngredientsView(viewModel: CocktailMenuViewModel(cocktail: cocktail))
                                                }
                                                
                                            } label: {
                                                HStack {
                                                    Text(cocktail.cocktailName)
                                                }
                                            }
                                            
                                            
                                        }
                                    }
                                }
                            } else {
                                ForEach(viewModel.sections, id: \.self.id) { result in
                                    Section(header: SearchedCocktailTitleHeaderForMultipleSpirits(searched: result.count, matched: result.matched, baseSpirit: result.baseSpirit)) {
                                        ForEach(result.cocktails, id: \.self.id) { cocktail in
                                            NavigationLink {
                                                if viewModel.menuMode {
                                                    CocktailMenuView(viewModel: CocktailMenuViewModel(cocktail: cocktail))
                                                } else {
                                                    RecipeIngredientsView(viewModel: CocktailMenuViewModel(cocktail: cocktail))
                                                }
                                            } label: {
                                                HStack {
                                                    Text(cocktail.cocktailName)
                                                        
                                                }
                                            }
                                            
                                        }
                                        
                                    }
                                }
                                //.font(.footnote).bold()
//                                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
//                                .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.brandPrimaryGreen)
//                                .clipShape(RoundedRectangle(cornerRadius: 140))
//                                .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
//                                .foregroundColor(.white)
                            }
                            
                        }
                        .listStyle(.grouped)
                        .backgroundStyle(Color(.black))
                        if viewModel.multipleBaseSpiritsSelected {
                            ResultsConfigurationMenu(viewModel: viewModel)
                        }
                        
                    }
                } else  {
                    ZStack(alignment: .center) {
                        Color.black
                        
                        VStack {
                            Text("Add more preferences to continue")
                                .font(.title).bold()
                            .multilineTextAlignment(.center)
                            Image("Urkel")
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    CocktailResultList(viewModel: SearchCriteriaViewModel(), isLoading: .constant(false))
        .environmentObject(SearchCriteriaViewModel())
}
