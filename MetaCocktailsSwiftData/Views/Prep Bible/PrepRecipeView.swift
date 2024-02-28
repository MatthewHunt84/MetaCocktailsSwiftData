//
//  PrepRecipeView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct PrepRecipeView: View {
    
    var prep: Prep
    
    var body: some View {
        
        NavigationStack{   //Let's throw a geometry reader here and only show the dismiss button if the view height is larger than the screen height
            VStack{
                List{
                    
                    
                    ForEach(prep.prepRecipe) { recipe in
                        HStack {
                            Text("\(recipe.step). \(recipe.method)")
                        }
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        .multilineTextAlignment(.leading)
                    }
                    
                    
                }
                .listStyle(.plain)
            }
            .navigationTitle("Instructions:")
        }
        
    }
}


#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return PrepRecipeView(prep: Prep(prepIngredientName: "Placeholder", prepRecipe: [Instruction(step: 1, method: "Do some prep")]))
        .modelContainer(preview.container)
        .environmentObject(SearchCriteriaViewModel())
}
