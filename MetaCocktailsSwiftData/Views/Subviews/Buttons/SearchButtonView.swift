//
//  SearchButtonView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI

struct SearchButtonView: View {
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    
    var body: some View {
        HStack{
     
            
            NavigationLink {
                
                SearchResultsView(viewModel: viewModel)
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.headline).bold()
                    .padding(20)
                    .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.black) : Color.brandPrimaryGreen.opacity(0.8))
                    .clipShape(Circle())
                    .shadow(color: Color(UIColor.systemGray), radius: 4)
                    .foregroundColor(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.white)
                
                
            }
            .offset(x: 16)
            Button(action: {
                for i in 0..<viewModel.cocktailComponents.count {
                    viewModel.cocktailComponents[i].isPreferred = false
                    viewModel.cocktailComponents[i].isUnwanted = false
                    viewModel.enableMultipleSpiritSelection = false
                    
                }
                
            }) {
                Image(systemName: "xmark")
                
            }
            .font(.footnote)
            .font(.headline).bold()
            .padding(7)
            .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.black) : Color.brandPrimaryRed.opacity(0.8))
            .foregroundColor(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.white)
            .clipShape(Circle())
            .shadow(color: Color(UIColor.systemGray), radius: 4)
            
            .offset(x: 10, y: -20)
            
        }
    }
}
