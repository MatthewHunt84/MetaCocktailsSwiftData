//
//  prepListCell.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct PrepListCell: View {
    
    var prepItem: Prep
    
    var body: some View {

        HStack {

            Text(prepItem.prepIngredientName)
                .font(.title)

            Spacer()
        }
    }
}

struct prepListCell_Previews: PreviewProvider {
    static var previews: some View {
        PrepListCell(prepItem: PrepItemRecipe.cucumberSyrup)
    }
}
