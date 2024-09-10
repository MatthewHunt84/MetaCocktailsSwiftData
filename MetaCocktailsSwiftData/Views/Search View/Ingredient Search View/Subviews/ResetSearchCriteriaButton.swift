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
                        Text("Reset")
                        Image(systemName: "x.circle.fill")
                    }
                    .tint(ColorScheme.interactionTint)
                    .font(FontFactory.fontBody16)
                }
            }
        }
}

#Preview {
    ResetSearchCriteriaButton()
}
