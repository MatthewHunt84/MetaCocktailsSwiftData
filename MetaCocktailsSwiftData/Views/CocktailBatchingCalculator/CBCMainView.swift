//
//  CBCMainView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI

struct CBCMainView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @State private var addIngredientShowing = false
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
                    
                    VStack {
                        HStack {
                            Text("Cocktail Specs")
                                .font(.largeTitle).bold()
                            
                            
                            Spacer()
                            Button("Clear") {
                                viewModel.ingredients = []
                                viewModel.notesText = ""
                                viewModel.cocktailNameText = ""
                                viewModel.numberOfCocktailsText = ""
                                
                            }
                            Button("Save") {
                                
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        
                        
                        HStack {
                            TextField("Enter a cocktail name.", text: $viewModel.cocktailNameText).cBCTextField()
                            
                            NavigationLink("Notes") {
                                NotesView()
                            }
                            .buttonStyle(BlackNWhiteButton())
                            
                            
                            
                        }
                        
                        HStack {
                           NavigationLink {
                               CBCAddIngredientView()
                           }label: {
                               Text("✚ Ingredient")
                           }
                           .buttonStyle(BlackNWhiteButton())
                            
                            
                            Spacer()
                            Text("Cocktail Count:")
                            TextField("#", text: $viewModel.numberOfCocktailsText).cBCTextField()
                                .frame(maxWidth: 75)
                                .keyboardType(.decimalPad)
                            
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                    
                    List {
                        ForEach($viewModel.ingredients, id: \.self) { ingredient in
                            CBCIngredientCell(ingredient: ingredient)
                                
                        }
                        .onDelete(perform: viewModel.delete)
                        .onMove(perform: viewModel.moveIngredients)
                        if viewModel.ingredients.count > 0 {
                            Text("← Swipe to delete")
                        }
                        
                            
                    }

                    .background(content: {
                        if viewModel.ingredients.count == 0 {
                            Image("ingredientHintView")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        
                    })
                    .listStyle(.plain)
                    .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(.gray.gradient, lineWidth: 2))
                    
                    
                    
                    VStack {
                        Text("Your ABV is \(viewModel.abvPercentage)%")
                        
                        Button("Batch"){
                            for ingredients in viewModel.ingredients {
                                print("\(ingredients.name) has the amount of \(ingredients.amount) and the abv of \(ingredients.aBV)")
                            }
                        }
                        .buttonStyle(BlackNWhiteButton())
                    }
                    
                }
                
            }
        }
        
    }
}

#Preview {
    CBCMainView()
        .environmentObject(CBCViewModel())
}

struct CBCIngredient: Equatable, Hashable {
    static func == (lhs: CBCIngredient, rhs: CBCIngredient) -> Bool {
        return lhs.name == rhs.name
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    var name: String
    var amount: String
    var aBV: String
    
}
