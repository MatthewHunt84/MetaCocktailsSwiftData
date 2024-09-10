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
                    Image(systemName: "arrow.backward.to.line")
//                    Image(systemName: "arrow.counterclockwise")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .tint(ColorScheme.unwantedColor)
                }
            }
    }
}

#Preview {
    ResetSearchCriteriaButton()
}
