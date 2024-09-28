//
//  OldCocktailsAlertView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI

struct ErrorAlertView: View {
    @Binding var isActive: Bool
    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> ()
    @State private var offset: CGFloat = 1000
    
    var body: some View {
            VStack {
                Text(title)
                    .font(FontFactory.mediumFont(size: 22))
                    .foregroundStyle(Color.selectedRed)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                
                Text(message)
                    .font(FontFactory.fontBody16)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                    
                
                ErrorButton(buttonText: buttonTitle) {
                    action()
                    close()
                }
            }
            .padding()
            .background(BlackGlassBackgroundView())
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.redGold, lineWidth: 2)
            )
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.easeInOut) {
                    offset = 0
                }
            }
            .padding(.horizontal, 40)
    }
    
    func close() {
        withAnimation(.easeInOut) {
            offset = 1000
            isActive = false
        }
    }
}

struct ErrorButton: View {
    let buttonText: String
    let rightImage: Image?
    let leftImage: Image?
    let action: () -> ()
    
    init(buttonText: String, rightImage: Image? = nil, leftImage: Image? = nil, action: @escaping () -> Void) {
        self.buttonText = buttonText
        self.rightImage = rightImage
        self.leftImage = leftImage
        self.action = action
    }
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                action()
            } label: {
                HStack {
                    if let leftNewImage = leftImage {
                        leftNewImage
                            .tint(ColorScheme.interactionTint)
                    }
                    Text(buttonText)
                        .tint(Color.primary)
                    if let rightNewImage = rightImage {
                        rightNewImage
                            .tint(ColorScheme.interactionTint)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .font(FontFactory.mediumFont(size: 18))
                .background(Capsule().fill(.selectedRed))
            }
            Spacer()
        }
    }
}

struct CustomAlertView: View {
    @Binding var isActive: Bool
    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> ()
    @State private var offset: CGFloat = 1000
    
    var body: some View {
            VStack {
                Text(title)
                    .font(FontFactory.regularFont(size: 22))
                    .foregroundStyle(.brandPrimaryGold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                
                Text(message)
                    .font(FontFactory.fontBody16)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                    
                
                UniversalBlueButton(buttonText: buttonTitle, includeBorder: true) {
                    action()
                    close()
                }
            }
            .padding()
            .background(BlackGlassBackgroundView())
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary, lineWidth: 2)
            )
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.easeInOut) {
                    offset = 0
                }
            }
            .padding(.horizontal, 40)
    }
    func close() {
        withAnimation(.easeInOut) {
            offset = 1000
            isActive = false
        }
    }
    
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return CustomAlertView(isActive: .constant(true), title: "This is a title", message: "Message that explains what needs to change.", buttonTitle: yesChef) {
        
    }
    .modelContainer(preview.container)
    
}


var yesChef = "Yes, Chef"


