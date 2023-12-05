//
//  SearchViewRecipeCard.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 12/4/23.
//
import SwiftUI

struct SearchViewRecipeCard: View {
    
    @State var cocktail: Cocktail


    @State private var isShowingBuildOrder = false

    var body: some View {
        
        VStack {

            Spacer()

//            cocktail.image

            VStack {

               RecipeIngredientsView(cocktail: cocktail)
                    .fontWeight(.semibold)
            }

   
            Spacer()
        }
     
    }
    
        
}

struct SearchViewRecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewRecipeCard(cocktail: aperolSpritz)
    }
}

