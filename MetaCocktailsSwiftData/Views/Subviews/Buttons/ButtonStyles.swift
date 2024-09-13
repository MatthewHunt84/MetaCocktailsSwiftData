//
//  ButtonStyles.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/27/24.
//

import SwiftUI

struct whiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
        .foregroundColor(Color(UIColor.systemCyan))
        
    }
}

struct defaultButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(Color(UIColor.white))
        .font(.system(size: 16, weight: .bold))
        .padding(.top, 25)
        .padding(.bottom, 25)
    }
}

struct BlackNWhiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(ColorScheme.interactionTint)
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .foregroundColor(Color(UIColor.white))
    }
}

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .controlSize(.large)
            .fontWeight(.bold)
            .frame(width: 200, height: 30)
   
    }
}

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


