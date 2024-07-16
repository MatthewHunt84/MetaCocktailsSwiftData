//
//  PreferencesThumbsCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI

struct PreferencesThumbsCell: View {
   
    @Bindable var viewModel: SearchViewModel
    @Binding var ingredient: IngredientBase
    @State private var isPreferred: Bool = false
    @State private var isUnwanted: Bool = false
    
    var body: some View {
        HStack{
            Text(ingredient.name)
            Spacer()
            Image(systemName:ingredient.isPreferred ? "hand.thumbsup.fill" : "hand.thumbsup")
                .foregroundStyle(ingredient.isPreferred ? .brandPrimaryGreen : .white)
                .onTapGesture {
                    if !isPreferred {
                        ingredient.isPreferred = true
                        if ingredient.isUnwanted{
                            ingredient.isUnwanted = false                        }
                    } else {
                        ingredient.isPreferred = false
                    }
                }
                .font(.system(size: 20))
            Image(systemName:ingredient.isUnwanted ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                .foregroundStyle(ingredient.isUnwanted ? .brandPrimaryRed : .white)
                .onTapGesture {
                    if !isUnwanted {
                        ingredient.isUnwanted = true
                        if ingredient.isPreferred {
                            ingredient.isPreferred = false
                        }
                    } else {
                        ingredient.isUnwanted = false
                    }
                }
                .padding(.horizontal, 10)
                .font(.system(size: 20))
        }
    }
}

#Preview {
    @Previewable @State var mockIngredient = IngredientBase(name: "Test", category: Category.agaves, prep: nil)
    PreferencesThumbsCell(viewModel: SearchViewModel(), ingredient: $mockIngredient)
}
