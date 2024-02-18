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
                    .padding(25)
                    .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.black) : Color.brandPrimaryGreen)
                    .clipShape(Circle())
                    .shadow(color: Color(UIColor.lightGray), radius: 4)
                    .foregroundColor(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.white)
                
                
            }
            .disabled(viewModel.selectedPreferredIngredients().count == 0 ? true : false)
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
            .padding(10)
            .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.black) : Color.brandPrimaryRed)
            .foregroundColor(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.white)
            .clipShape(Circle())
            .shadow(color: Color(UIColor.lightGray), radius: 4)
          
            
            .offset(x: -3, y: -40)
            
        }
    }
}
#Preview {
    SearchButtonView()
        .environmentObject(SearchCriteriaViewModel())
}