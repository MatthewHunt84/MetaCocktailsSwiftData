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
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.black.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
            .foregroundColor(Color(UIColor.white))
        
    }
}

