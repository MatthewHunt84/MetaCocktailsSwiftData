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
    @State var cocktail = aFlightSouthOfTheBorder
    
    
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
                    Text("Cocktail Specs")
                        .font(.largeTitle).bold()
                    
                    
                    VStack {
                        TextField("Enter a cocktail name.", text: $cocktail.cocktailName).cBCTextField()
                            .autocorrectionDisabled()
                        HStack{
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
                        ForEach($cocktail.spec, id: \.ingredient.name) { ingredient in
                            
                            LoadedCocktailIngredientCell(ingredient: ingredient.wrappedValue)
                            
                            
                        }
                        
                        
                        
                    }
                    .listStyle(.plain)
                    .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(.gray.gradient, lineWidth: 2))
                    
                    ScrollViewReader { value in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack() {
                                ForEach(viewModel.dilutionNumbersArray, id: \.self) { number in
                                    Text("\(number)")
                                        .frame(width: 40, height: 30)
                                        .background(viewModel.dilutionPercentage == Double(number) ? Color.black : Color.clear)
                                        .clipShape(Circle())
                                    //.clipShape(RoundedRectangle(cornerRadius: 20))
                                        .scaleEffect(viewModel.dilutionPercentage == Double(number) ? 1.5 : 1)
                                        .id(number)
                                        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: viewModel.dilutionPercentage)
                                        .shadow(color: viewModel.dilutionPercentage == Double(number) ? Color(UIColor.white) : Color.black, radius: 4, x: 0, y: 0)
                                    // .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray.gradient, lineWidth: 1))
                                        .onTapGesture {
                                            withAnimation {
                                                viewModel.dilutionPercentage = Double(number)
                                                value.scrollTo(number, anchor: .center)
                                            }
                                        }
                                        .padding(.vertical)
                                }
                            }
                            
                        }
                        .task {
                            value.scrollTo(viewModel.dilutionNumbersArray[24] , anchor: .center)
                                
                        }
                        
                    }
                    .frame(height: 50)
                    .padding(.horizontal)
                    HStack {
                        Spacer()
                        Text("\(NSNumber(value: viewModel.dilutionPercentage)) % Dilution")
                        Spacer()
                    }
                    
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
