//
//  CBCFavoriteCocktailsView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//
//
//import SwiftUI
//import SwiftData
//
//struct SavedBatchCocktailsView: View {
//    @EnvironmentObject var viewModel: CBCViewModel
//    @Environment(\.modelContext) var modelContext
//    @Query var savedBatchCocktails: [BatchedCocktail]
//
//   
//    
//    
//    var body: some View {
//        NavigationStack{
//            VStack{
//                List {
//                    ForEach(savedBatchCocktails) { batch in
//                        NavigationLink {
//                            CBCMainView(savedBatchCocktail: batch)
//                        } label: {
//                            Text(batch.batchCocktailName)
//                        }
//                        
//                        
//                    }
//                    .onDelete(perform: deleteSavedBatch)
//                    if savedBatchCocktails.count > 0 {
//                        Text("← Swipe to delete")
//                            .backgroundStyle(.red)
//                    }
//                }
//                .listStyle(.plain)
//                .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
//                    .stroke(.gray.gradient, lineWidth: 2))
//                
//                
//                
//                .toolbar {
//                    Button("Add Samples", action: addSamples)
//                }
//            }
//            .navigationTitle("Saved Batches")
//            
//        }
//        
//    }
//    func addSamples() {
//        let a = BatchedCocktail(batchCocktailName: "Sour",
//                                dilutionPercentage: 5,
//                                dilutionType: "Marinara", notes: "Shut Up!",
//                                batchCocktailIngredients: [BatchIngredient(name: "Balls", amount: 2, aBV: 12),
//                                                           BatchIngredient(name: "Crabs", amount: 3, aBV: 46),
//                                                           BatchIngredient(name: "Sluts", amount: 4, aBV: 56)])
//        let b = BatchedCocktail(batchCocktailName: "Fizz",
//                                dilutionPercentage: 25,
//                                dilutionType: "Milk", notes: "Peekaboo.",
//                                batchCocktailIngredients: [BatchIngredient(name: "Floppers", amount: 1, aBV: 12),
//                                                           BatchIngredient(name: "Slappers", amount: 4, aBV: 37),
//                                                           BatchIngredient(name: "Dangles", amount: 2, aBV: 45)])
//        let c = BatchedCocktail(batchCocktailName: "Old Fashioned",
//                                dilutionPercentage: 10,
//                                dilutionType: "Water", notes: "Oh, Hello",
//                                batchCocktailIngredients: [BatchIngredient(name: "Sea-Women", amount: 2, aBV: 12),
//                                                           BatchIngredient(name: "Rocks", amount: 4.8, aBV: 37),
//                                                           BatchIngredient(name: "Tuna", amount: 2.5, aBV: 45)])
//        let d = BatchedCocktail(batchCocktailName: "Glass O' Milk",
//                                dilutionPercentage: 30,
//                                dilutionType: "Tea", notes: "Help, I'm trapped in a computer!",
//                                batchCocktailIngredients: [BatchIngredient(name: "Vodka", amount: 1.5, aBV: 12),
//                                                           BatchIngredient(name: "Oil", amount: 1, aBV: 37),
//                                                           BatchIngredient(name: "Complements", amount: 0.75, aBV: 45)])
//        
//        modelContext.insert(a)
//        modelContext.insert(b)
//        modelContext.insert(c)
//        modelContext.insert(d)
//    }
//    func deleteSavedBatch(_ indexSet: IndexSet) {
//        for item in indexSet {
//            let object = savedBatchCocktails[item]
//            modelContext.delete(object)
//        }
//    }
//}
//
//#Preview {
//    SavedBatchCocktailsView()
//        .environmentObject(CBCViewModel())
//}
