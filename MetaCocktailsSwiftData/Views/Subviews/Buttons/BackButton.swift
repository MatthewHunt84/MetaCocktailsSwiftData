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
        HStack{
            Button{
                dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .tint(.cyan)
                Text("Back")
                    .tint(.cyan)
            }
            Spacer()
        }
    }
}

#Preview {
    BackButton()
}
