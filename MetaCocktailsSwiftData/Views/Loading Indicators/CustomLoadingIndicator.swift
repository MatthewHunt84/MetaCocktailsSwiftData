//
//  BasicLoadingIndicator.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/13/24.
//

import SwiftUI

struct CustomLoadingOverlayModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    CustomLoadingAnimation()
                        .frame(width: 120, height: 120)
                        .transition(.opacity.animation(.easeOut(duration: 0.3)))
                        .opacity(0.9)
                }
            }
            .animation(.easeOut(duration: 10), value: isLoading)
    }
}

struct FirstLoadAnimation: View {
    @State private var rotationCircle = 0.0
    let frame: CGFloat
    let duration: TimeInterval
    let internalColor: Color
    let externalColor: LinearGradient
    let reverse: Bool
    
    var body: some View {
        
        ZStack {
            Image(.limeCenter)
                .resizable()
                .foregroundStyle(internalColor)
            
            Image(.limeSegments)
                .resizable()
                .rotationEffect(.degrees(rotationCircle))
                .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: rotationCircle)
        }
        .foregroundStyle(externalColor)
        .frame(width: frame, height: frame)
        .task {
            await MainActor.run {
                rotationCircle = 360
            }
        }
    }
}

struct CustomLoadingAnimation: View {
    @State private var rotationCircle = 0.0
    
    var body: some View {
        
        ZStack {
            Image(.limeCenter)
                .resizable()
                .foregroundStyle(Color.clear)
            
            Image(.limeSegments)
                .resizable()
                .rotationEffect(.degrees(rotationCircle))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: rotationCircle)
        }
        .foregroundStyle(LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange], startPoint: .topLeading, endPoint: .bottomTrailing))
        .task {
            await MainActor.run {
                rotationCircle = 360
            }
        }
    }
}

extension View {
    func customLoadingIndicator(isLoading: Bool) -> some View {
        self.modifier(CustomLoadingOverlayModifier(isLoading: isLoading))
    }
}

#Preview {
    CustomLoadingAnimation()
        .frame(width: 250, height: 250)
}

