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
        
        HStack(spacing: 10) {
            Text(viewModel.ingredientName)
                .font(.callout)
                .fontWeight(.semibold)
//                .foregroundColor(.white)
                .foregroundStyle(MeshGradients.staticPreferredSelection)
            Image(systemName: "hand.thumbsup.fill")
//            Image(systemName: "xmark")
                .fontWeight(.heavy)
                .foregroundStyle(MeshGradients.staticPreferredSelection)
        }
        .frame(height: 35)
        .padding(.horizontal, 15)
//        .background {
//            viewModel.isPreferred ? MeshGradients.staticPreferredSelection : MeshGradients.staticUnwantedSelection
//        }
//        .clipShape(Capsule())
        
    }
}

#Preview {
    SelectionTagView(viewModel: SelectionTagViewModel(name: "Selection", isPreferred: true))
}
