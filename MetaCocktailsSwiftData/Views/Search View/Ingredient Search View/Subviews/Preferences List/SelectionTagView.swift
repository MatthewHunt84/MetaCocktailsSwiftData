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
            .font(.custom("AvenirNext-Regular", size: 14))
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(height: 15)
    }
}

#Preview {
    SelectionTagView(viewModel: SelectionTagViewModel(name: "Selection", isPreferred: true))
}
