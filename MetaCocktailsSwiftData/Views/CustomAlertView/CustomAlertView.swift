//
//  OldCocktailsAlertView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI

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
                    .bold()
                    .foregroundStyle(.brandPrimaryGold)
                    .multilineTextAlignment(.center)
                
                Text(message)
                    .font(FontFactory.fontBody16)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Button {
                    action()
                    close()
                } label: {
                    ZStack {
                        Text(buttonTitle)
                            .font(FontFactory.fontBody16)
                            .foregroundStyle(.blueTint)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    }
                    .padding()
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(BlackGlassBackgroundView())
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 2)
            )
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.easeInOut.speed(0.75)) {
                    offset = 0
                }
            }
    }
    func close() {
        withAnimation((.easeInOut.speed(0.75))) {
            offset = 1000
            isActive = false
        }
    }
    
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return CustomAlertView(isActive: .constant(true), title: "Title", message: "Message", buttonTitle: "Custom Button") {
        
    }
    .modelContainer(preview.container)
    
}


var heardChef = "Heard, Chef."


