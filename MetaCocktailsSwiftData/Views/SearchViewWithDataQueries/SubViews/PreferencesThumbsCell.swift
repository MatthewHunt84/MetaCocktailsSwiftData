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
    @State private var isPrefered: Bool = false
    @State private var isUnwanted: Bool = false
    
    var body: some View {
        HStack{
            Text(ingredient.name)
            Spacer()
            Image(systemName:ingredient.isPrefered ? "hand.thumbsup.fill" : "hand.thumbsup")
                .foregroundStyle(ingredient.isPrefered ? .brandPrimaryGreen : .white)
                .onTapGesture {
                    if !isPrefered {
                        ingredient.isPrefered = true
                        print("We added 1. The perfered count is now \(viewModel.preferredCount)")
                        viewModel.preferredIngredients.append(ingredient)
                        if ingredient.isUnwanted{
                            ingredient.isUnwanted = false
                            viewModel.unwantedIngredients.removeAll(where: { $0.name == ingredient.name })
                        }
                    } else {
                        viewModel.preferredIngredients.removeAll(where: { $0.name == ingredient.name } )
                        ingredient.isPrefered = false
                        print("We took away 1. The perfered count is now \(viewModel.preferredCount)")
                    }
                }
                .font(.system(size: 20))
            Image(systemName:ingredient.isUnwanted ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                .foregroundStyle(ingredient.isUnwanted ? .brandPrimaryRed : .white)
                .onTapGesture {
                    if !isUnwanted {
                        ingredient.isUnwanted = true
                        viewModel.unwantedIngredients.append(ingredient)
                        if ingredient.isPrefered {
                            ingredient.isPrefered = false
                            viewModel.preferredIngredients.removeAll(where: { $0.name == ingredient.name } )
                            print("We took away 1. The perfered count is now \(viewModel.preferredCount)")
                        }
                    } else {
                        viewModel.unwantedIngredients.removeAll(where: { $0.name == ingredient.name })
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
