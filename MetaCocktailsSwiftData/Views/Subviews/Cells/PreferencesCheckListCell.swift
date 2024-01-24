//
//  PreferencesCheckListCell.swift
//  MetaCocktails
//
//  Created by James on 8/10/23.
//

import SwiftUI

struct PreferencesCheckListCell: View {
    @Binding var ingredient: CocktailComponent
    var isShowingPreferences:  Bool
   
    
    var body: some View {
        
        HStack {
            GeometryReader{ geo in
                if self.isShowingPreferences == true {
                    
                    //Spacer()
                    Toggle(isOn: $ingredient.isPreferred) {}
                        .padding(.horizontal, 20)
                        .tint(Color(.brandPrimaryGreen))
                        .frame(width: geo.size.width/9, height: 40, alignment: .leading)
                    
                        .offset(x: -15)
                    
                    
                   Text(ingredient.name)
                        .frame(width: geo.size.width * 0.8, height: 40, alignment: .leading)
                        .minimumScaleFactor(0.2)
                        .multilineTextAlignment(.leading)
                        .offset(x: 85)
                        
                        
                    
                    
                    
                } else {
                    
                    Toggle(isOn: $ingredient.isUnwanted) {}
                        .padding(.horizontal, 20)
                        .tint(Color(.brandPrimaryRed))
                        .frame(width: geo.size.width/9, height: 40, alignment: .leading)
                        .offset(x: -15)
                    Text(ingredient.name)
                        .frame(width: geo.size.width * 0.8, height: 40, alignment: .leading)
                        .minimumScaleFactor(0.2)
                        .multilineTextAlignment(.leading)
                        .offset(x: 85)
                        
                    
                }
                
            }
          
        }
        
    }
}




struct PreferencesCheckListCell_Previews: PreviewProvider {
    @State static var mockData = CocktailComponent(name: "Super Dooper Long Working For Some Reason")
    
    static var previews: some View {
        PreferencesCheckListCell(ingredient: $mockData , isShowingPreferences: true)
            .environmentObject(SearchCriteriaViewModel())

    }
}


