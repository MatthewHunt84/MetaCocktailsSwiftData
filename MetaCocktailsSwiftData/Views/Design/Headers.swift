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
    var action: (() -> Void)? = {}
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: {
                        dismiss()
                        action?()
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

struct AboutTitleWithNavigation: ViewModifier {
    
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
                            .frame(width: 30, height: 30)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    FontFactory.aboutHeader(title: title)
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
    func jamesHeaderWithNavigation(title: String, dismiss: DismissAction, action: (() -> Void)?  = nil) -> some View {
        self.modifier(JamesTitleWithNavigation(dismiss: dismiss, title: title, action: action))
    }
}

extension View {
    func aboutHeaderWithNavigation(title: String, dismiss: DismissAction) -> some View {
        self.modifier(AboutTitleWithNavigation(dismiss: dismiss, title: title))
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
                            FontFactory.recipeHeader(title: cocktail.cocktailName, isHistoric: cocktail.collection == .originals)
                                .lineLimit(1)
                            if let _ = cocktail.variation, let recipeSubheading = cocktail.collection?.recipeSubheading {
                                FontFactory.historicText(recipeSubheading, size: 12, color: .secondary)
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        FavoriteButton(for: cocktail)
                    }
                }
            }
    }
}

struct ModalHeader: View {
    
    let title: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        HStack {
            Spacer()
            FontFactory.titleHeader22(title: title)
            
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.down")
                    .font(.system(size: 20))
                    .bold()
                    .tint(ColorScheme.interactionTint)
            }
        }
        .padding(.bottom, 20)
    }
}

extension View {
    
    func modalPrentation(_ icon: Image, labelText: String, isPresented: Binding<Bool>) -> some View {
        self.modifier(ModalPrentation(icon: icon, labelText: labelText, isPresented: isPresented))
    }
}

struct ModalPrentation: ViewModifier {
    let icon: Image
    let labelText: String
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        VStack {
                            icon
                                .tint(ColorScheme.interactionTint)
                            FontFactory.mediumText(labelText, size: 12, color: ColorScheme.interactionTint)
                        }
                    }
                }
            }
    }
}

struct InfoHeader: View {
    
    @Binding var isShowingDetail: Bool
    let text: String
    
    var body: some View {
        
        HStack(alignment: .firstTextBaseline) {
            
            FontFactory.mediumText(text, size: 20)
            
            Image(systemName: "info.circle.fill")
                .font(.system(size: 16))
                .foregroundStyle(isShowingDetail ? ColorScheme.tintColor : ColorScheme.interactionTint)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isShowingDetail.toggle()
                    }
                }
        }
    }
}

struct InfoDisclosureHeader: View {
    
    @Binding var isShowingDetail: Bool
    let text: String
    let detail: String
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .firstTextBaseline) {
                
                FontFactory.mediumText(text, size: 20)
                
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(isShowingDetail ? ColorScheme.tintColor : ColorScheme.interactionTint)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isShowingDetail.toggle()
                        }
                    }
            }
            
            if isShowingDetail {
                Text(detail)
                    .font(FontFactory.regularFont(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
            }
        }
    }
}

   
