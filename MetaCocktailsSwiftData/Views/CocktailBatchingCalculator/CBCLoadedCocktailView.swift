//
//  CBCLoadedCocktailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/12/24.
//

import SwiftUI

struct CBCLoadedCocktailView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @State var cocktailCount = 100.0
    @State var cocktail: Cocktail
  
    
  
   
    
    
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
               
                   
                            Text("Cocktail Specs")
                                .font(.largeTitle).bold()
                           
                        
                        VStack {
                            TextField("Enter a cocktail name.", text: $viewModel.cocktail.cocktailName).cBCTextField()
                                .autocorrectionDisabled()
                            HStack {
                                NavigationLink {
                                    AddDilutionView()
                                }label: {
                                    Text("Add Dilution")
                                }
                                .buttonStyle(BlackNWhiteButton())
                                
                                
                                Spacer()
                                Text("Cocktail Count:")
                                TextField("#", value:  $cocktailCount, formatter: viewModel.formatter).cBCTextField()
                                    .onSubmit {
                                        viewModel.numberOfCocktailsText = cocktailCount
                                    }
                                    .autocorrectionDisabled()
                                
                                    .frame(maxWidth: 75)
                                
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                        
                        List {
                            ForEach($viewModel.cocktail.spec, id: \.ingredient.name) { ingredient in
                               
                                    LoadedCocktailIngredientCell(ingredient: ingredient.wrappedValue)
                                
                                
                            }
                            if viewModel.dilutionName != "" {
                                DilutionCell()
                            }
                        }
                        .listStyle(.plain)
                        .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(.gray.gradient, lineWidth: 2))
                        
                        VStack {
                            
                            
                            
//                            Text("Your ABV is \(viewModel.totalCocktailABVPercentage, specifier: "%.2f")%")
                            
                            
                            
                            NavigationLink{
                                MainBatchView(quantifiedBatchedIngredients: $viewModel.quantifiedBatchedIngredients, cocktailCount: $cocktailCount)
                            } label: {
                                Text("Batch")
                            }
                            .buttonStyle(BlackNWhiteButton())
                        }
                    
                    
                }
                .task {
                    //viewModel.calculateABV()
                    viewModel.cocktail = cocktail
                }
                
            }
        }
    }
    
}

//#Preview {
//    @Binding var navPath: NavigationPath
//    CBCLoadedCocktailView(cocktail: aFlightSouthOfTheBorder, navPath: .constant($navPath))
//        .environmentObject(CBCViewModel())
//}
