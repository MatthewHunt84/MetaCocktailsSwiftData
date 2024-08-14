//
//  ResetButton.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

struct ResetButton: View {
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        Section{
            
            Button{
                viewModel.clearData()
            } label: {
                HStack {
                    
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .font(.footnote).bold()
                    
                    Text("Clear Search")
                        .font(.footnote).bold()
                }
                .tint(.brandPrimaryRed)
                .padding()
            }
            .frame(width: 380, height: 40,  alignment: .center)
        }
    }
}

#Preview {
    ResetButton()
}
