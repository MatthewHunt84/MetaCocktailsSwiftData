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
            Image(systemName:isPreferred ? "hand.thumbsup.fill" : "hand.thumbsup")
                .foregroundStyle(isPreferred ? .brandPrimaryGreen : .white)
                .onTapGesture {
                    if !isPreferred {
                        isPreferred = true
                        viewModel.preferredIngredients.append(ingredient)
                        viewModel.preferredCount += 1
                        
                        if isUnwanted{
                            isUnwanted = false
                            viewModel.unwantedIngredients.removeAll(where: {$0 == ingredient})
                            
                        }
                    } else {
                        isPreferred = false
                        viewModel.preferredIngredients.removeAll(where: {$0 == ingredient})
                        viewModel.preferredCount -= 1
                        
                    }
                }
                .font(.system(size: 20))
            Image(systemName:isUnwanted ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                .foregroundStyle(isUnwanted ? .brandPrimaryRed : .white)
                .onTapGesture {
                    if !isUnwanted {
                        isUnwanted = true
                        viewModel.unwantedIngredients.append(ingredient)
                        if isPreferred {
                            isPreferred = false
                            viewModel.preferredIngredients.removeAll(where: {$0 == ingredient})
                            viewModel.preferredCount -= 1
                           
                        }
                    } else {
                        isUnwanted = false
                        viewModel.unwantedIngredients.removeAll(where: {$0 == ingredient})
                       
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
