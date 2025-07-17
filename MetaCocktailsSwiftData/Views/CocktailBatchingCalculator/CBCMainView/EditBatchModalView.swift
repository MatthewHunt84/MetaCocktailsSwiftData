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
    @Binding var isShowingOunceMeasurements: Bool
    @Binding var isShowingBottleMathAmounts: Bool
    
    var body: some View {
            VStack {
                ModalHeader(title: "Batching Preferences")
                Section(header: FontFactory.mediumText("Included Ingredients", size: 20)) {
                    ForEach($viewModel.loadedCocktailData.ingredients, id: \.ingredient.ingredientBase.name) { ingredient in
                        LoadedCocktailIngredientCell(ingredient: ingredient)
                    }
                    ForEach($viewModel.loadedDryIngredients.ingredients, id: \.ingredient.ingredientBase.name) { ingredient in
                        LoadedCocktailIngredientCell(ingredient: ingredient)
                    }
                }
                .padding(.horizontal)
                Section(header: FontFactory.mediumText("Measurement Volume Options", size: 20)) {
                    HStack {
                        Text("Show ounce amounts")
                            .font(FontFactory.formLabel18)
                        Spacer()
                        Toggle(isOn: $isShowingOunceMeasurements) { }
                            .tint(ColorScheme.interactionTint)
                            .frame(maxWidth: 60)
                    }
                    HStack {
                        Text("Show bottle math amounts")
                            .font(FontFactory.formLabel18)
                        Spacer()
                        Toggle(isOn: $isShowingBottleMathAmounts) { }
                            .tint(ColorScheme.interactionTint)
                            .frame(maxWidth: 60)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
                Spacer()
            }
            .padding()
            .background(BlackGlassBackgroundView())
    }
}

//#Preview {
//
//    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
//    return EditBatchModalView(isShowingOunceMeasurements: Binding<variable>)
//        .environmentObject(CBCViewModel())
//        .modelContainer(preview.container)
//    
//}
