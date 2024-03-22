//
//  SearchButtonView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI

struct SearchButtonView: View {
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
//    @State private var searchButtonOffset: CGFloat = 1000
//    @Binding var isActive: Bool
    var body: some View {
        if viewModel.selectedPreferredIngredients().count > 0 {
            HStack{
                
                
                NavigationLink {
                    
                    SearchResultsView(viewModel: viewModel)
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.headline).bold()
                        .padding(25)
                        .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.black) : Color.brandPrimaryGreen)
                        .clipShape(Circle())
                        //.shadow(color: Color(UIColor.lightGray), radius: 4)
                        .foregroundColor(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.white)
                    
                    
                }
                .offset(x: 16)
                .transition(.scale)
                Button(action: {
                    
                    for component in viewModel.cocktailComponents {
                        component.isPreferred = false
                        component.isUnwanted = false
                    }
                    viewModel.matchAllTheThings()
                }) {
                    Image(systemName: "xmark")
                    
                }
                .font(.footnote)
                .font(.headline).bold()
                .padding(10)
                .background(Color.brandPrimaryRed)
                .foregroundColor(.white)
                .clipShape(Circle())
                .transition(.scale)
                //.shadow(color: Color(UIColor.lightGray), radius: 4)
                
                .offset(x: -3, y: -40)
                
                
            }
//            .onAppear {
//                withAnimation(.easeInOut.speed(0.75)) {
//                    searchButtonOffset = 0 
//                }
//            }
            
        }
    }
//    func close() {
//        withAnimation((.easeInOut.speed(0.75))) {
//            searchButtonOffset = 1000
//            isActive = false
//        }
//    }
}
#Preview {
    SearchButtonView()
        .environmentObject(SearchCriteriaViewModel())
}
