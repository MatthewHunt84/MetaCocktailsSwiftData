//
//  BlackNWhiteButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI

struct BlackNWhiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(Color.black.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
            .foregroundColor(Color(UIColor.white))
        
    }
}

