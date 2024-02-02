//
//  EightySixCheckListCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import SwiftUI

struct EightySixCheckListCell: View {
    @Binding var ingredient: CocktailComponent

   
    
    var body: some View {
        
        HStack {
            GeometryReader{ geo in
            
                    
                    //Spacer()
                    Toggle(isOn: $ingredient.is86d) {}
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

struct EightySixCheckListCell_Previews: PreviewProvider {
    @State static var smockData = CocktailComponent(name: "Super Dooper Long Working For Some Reason")
    
    static var previews: some View {
        EightySixCheckListCell(ingredient: $smockData)
            .environmentObject(SearchCriteriaViewModel())
    }
       
}
