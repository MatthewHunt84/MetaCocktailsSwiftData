//
//  InlineDisclosureGroupStyle.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/21/24.
//

import Foundation
import SwiftUI


struct InlineDisclosureGroupStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Image(systemName: configuration.isExpanded ? "chevron.down" : "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 12, height: 12)
                .foregroundColor(.blueTint)
            Spacer()
        }
        .contentShape(Rectangle()) // Make the entire HStack tappable
        .onTapGesture {
            // Toggle the expanded state when the HStack is tapped
            withAnimation {
                configuration.isExpanded.toggle()
            }
        }
        // The content of the DisclosureGroup, conditionally displayed
        if configuration.isExpanded {
            
            configuration.content
                .padding(.leading) // Indent the content to align under the label
                .transition(.opacity) // Animate the appearance/disappearance of the content
        }
    }
}
