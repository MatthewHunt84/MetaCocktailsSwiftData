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
            .background(Color.brandPrimaryGold.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .foregroundColor(Color(UIColor.black))
        
    }
}

