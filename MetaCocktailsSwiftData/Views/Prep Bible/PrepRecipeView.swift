//
//  PrepRecipeView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct PrepRecipeView: View {
    
    var prepRecipe: String
    
    var body: some View {

        //Let's throw a geometry reader here and only show the dismiss button if the view height is larger than the screen height

        ScrollView{
            Text(prepRecipe)
                .multilineTextAlignment(.leading)
        }


        
    }
}

struct PrepRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        PrepRecipeView(prepRecipe: "Recipe")
    }
}
