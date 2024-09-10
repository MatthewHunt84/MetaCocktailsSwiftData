//
//  SearchForCocktailsButton.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

struct SearchForCocktailsButton: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @State private var isGlowing = false // State variable to trigger the glowing effect
    
    var body: some View {
        
        Button {
            Task {
                await viewModel.searchButtonPressed()
            }
        } label: {
            VStack{
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20)).bold()
                    .foregroundColor(viewModel.preferredSelections.isEmpty ? .brandSecondaryGray : ColorScheme.interactionTint)
                 
                FontFactory.regularText("Search", size: 14)
                    .foregroundColor(viewModel.preferredSelections.isEmpty ? .brandSecondaryGray : ColorScheme.interactionTint)
                
            }
            
        }
        .onAppear {
            
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                isGlowing = true
            }
            
        }

    }
}

#Preview {
    SearchForCocktailsButton()
        .environmentObject(SearchCriteriaViewModel())
}
