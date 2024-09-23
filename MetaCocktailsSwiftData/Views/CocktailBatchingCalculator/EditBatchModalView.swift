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
                HStack {
                    Spacer()
                    FontFactory.titleHeader22(title: "Batching Preferences")
                    
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 20))
                            .bold()
                            .tint(ColorScheme.interactionTint)
                    }
                }
                .padding(.bottom, 20)
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(BlackGlassBackgroundView())
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return EditBatchModalView()
        .environmentObject(CBCViewModel())
        .modelContainer(preview.container)
    
}
