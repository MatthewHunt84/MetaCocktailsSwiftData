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
    @State private var isShowingIngredientInfo : Bool = false
    
    var body: some View {
        VStack{
            HStack {
                GeometryReader{ geo in
                    if self.isShowingPreferences == true {
                        
                        Toggle(isOn: $ingredient.isPreferred) {}
                            .padding(.horizontal, 20)
                            .tint(ColorScheme.selectedColor)
                            .frame(width: geo.size.width/9, height: 40, alignment: .leading)
                        
                            .offset(x: -15)
                        
                        
                        Text(ingredient.name)
                            .frame(width: geo.size.width * 0.8, height: 40, alignment: .leading)
                            .minimumScaleFactor(0.2)
                            .multilineTextAlignment(.leading)
                            .offset(x: 85)
                        if ingredient.info != nil {
                            Image(systemName: "info.circle.fill")
                                .foregroundStyle(.blue)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        isShowingIngredientInfo.toggle()
                                    }
                                    
                                }
                            
                        }
                        
                        
                        
                        
                    } else {
                        
                        Toggle(isOn: $ingredient.isUnwanted) {}
                            .padding(.horizontal, 20)
                            .tint(ColorScheme.unwantedColor)
                            .frame(width: geo.size.width/9, height: 40, alignment: .leading)
                            .offset(x: -15)
                        Text(ingredient.name)
                            .frame(width: geo.size.width * 0.8, height: 40, alignment: .leading)
                            .minimumScaleFactor(0.2)
                            .multilineTextAlignment(.leading)
                            .offset(x: 85)
                        if ingredient.info != nil {
                            Image(systemName: "info.circle.fill")
                                .foregroundStyle(.blue)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        isShowingIngredientInfo.toggle()
                                    }
                                    
                                }
                            
                        }
                        
                    }
                    
                }
                
            }
            if isShowingIngredientInfo {
                Text(ingredient.info!)
                    .font(.caption)
                    .foregroundStyle(.brandPrimaryGold)
                    .padding(.top, 10)
            }
        }
    }
}
