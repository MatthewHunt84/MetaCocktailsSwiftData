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
                            .font(.system(size: 16))
                            .bold()
                            .tint(ColorScheme.interactionTint)
                            .frame(width: 50, height: 40)
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

extension View {
    func recipeHeader(cocktail: Cocktail?) -> some View {
        self.modifier(RecipeTitleView(cocktail: cocktail))
    }
}


struct RecipeTitleView: ViewModifier {
    
    @Environment(\.dismiss) private var dismiss
    var cocktail: Cocktail?
    
    init(cocktail: Cocktail?) {
        self.cocktail = cocktail
    }
    
    func body(content: Content) -> some View {
        
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigation) {
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 16))
                            .bold()
                            .tint(ColorScheme.interactionTint)
                            .frame(width: 50, height: 40)
                    }
                }
                if let cocktail {
                    
                    ToolbarItem(placement: .principal) {
                        
                        VStack {
                            FontFactory.recipeHeader(title: cocktail.cocktailName)
                                .lineLimit(1)
                                .minimumScaleFactor(0.4)
                            if let _ = cocktail.variation, let recipeSubheading = cocktail.collection?.recipeSubheading {
                                FontFactory.mediumText(recipeSubheading, size: 12, color: .secondary)
                            }
                        }
                    }
                }
                    
            }
    }
}
