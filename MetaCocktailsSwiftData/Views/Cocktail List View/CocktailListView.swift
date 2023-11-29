//
//  CocktailListView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

struct CocktailListView: View {
    @EnvironmentObject var criteria: SearchCriteriaViewModel
    @StateObject var viewModel = CocktailListViewModel()
    @State var isShowingIngredientsList = false
    @State private var colorNumber = 0
    @Environment(\.modelContext) private var modelContext
    

    var body: some View {
        ZStack {
            
//            NavigationView {
                
                VStack{
                    HStack {
                        Text("Cocktails")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .fontDesign(.serif)
                            .padding()
                        Spacer()
                        Button(action: {
                            
                            //                            print("\(viewModel.cocktails[0].getTagSet())")
                            print(viewModel.cocktails[6].CompileTags())
                            
                            
                            isShowingIngredientsList = true} ) {
                                VStack{
                                    
                                    Text("Refine Search")
                                        .fontDesign(.serif)
                                }
                                .padding(10)
                                .background(Color(UIColor.systemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 140))
                                .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
                                .foregroundColor(Color(UIColor.systemCyan))
                            }
                            .padding(20)
                        
                            .sheet(isPresented: $isShowingIngredientsList) {
                                SearchCriteriaView(isShowingIngredientsList: $isShowingIngredientsList, isShowingPreferences: true, selectedLikesOrDislikes: .likes)
                            }
                        
                        
                    }
                    
                    List(viewModel.cocktails) { cocktail in
                        
                        CocktailListCell(cocktail: cocktail, backgroundColor: .red)
                            .onTapGesture {
                                viewModel.selectedCocktail = cocktail
                                viewModel.isShowingRecipeCard = true
                                print("tab was tapped")
                            }
                    }
                    
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingRecipeCard)
                    Button(action: {
                        for i in 0..<criteria.cocktailComponents.count {
                            criteria.cocktailComponents[i].isPreferred = false
                            criteria.cocktailComponents[i].isUnwanted = false
                        }
                    }) {
                        Text("Clear Search")
                            .fontDesign(.serif)
                    }
                    .padding(10)
                    .background(Color(UIColor.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 140))
                    .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
                    .foregroundColor(Color(UIColor.systemCyan))
                    
                }
//            }
                
            .blur(radius: viewModel.isShowingRecipeCard ? 20 : 0)
            VStack {
                
                
            }
            if viewModel.isShowingRecipeCard {
                RecipeCard(cocktail: viewModel.selectedCocktail!, isShowingRecipeCard: $viewModel.isShowingRecipeCard)
            }
        }
    }
}

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListView()
            .environmentObject(SearchCriteriaViewModel())
    }
}
