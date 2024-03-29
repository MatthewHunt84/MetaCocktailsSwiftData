//
//  CocktailResultListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/4/24.

import SwiftUI
import SwiftData

struct CocktailResultList: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel
    @Binding var isLoading: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if isLoading {
                    Image("Couldn’tLoad")
                        .resizable()
                        .scaledToFit()
                    
                } else {
                    if viewModel.preferredCount > 0 {
                        VStack{
                            List {
                                if viewModel.enableResultsForMultipleBaseSpirits == false {
                                    ForEach(viewModel.sections, id: \.self.id) { result in
                                        Section(header: SearchedCocktailTitleHeader(searched: result.count, matched: result.matched)) {
                                            ForEach(result.cocktails, id: \.self.id) { cocktail in
                                                NavigationLink {
                                                    
                                                    RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                                        .navigationBarBackButtonHidden(true)
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
                                                    
                                                    RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                                        .navigationBarBackButtonHidden(true)
                                                    
                                                } label: {
                                                    HStack {
                                                        Text(cocktail.cocktailName)
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                            }
                            .listStyle(.plain)
                            .backgroundStyle(Color(.black))
//                            if viewModel.multipleBaseSpiritsSelectedToEnableMenu {
//                                ResultsConfigurationMenu(viewModel: viewModel)
//                            }
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
}

#Preview {
    CocktailResultList(viewModel: SearchCriteriaViewModel(), isLoading: .constant(false))
        .environmentObject(SearchCriteriaViewModel())
}


