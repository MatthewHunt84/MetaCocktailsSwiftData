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
                    FontFactory.titleHeader30(title: title)
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
                            .tint(.blueTint)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    FontFactory.titleHeader30(title: title)
                }
            }
    }
}

struct GradientNavigationTitle: ViewModifier {
    let title: String
    let colors: [Color]
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    let gradient: LinearGradient
    
    init(_ title: String, colors: [Color] = [Color(.redGold), Color(.brandPrimaryGold), .red], startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing) {
        self.title = title
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.gradient = LinearGradient(gradient: Gradient(colors: colors),
                                       startPoint: startPoint,
                                       endPoint: endPoint)
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(gradient)
                }
            }
    }
}

struct GradientNavigationTitleWithNavigation: ViewModifier {
    
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
                            .tint(.blueTint)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.largeTitle).bold()
                        .foregroundStyle(MeshGradients.goldTitle)
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
    func goldHeader(_ title: String, startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing) -> some View {
        self.modifier(GradientNavigationTitle(title, startPoint: startPoint, endPoint: endPoint))
    }
}

extension View {
    func goldHeaderWithNavigation(title: String, dismiss: DismissAction) -> some View {
        self.modifier(GradientNavigationTitleWithNavigation(dismiss: dismiss, title: title))
    }
}
