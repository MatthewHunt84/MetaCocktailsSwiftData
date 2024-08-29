//
//  CustomCocktailsListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/28/24.
//

import SwiftUI
import SwiftData

struct CustomCocktailsListView: View {
    @EnvironmentObject var viewModel: CustomCocktailsListViewModel
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<Cocktail> { cocktail in
        cocktail.isCustomCocktail == true
    }, sort: \Cocktail.cocktailName) private var customCocktails: [Cocktail]

    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradients.meshBlueTwoRibbonBackground.ignoresSafeArea()
                MeshGradients.meshTealRibbonBackground.ignoresSafeArea()
                
                List {
//                    ForEach(viewModel.groupedCocktails(), id: \.id) { group in
//                        if group.cocktails.count > 1 {
//                            DisclosureGroup {
//                                ForEach(group.cocktails.sorted(by: { $0.cocktailName < $1.cocktailName })) { cocktail in
//                                    CustomCocktailRowView(cocktail: cocktail, modelContext: modelContext)
//                                }
//                            } label: {
//                                Text(group.name)
//                                    .font(FontFactory.regularFont(size: 18))
//                            }
//                            .disclosureGroupStyle(InlineDisclosureGroupStyle())
//                        } else {
//                            CustomCocktailRowView(cocktail: group.cocktails[0], modelContext: modelContext)
//                        }
//                    }
//                    .listRowBackground(Color.clear)
                    ForEach(customCocktails, id: \.cocktailName) { cocktail in
                        
                        CustomCocktailRowView(cocktail: cocktail, modelContext: modelContext)
                        
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Custom Cocktails")
        }
        .onAppear {
            viewModel.updateCocktails(customCocktails)
        }
        .onChange(of: customCocktails) { _, newValue in
            viewModel.updateCocktails(newValue)
        }
    }
}

struct CustomCocktailRowView: View {
    let cocktail: Cocktail
    let modelContext: ModelContext

    var body: some View {
        NavigationLinkWithoutIndicator {
            HStack {
                Text(cocktail.cocktailName)
                    .font(FontFactory.regularFont(size: 18))
                Spacer()
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

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return CustomCocktailsListView()
        .modelContainer(preview.container)
}
