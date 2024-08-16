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
        
        Text(viewModel.ingredientName)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(Color.softWhite)
//            .foregroundStyle(viewModel.isPreferred ? Color.primary: Color.secondary)
//            .foregroundStyle(viewModel.isPreferred ? MeshGradients.whiteLinear : MeshGradients.disabledButton)
            .frame(height: 15)
    }
}

#Preview {
    SelectionTagView(viewModel: SelectionTagViewModel(name: "Selection", isPreferred: true))
}
