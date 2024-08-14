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
                .foregroundColor(.white)
            
            Image(systemName: "xmark")
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 35)
        .foregroundStyle(.black)
        .padding(.horizontal, 15)
        .background {
            Capsule()
                .fill(viewModel.color.gradient)
        }
    }
}

#Preview {
    SelectionTagView(viewModel: SelectionTagViewModel(name: "Selection", isPreferred: true))
}
