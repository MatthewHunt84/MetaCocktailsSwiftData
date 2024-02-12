//
//  CBCMainView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI
import SwiftData


struct CBCMainView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Environment(\.modelContext) var modelContext
    @Bindable var savedBatchCocktail: BatchedCocktail
    @State var didSave: Bool = false
    @State var cocktailCount = 20.0
    
    
  
   
    
    
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
                                viewModel.clearPageData()
                                viewModel.editingSavedCocktail = false 
                            }
                            
                            ZStack{
                                
                                Button {
                                    
                                    modelContext.insert(BatchedCocktail(batchCocktailName: viewModel.cocktailNameText, dilutionPercentage: viewModel.dilutionPercentage, dilutionType: viewModel.dilutionName, notes: viewModel.notesText, batchCocktailIngredients: viewModel.ingredients))
                                    didSave.toggle()
                                    withAnimation(.easeInOut(duration: 5.0)) {
                                        didSave.toggle()
                                    }
                                    
                                    
                                    print("Saved")
                                } label: {
                                    HStack{
                                        Image(systemName: didSave ? "checkmark.circle.fill" : "circle")
                                            .scaleEffect(didSave ? 1.5 : 1.0)
                                            .foregroundStyle(didSave ? .brandPrimaryGreen : .white)
                                        Text("Save")
                                            .foregroundStyle(didSave ? .brandPrimaryGreen : .white)
                                    }
                                }
                                .disabled(viewModel.cocktailNameText == "" ? true : false)
                                
                                
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        
                        HStack {
                            TextField("Enter a cocktail name.", text: $viewModel.cocktailNameText).cBCTextField()
                                .autocorrectionDisabled()
                            
                            NavigationLink{
                                NotesView(newText: viewModel.notesText, batchCocktail: savedBatchCocktail)
                            } label: {
                                Image(systemName: "pencil.and.list.clipboard")
                            }
                            .buttonStyle(BlackNWhiteButton())
                            NavigationLink {
                                SavedBatchCocktailsView()
                            } label: {
                                Text("Batches")
                            }
                            .buttonStyle(BlackNWhiteButton())
                        }
                        
                        HStack {
                            NavigationLink {
                                CBCAddIngredientView(savedBatchCocktail: savedBatchCocktail)
                            }label: {
                                Text("✚ Ingredient")
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
                        ForEach(viewModel.ingredients, id: \.self) { ingredient in
                            CBCIngredientCell(ingredient: ingredient, amountInMls: viewModel.convertIngredientOzAmountIntoMls(for: ingredient.amount))
                        }
                        .onDelete(perform: viewModel.delete)
                        .onMove(perform: viewModel.moveIngredients)
                        if viewModel.dilutionName != "" {
                            DilutionCell()
                                .swipeActions{
                                    if viewModel.editingSavedCocktail {
                                        Button("Delete"){
                                            savedBatchCocktail.dilutionType = ""
                                            savedBatchCocktail.dilutionPercentage = 0.0
                                            viewModel.calculateABV()
                                        }
                                    } else {
                                        Button("Delete"){
                                            viewModel.dilutionName = ""
                                            viewModel.dilutionPercentage = 0.0
                                            viewModel.calculateABV()
                                        }
                                    }
                                    
                                }
                        }
                        
                        if viewModel.ingredients.count > 0 {
                            
                            if viewModel.isShowingSwipeTip {
                                Text("← Swipe to delete")
                                    .swipeActions {
                                        Button("Delete") {
                                            viewModel.isShowingSwipeTip.toggle()
                                        }
                                    }
                            }
                            
                        }
                        
                    }
//                    .background(content: {
//                        if viewModel.ingredients.count == 0 {
//                            Image("ingredientHintView")
//                                .resizable()
//                                .scaledToFit()
//                        }
//                    })
                    .listStyle(.plain)
                    .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(.gray.gradient, lineWidth: 2))
                    
                    VStack {
                        
                        
                        
                        Text("Your ABV is \(viewModel.totalCocktailABVPercentage, specifier: "%.2f")%")
                        
                        
                        
                        NavigationLink{
                            MainBatchView(quantifiedBatchedIngredients: $viewModel.quantifiedBatchedIngredients, cocktailCount: $cocktailCount)
                        } label: {
                            Text("Batch")
                        }
                        .buttonStyle(BlackNWhiteButton())
                    }
                }
                
            }
            .task {
                
                
                viewModel.ingredients = savedBatchCocktail.batchCocktailIngredients
                viewModel.cocktailNameText = savedBatchCocktail.batchCocktailName
                viewModel.notesText = savedBatchCocktail.notes
                viewModel.dilutionName = savedBatchCocktail.dilutionType
                viewModel.dilutionPercentage = savedBatchCocktail.dilutionPercentage
                viewModel.didUpdateDilution.toggle()
                viewModel.calculateABV()
                
                if viewModel.cocktailNameText != "" {
                    viewModel.editingSavedCocktail = true
                }
                
            }
            
        }
    }
    
}

#Preview {
    do{
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BatchedCocktail.self, configurations: config)
        
        @State var cocktail = BatchedCocktail(batchCocktailName: "Frenchies",
                                              dilutionPercentage: 10,
                                              dilutionType: "Milk", notes: "asadads",
                                              batchCocktailIngredients: [BatchIngredient(name: "Vodka", amount: 1, aBV: 57),
                                                                         BatchIngredient(name: "Maraschino", amount: 0.5, aBV: 3),
                                                                         BatchIngredient(name: "Orgeat", amount: 2, aBV: 6)])
        return CBCMainView(savedBatchCocktail: cocktail, didSave: false)
            .modelContainer(container)
            .environmentObject(CBCViewModel())
        
    } catch {
        return Text("Ooopsies")
    }
    
}

