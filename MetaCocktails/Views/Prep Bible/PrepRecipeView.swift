//
//  PrepRecipeView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct PrepRecipeView: View {
    
    @Binding var isShowingPrepRecipe: Bool
    var prepRecipe: String
    
    var body: some View {

        //Let's throw a geometry reader here and only show the dismiss button if the view height is larger than the screen height

        ScrollView {
            Text(prepRecipe)
                .font(.body)
                .padding(.leading)
                .padding(.trailing)
                .padding(40)

            Button("Dismiss") {
                isShowingPrepRecipe = false
                print("did something")
            }
            .modifier(StandardButtonStyle())
        }
        .frame(width: 340, height: 725)
        .background(Color(.systemGray5))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingPrepRecipe = false
        }label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct PrepRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        PrepRecipeView(isShowingPrepRecipe: .constant(true), prepRecipe: "Recipe")
    }
}
