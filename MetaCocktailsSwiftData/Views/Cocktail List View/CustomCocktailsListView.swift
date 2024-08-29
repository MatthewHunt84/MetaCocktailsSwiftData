//
//  CustomCocktailsListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/28/24.
//

import SwiftUI
import SwiftData


struct CustomCocktailsListView: View {
    @EnvironmentObject var viewModel: CocktailListViewModel
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<Cocktail> { cocktail in
        cocktail.isCustomCocktail == true
    }) private var customCocktails: [Cocktail]
    
   
    
    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradients.meshBlueTwoRibbonBackground.ignoresSafeArea()
                MeshGradients.meshTealRibbonBackground.ignoresSafeArea()
                
                List {
                    ForEach(customCocktails, id: \.cocktailName) { cocktail in
                        CocktailListItemView(viewModel: viewModel, cocktail: cocktail, isInCustomSection: true)
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            modelContext.delete(customCocktails[index])
                        }
                        do {
                            try modelContext.save()
                        } catch {
                            print("Oh oh! Couldn't save: \(error)")
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Custom Cocktails")
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    CustomCocktailsListView()
        .modelContainer(preview.container)
        .environmentObject(CocktailListViewModel())
}

struct CustomCocktailRowView: View {
    let cocktail: Cocktail
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationLinkWithoutIndicator {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(cocktail.cocktailName)
                        .font(FontFactory.regularFont(size: 18))
                    Spacer()
                }
                
            }
        } destination: {
            RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                .navigationBarBackButtonHidden(true)
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                modelContext.delete(cocktail)
                do {
                    try modelContext.save()
                } catch {
                    print("Error deleting cocktail: \(error)")
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}
