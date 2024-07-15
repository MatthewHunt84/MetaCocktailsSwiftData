//
//  PreferencesThumbsCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI

struct PreferencesThumbsCell: View {
    @Binding var ingredient: IngredientBase
    @State private var isPrefered: Bool = false
    @State private var isUnwanted: Bool = false
    
    var body: some View {
        HStack{
            Text(ingredient.name)
            Spacer()
            Image(systemName:isPrefered ? "hand.thumbsup.fill" : "hand.thumbsup")
                .foregroundStyle(isPrefered ? .brandPrimaryGreen : .white)
                .onTapGesture {
                    isPrefered.toggle()
                    if isUnwanted{
                        isUnwanted = false
                    }
                }
                .font(.system(size: 20))
            Image(systemName:isUnwanted ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                .foregroundStyle(isUnwanted ? .brandPrimaryRed : .white)
                .onTapGesture {
                    isUnwanted.toggle()
                    if isPrefered{
                        isPrefered = false
                    }
                }
                .padding(.horizontal, 10)
                .font(.system(size: 20))
        }
    }
}

#Preview {
    @Previewable @State var mockIngredient = IngredientBase(name: "Test", category: Category.agaves, prep: nil)
    PreferencesThumbsCell(ingredient: $mockIngredient)
}
