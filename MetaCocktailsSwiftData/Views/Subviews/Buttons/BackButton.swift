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
                        .font(.system(size: 16))
                        .bold()
                        .tint(ColorScheme.interactionTint)
                }
                .frame(width: 50, height: 40)
            }
        }
    }
}

#Preview {
    BackButton()
}
