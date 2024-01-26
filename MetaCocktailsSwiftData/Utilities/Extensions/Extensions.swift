//
//  Extensions.swift
//  MetaCocktails
//
//  Created by James on 8/15/23.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct whiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
        .foregroundColor(Color(UIColor.systemCyan))
        
    }
}

struct noStyleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color(UIColor.systemCyan))
    }
}

var wNGSpecString = "(Williams & Graham Spec.)"
