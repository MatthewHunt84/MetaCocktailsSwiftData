//
//  CBCLoadedCocktailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/12/24.
//

import SwiftUI

struct CBCLoadedCocktailView: View {
    @ObservedObject var viewModel = CBCViewModel()
    @State var cocktailCount = 100.0
    @State var cocktail = aFlightSouthOfTheBorder
    
    
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
                    Text("Cocktail Specs")
                        .font(.largeTitle).bold()
                    
                    
                    VStack {
                        TextField("Enter a cocktail name.", text: $viewModel.loadedCocktailData.cocktailName).cBCTextField()
                            .autocorrectionDisabled()
                        HStack{
                            Text("Cocktail Count:")
                            TextField("#", value:  $cocktailCount, formatter: viewModel.formatter).cBCTextField()
                                .onSubmit {
                                    viewModel.numberOfCocktailsText = cocktailCount
                                }
                                .autocorrectionDisabled()
                            
                                .frame(maxWidth: 75)
                            Spacer()
                            Text("Include:")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                            
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                    
                    List {
                        ForEach($viewModel.loadedCocktailData.ingredients, id: \.ingredient.ingredient.name) { ingredient in
                            
                            LoadedCocktailIngredientCell(ingredient: ingredient)
                            
                            
                        }
                        HStack {
                            Text("Batch Dilution")
                            Slider(value: $viewModel.dilutionPercentage, in: 0...100, step: 1.0)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            Text("\(viewModel.dilutionPercentage, specifier: "%.0f")%")
                                .frame(width: 50)
                        }
                        
                        
                    }
                    .listStyle(.plain)
                    .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(.gray.gradient, lineWidth: 2))
                    VStack {
                            NavigationLink{
                                MainBatchView(quantifiedBatchedIngredients: $viewModel.quantifiedBatchedIngredients, cocktailCount: $cocktailCount)
                                    .environmentObject(viewModel)
                            } label: {
                                Text("Batch")
                            }
                            .buttonStyle(BlackNWhiteButton())
                        }
                    
                    
                }
                
            }
            .task {
                viewModel.convertLoadedCocktail(for: cocktail)
            }
        }
    }
}

#Preview {
    let previewContainer = PreviewContainer([Cocktail.self])
    return CBCLoadedCocktailView(cocktail: aFlightSouthOfTheBorder)
        .environmentObject(CBCViewModel())
        .modelContainer(previewContainer.container)
}
