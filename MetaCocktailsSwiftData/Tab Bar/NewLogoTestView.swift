//
//  NewLogoTestView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 11/1/24.
//
import SwiftUI

struct NewLogoView: View {
    
    @State private var rotationCircle = 0.0
    @State private var rotationCircle2 = 0.0
    
    var body: some View {
        HStack {
            
            VStack {
                ZStack {
                    Image(.limeCenter)
                        .resizable()
                        .foregroundStyle(.clear)
                    
                    Image(.limeSegments)
                        .resizable()
                        .rotationEffect(.degrees(rotationCircle))
                        .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: rotationCircle)
                    
                }
                .foregroundStyle(ColorScheme.tintColor)
                .task {
                    await MainActor.run {
                        rotationCircle = 360
                    }
                }
                .frame(width: 180, height: 180)
                
                
                
                ZStack {
                    Image(.limeCenter)
                        .resizable()
                        .foregroundStyle(.clear)
                    
                    Image(.limeSegments)
                        .resizable()
                        .rotationEffect(.degrees(rotationCircle2))
                        .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: rotationCircle2)
                    
                }
                .foregroundStyle(Color.brandPrimaryGreen)
                .task {
                    await MainActor.run {
                        rotationCircle2 = -360
                    }
                }
                .frame(width: 180, height: 180)
                
                
                ZStack {
                    Image(.limeCenter)
                        .resizable()
                        .foregroundStyle(.secondary)
                    
                    Image(.limeSegments)
                        .resizable()
                        .rotationEffect(.degrees(rotationCircle))
                        .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: rotationCircle)
                    
                }
                .foregroundStyle(Color(hex: "#f1f2f2"))
                .frame(width: 180, height: 180)
                
                ZStack {
                    Image(.limeCenter)
                        .resizable()
                        .foregroundStyle(Color.primary.mix(with: ColorScheme.tintColor, by: 0.33))
                    
                    Image(.limeSegments)
                        .resizable()
                        .rotationEffect(.degrees(rotationCircle2))
                        .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: rotationCircle2)
                    
                }
                .foregroundStyle(ColorScheme.interactionTint)
                .frame(width: 180, height: 180)
            }
            
            
            
            
            
            VStack {
                ZStack {
                    Image(.limeCenter)
                        .resizable()
                        .foregroundStyle(Color.primary.mix(with: ColorScheme.tintColor, by: 0.33))
                    
                    Image(.limeSegments)
                        .resizable()
                        .rotationEffect(.degrees(rotationCircle))
                        .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: rotationCircle)
                    
                }
                .foregroundStyle(ColorScheme.tintColor)
                .task {
                    await MainActor.run {
                        rotationCircle = 360
                    }
                }
                .frame(width: 180, height: 180)
                
                
                
                ZStack {
                    Image(.limeCenter)
                        .resizable()
                        .foregroundStyle(Color.primary.mix(with: .brandPrimaryGreen, by: 0.33))
                    
                    Image(.limeSegments)
                        .resizable()
                        .rotationEffect(.degrees(rotationCircle2))
                        .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: rotationCircle2)
                    
                }
                .foregroundStyle(LinearGradient(colors: [Color.brandSecondaryGreen, Color.brandPrimaryGreen, Color.brandSecondaryGreen], startPoint: .topLeading, endPoint: .bottomTrailing))
//                .foregroundStyle(.brandPrimaryGreen)
                .task {
                    await MainActor.run {
                        rotationCircle2 = -360
                    }
                }
                .frame(width: 180, height: 180)
                
                
                ZStack {
                    Image(.limeCenter)
                        .resizable()
                        .foregroundStyle(Color.primary.mix(with: ColorScheme.tintColor, by: 0.33))
                    
                    Image(.limeSegments)
                        .resizable()
                        .rotationEffect(.degrees(rotationCircle))
                        .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: rotationCircle)
                    
                }
                .foregroundStyle(LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 180, height: 180)
                
                ZStack {
                    Image(.limeCenter)
                        .resizable()
                        .foregroundStyle(LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange], startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .foregroundStyle(.secondary)
                    
                    Image(.limeSegments)
                        .resizable()
                        .rotationEffect(.degrees(rotationCircle2))
                        .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: rotationCircle2)
                    
                }
                .foregroundStyle(Color.brandPrimaryOrange)
//                .foregroundStyle(.primary)
                .frame(width: 180, height: 180)
            }
        }
        .background(ColorScheme.background)
    }
}
