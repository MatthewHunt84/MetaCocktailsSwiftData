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
            Text(cocktail.cocktailName)
                .font(.title)
                .fontDesign(.serif)
            
        }
    }
}

struct CocktailListCell_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListCell(cocktail: aperolSpritz, backgroundColor: .brandPrimaryRed)
    }
}
