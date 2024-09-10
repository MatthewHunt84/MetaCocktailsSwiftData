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
                HStack{
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 9)
                        .font(.system(size: 22))
                        .tint(.blueTint)
                        .padding(.trailing, 10)
                    
                }
            }
        }
    }
}

#Preview {
    BackButton()
}

