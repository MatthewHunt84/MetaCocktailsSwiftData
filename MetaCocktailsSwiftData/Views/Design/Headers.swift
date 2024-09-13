//
//  Headers.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/27/24.
//

import SwiftUI

// Main Page Titles

struct JamesTitle: ViewModifier {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    FontFactory.titleHeader22(title: title)
                }
            }
    }
}

// Page Titles with back button

struct JamesTitleWithNavigation: ViewModifier {
    
    var dismiss: DismissAction
    let title: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 9)
                            .bold()
                            .tint(ColorScheme.interactionTint)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    FontFactory.titleHeader22(title: title)
                }
            }
    }
}

extension View {
    
    func jamesHeader(_ title: String) -> some View {
        self.modifier(JamesTitle(title))
    }
}

extension View {
    func jamesHeaderWithNavigation(title: String, dismiss: DismissAction) -> some View {
        self.modifier(JamesTitleWithNavigation(dismiss: dismiss, title: title))
    }
}
