//
//  SearchForCocktailsButton.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

struct SearchForCocktailsButton: View {
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        
        Button {
            Task {
                await viewModel.searchButtonPressed()
            }
        } label: {
            
            Color.blueTint.mask {
                HStack {

                    Image(systemName: "magnifyingglass.circle")
                        .font(.title2).bold()
                    
                    Text("Search")
                        .font(.title2).bold()
                }
            }
            .frame(maxWidth: 140)
        }
        .buttonStyle(RoundedButtonStyle(isDisabled: viewModel.preferredCount == 0))
        .frame(height: 44)
        .padding(.top, viewModel.unwantedSelections.count > 0 ? -55 : -40)
        .padding(.trailing, 15)
        .disabled(viewModel.isRunningComplexSearch || viewModel.preferredCount == 0)
    }
}

#Preview {
    SearchForCocktailsButton()
        .environmentObject(SearchCriteriaViewModel())
}
