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
            MeshGradients.blurpleLinear.mask {
                HStack {
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.title2).bold()
                    
                    Text("Search For Cocktails")
                        .font(.title2).bold()
                    
                    Spacer()
                }
            }
        }
        .buttonStyle(.bordered)
        .frame(height: 44)
        .padding(.leading, 40)
        .padding(.trailing, 40)
        .padding(.bottom, 20)
        .disabled(viewModel.isRunningComplexSearch)
    }
}

#Preview {
    SearchForCocktailsButton()
        .environmentObject(SearchCriteriaViewModel())
}
