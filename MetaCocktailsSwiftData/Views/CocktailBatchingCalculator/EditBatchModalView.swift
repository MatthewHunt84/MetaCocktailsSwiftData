//
//  EditBatchModalView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 6/3/24.
//

import SwiftUI

struct EditBatchModalView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
            VStack {
                ModalHeader(title: "Batching Preferences")
                Section(header: FontFactory.mediumText("Included Ingredients", size: 20)) {
                    ForEach($viewModel.loadedCocktailData.ingredients, id: \.ingredient.ingredientBase.name) { ingredient in
                        LoadedCocktailIngredientCell(ingredient: ingredient)
                    }
                }
                .padding(.horizontal)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                Spacer()
            }
            .padding()
            .background(BlackGlassBackgroundView())
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return EditBatchModalView()
        .environmentObject(CBCViewModel())
        .modelContainer(preview.container)
    
}
