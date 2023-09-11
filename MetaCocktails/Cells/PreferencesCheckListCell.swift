//
//  PreferencesCheckListCell.swift
//  MetaCocktails
//
//  Created by James on 8/10/23.
//

import SwiftUI

struct PreferencesCheckListCell: View {

    @State var toggleOn = false
    @Binding var ingredient: CocktailComponent
    var isShowingPreferences:  Bool
    
    var body: some View {
        HStack {
            
            if self.isShowingPreferences == true {
                
                Toggle(isOn: $ingredient.isPreferred) {
                    Text(ingredient.name)
                }
                .padding(.horizontal, 20)

            } else {
                
                Toggle(isOn: $ingredient.isUnwanted) {
                    Text(ingredient.name)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}


struct PreferencesCheckListCell_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesCheckListCell(ingredient: MockData.$mockIngredient, isShowingPreferences: true)

    }
}
