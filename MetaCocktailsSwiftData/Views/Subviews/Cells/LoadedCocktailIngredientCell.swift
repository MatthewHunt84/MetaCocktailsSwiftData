//
//  LoadedCocktailIngredientCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/12/24.
//

import SwiftUI

struct LoadedCocktailIngredientCell: View {
    @State var includeOrOmit: IncludeOrOmit = .include
    @State var ingredient: CocktailIngredient
    //@State var amountInMls =  0

    
    var body: some View {
        HStack {
         
            Text("\(NSNumber(value:  ingredient.value)) \(ingredient.unit.rawValue) \(ingredient.ingredient.name)")

            Spacer()
            Picker("Include?", selection: $includeOrOmit) {
                ForEach(IncludeOrOmit.allCases, id: \.self){
                    Text($0.rawValue)
                }
            }
            .frame(width: 110, height: 50, alignment: .center)
            .pickerStyle(.segmented)
            
//            Text("\(NSNumber(value: ingredient.abv)) %ABV")
//                .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }

        .frame(maxHeight: 50)
        
    }
}

#Preview {
    LoadedCocktailIngredientCell(ingredient: CocktailIngredient(IngredientType.agaves(.elTesoroRepo), value: 2, unit: .fluidOunces))
}
enum IncludeOrOmit: String, CaseIterable {
    case include = "Include"
    case omit = "Omit"
}
