//
//  ResetButton.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

struct ResetSearchCriteriaButton: View {
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
            Section{
                
                Button{
                    viewModel.clearSearchCriteria()
                } label: {
                    HStack {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                        Text("Clear")
                            
                    }
                    .bold()
                    .tint(ColorScheme.interactionTint)
                }
            }
    }
}

#Preview {
    ResetSearchCriteriaButton()
}
