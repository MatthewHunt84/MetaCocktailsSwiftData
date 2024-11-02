//
//  RecipeBorder.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/27/24.
//

import SwiftUI

struct Border: View {
    
    var height: CGFloat
    
    @Binding var gradient: BorderGradient
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                BorderSides(gradient: $gradient)
                
                VStack(alignment: .leading) {
                    BorderTop(gradient: $gradient)
                    
                    Spacer()
                    
                    BorderBottom(gradient: $gradient)
                        .rotationEffect(.degrees(180))
                }
            }
            .frame(height: height, alignment: .center)
            .allowsHitTesting(false)
        }
    }
}



private struct BorderTop: View {
    
    @Binding var gradient: BorderGradient
    
    var body: some View {

        Image(.borderTopNew)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.clear)
                .foregroundStyle(gradient.top)
    }
}

private struct BorderBottom: View {
    
    @Binding var gradient: BorderGradient
    
    var body: some View {
            
            Image(.borderTopNew)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.clear)
                .foregroundStyle(gradient.bottom)
//                .foregroundStyle(gradient.top)
    }
}

private struct BorderSides: View {
    
    @Binding var gradient: BorderGradient
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                
                Spacer()
                    
                    Image(.borderSides)
                        .resizable()
                        .background(.clear)
                        .foregroundStyle(gradient.top)
                        .frame(height: geo.size.height * 0.8)

                Spacer()
            }
        }
    }
}
