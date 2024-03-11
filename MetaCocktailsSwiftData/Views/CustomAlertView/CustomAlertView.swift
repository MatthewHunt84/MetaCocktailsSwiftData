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
                    .font(.title2)
                    .bold()
                    .padding()
                    .foregroundStyle(.brandPrimaryGold)
                    .multilineTextAlignment(.center)
                
                Text(message)
                    .font(.body)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Button {
                    action()
                    close()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.brandPrimaryGold)
                        Text(buttonTitle)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.black)
                            .padding()
                    }
                    .padding()
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                VStack{
                    HStack {
                        Spacer()
                        Button {
                            close()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                        .tint(.white)
                    }
                    Spacer()
                }
                .padding()
            }
            .shadow(color: .white, radius: 5)
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.easeInOut.speed(0.5)) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
        
    }
    func close() {
        withAnimation((.easeInOut.speed(0.5))) {
            offset = 1000
            isActive = false
        }
    }
    
}

#Preview {
    CustomAlertView(isActive: .constant(true), title: "These cocktails are OLD old.", message: "Message", buttonTitle: "Custom Button") {
        
    }
}

