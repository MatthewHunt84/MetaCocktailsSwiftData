//
//  SearchForCocktailsButton.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

struct SearchForCocktailsButton: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @Binding var showingResults: Bool
    
    var body: some View {
        
        Button {
            Task {
                await viewModel.searchButtonPressed()
            }
        } label: {
            HStack {
                
                Spacer()
                
                Image(systemName: "plus.circle.fill")
                    .font(.footnote).bold()
                
                Text("Search For Cocktails")
                    .font(.footnote).bold()
                
                Spacer()
            }
            .foregroundStyle(.brandPrimaryGold)
        }
        .frame(width: 380, height: 40,  alignment: .center)
        .disabled(viewModel.isRunningComplexSearch)
    }
}

#Preview {
    SearchForCocktailsButton(showingResults: .constant(true))
        .environmentObject(SearchCriteriaViewModel())
}
