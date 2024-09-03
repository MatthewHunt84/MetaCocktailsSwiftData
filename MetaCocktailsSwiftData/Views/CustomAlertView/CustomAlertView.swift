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
                    .font(FontFactory.regularFont(size: 28))
                    .bold()
                    .padding()
                    .foregroundStyle(.white)
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
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(MeshGradients.activeBlue)
                        Text(buttonTitle)
                            .font(FontFactory.specMeasurement16B)
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .padding()
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(BlackGlassBackgroundView())
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .white, radius: 5)
            .padding(30)
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


