//
//  RoundButtonStyle.swift
//  MetaCocktails
//
//  Created by James on 8/11/23.
//

import SwiftUI

struct RoundButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            
            .padding(20)
            .background(Color(UIColor.systemBackground))
            .clipShape(Circle())
            .frame(width: 110, height: 110)
            .shadow(color: Color(UIColor.systemGray), radius: 10, x: 0, y: 0)

    }
}
