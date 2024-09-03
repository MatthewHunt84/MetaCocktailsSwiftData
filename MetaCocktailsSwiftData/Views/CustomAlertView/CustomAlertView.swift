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
        ZStack {
            Color(.black)
                .opacity(0.1)
                .onTapGesture {
                    close()
                }
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
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .white, radius: 5)
            .overlay {
                VStack{
                    HStack {
                        Spacer()
                        Button {
                            close()
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .font(.title2)
                                .fontWeight(.medium)
                                .tint(.blueTint)
                        }
                        .tint(.white)
                    }
                    Spacer()
                }
                .padding()
            }
            
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.easeInOut.speed(0.75)) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
        
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


