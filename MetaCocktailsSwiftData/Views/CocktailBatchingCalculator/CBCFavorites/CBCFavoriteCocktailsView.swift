//
//  CBCFavoriteCocktailsView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//

import SwiftUI
import SwiftData

struct CBCFavoriteCocktailsView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Environment(\.modelContext) var modelContext
    @Query var favoriteCocktails: [BatchedCocktail]
  
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(favoriteCocktails) { favorite in
                        NavigationLink(value: favorite) {
                            Text(favorite.batchCocktailName)
                        }
                        .onTapGesture {
                            viewModel.notesText = favorite.notes
                        }
                    }
                    .onDelete(perform: deleteSavedBatch)
                    
                    
                    if favoriteCocktails.count > 0 {
                        Text("← Swipe to delete")
                            .backgroundStyle(.red)
                    }
                    
                }
                .navigationDestination(for: BatchedCocktail.self, destination: { batchedCocktail in
                    CBCMainView(batchCocktail: batchedCocktail)
                     })
                
                .listStyle(.plain)
                .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .stroke(.gray.gradient, lineWidth: 2))
                
                .toolbar {
                    Button("Add Samples", action: addSamples)
                }
            }
            .navigationTitle("Saved Batches")
            
        }
        
    }
    func addSamples() {
        let a = BatchedCocktail(batchCocktailName: "Sour",
                                dilutionPercentage: "5",
                                dilutionType: "Marinara", notes: "Shut Up!",
                                batchCocktailIngredients: [BatchIngredient(name: "Balls", amount: "2", aBV: "12"),
                                                           BatchIngredient(name: "Crabs", amount: "4", aBV: "37"),
                                                           BatchIngredient(name: "Sluts", amount: "2", aBV: "45")])
        let b = BatchedCocktail(batchCocktailName: "Fizz",
                                dilutionPercentage: "25",
                                dilutionType: "Milk", notes: "Peekaboo.",
                                batchCocktailIngredients: [BatchIngredient(name: "Floppers", amount: "1", aBV: "12"),
                                                           BatchIngredient(name: "Slappers", amount: "23", aBV: "37"),
                                                           BatchIngredient(name: "Dangles", amount: "4", aBV: "45")])
        let c = BatchedCocktail(batchCocktailName: "Old Fashioned",
                                dilutionPercentage: "10",
                                dilutionType: "Water", notes: "Oh, Hello",
                                batchCocktailIngredients: [BatchIngredient(name: "Sea-Women", amount: "2", aBV: "12"),
                                                           BatchIngredient(name: "Rocks", amount: "4.8", aBV: "37"),
                                                           BatchIngredient(name: "Tuna", amount: "2.4", aBV: "45")])
        let d = BatchedCocktail(batchCocktailName: "Glass O' Milk",
                                dilutionPercentage: "30",
                                dilutionType: "Tea", notes: "Help, I'm trapped in a computer!",
                                batchCocktailIngredients: [BatchIngredient(name: "Vodka", amount: "1.2", aBV: "12"),
                                                           BatchIngredient(name: "Oil", amount: "1", aBV: "37"),
                                                           BatchIngredient(name: "Complements", amount: "2", aBV: "45")])
        
        modelContext.insert(a)
        modelContext.insert(b)
        modelContext.insert(c)
        modelContext.insert(d)
    }
    func deleteSavedBatch(_ indexSet: IndexSet) {
        for item in indexSet {
            let object = favoriteCocktails[item]
            modelContext.delete(object)
        }
    }
}

#Preview {
    CBCFavoriteCocktailsView()
        .environmentObject(CBCViewModel())
}
