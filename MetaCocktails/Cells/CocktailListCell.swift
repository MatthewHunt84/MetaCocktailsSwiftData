//
//  CocktailListCell.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

struct CocktailListCell: View {
    let cocktail: Cocktail
    let backgroundColor: Color
    
    var body: some View {

        HStack {
            cocktail.image // new type we created that handles all the formatting
            Text(cocktail.name)
                .font(.title)
                .fontDesign(.serif)
            
        }
    }
}

struct CocktailListCell_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListCell(cocktail: daiquiri, backgroundColor: Color.brandPrimaryRed )
    }
}
