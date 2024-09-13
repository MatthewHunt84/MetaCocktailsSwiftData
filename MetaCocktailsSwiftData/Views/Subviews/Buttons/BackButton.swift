//
//  BackButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/9/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Button{
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 9)
                        .bold()
                        .tint(ColorScheme.interactionTint)
                        .padding(.trailing, 10)
                }
                
                .frame(width: 40, height: 40)
            }
        }
    }
}

#Preview {
    BackButton()
}
