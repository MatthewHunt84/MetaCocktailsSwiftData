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
            Image(systemName: "magnifyingglass")
                .font(.system(size: 20)).bold()
                .foregroundColor(viewModel.preferredSelections.isEmpty ? .brandSecondaryBlue : .blueTint) // BrandPrimaryGold for the magnifying glass
                .padding(12)
                .background(
                    Circle()
                        .fill(Color.black)
                        .shadow(color:viewModel.preferredSelections.isEmpty ? Color.clear : Color.brandPrimaryRed,
                                radius: isGlowing ? 15 : 5, x: 0, y: 0) // Animated shadow
                )
            
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
