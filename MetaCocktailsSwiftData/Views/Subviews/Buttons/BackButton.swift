//
//  BackButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/9/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss
    var action: (() -> Void)? = {}
    
    var body: some View {
        if #available(iOS 26.0, *) {
            Button{
                dismiss()
                action?()
            } label: {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 18))
            }
            .frame(width: 24, height: 24)
            .glassEffect(.regular, in: .circle)
            .tint(.primary)
        } else {
            Button{
                dismiss()
                action?()
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
