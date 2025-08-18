//
//  SelectionTagView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

struct SelectionTagView: View {
    let viewModel: SelectionTagViewModel
    var body: some View {
        FontFactory.regularText(viewModel.ingredientName, size: 14, color: ColorScheme.interactionTint)
            .frame(height: 15)
            .italic()
    }
}

#Preview {
    SelectionTagView(viewModel: SelectionTagViewModel(name: "Selection", isPreferred: true))
}
