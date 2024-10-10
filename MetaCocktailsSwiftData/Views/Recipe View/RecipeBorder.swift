//
//  RecipeBorder.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/27/24.
//

import SwiftUI

struct Border: View {
    
    var height: CGFloat
    
    @Binding var color: BorderGradient
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
//                BorderSides(color: $color)
                
                VStack(alignment: .leading) {
                    BorderTop(color: $color)
                    
                    Spacer()
                    
                    BorderBottom(color: $color)
                        .rotationEffect(.degrees(180))
                }
                
                BorderSides(color: $color)
            }
            .frame(height: height, alignment: .center)
        }
    }
}



private struct BorderTop: View {
    
    @Binding var color: BorderGradient
    
    var body: some View {
        ZStack {
            
//            Image(.backgroundTop)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .foregroundStyle(ColorScheme.recipeBackground)
            
            
            Image(.borderTop)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.clear)
                .foregroundStyle(color.top)
        }
    }
}

private struct BorderBottom: View {
    
    @Binding var color: BorderGradient
    
    var body: some View {
        ZStack(alignment: .top) {
            
//            Image(.backgroundTop)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .foregroundStyle(ColorScheme.recipeBackground)
            
            
            Image(.borderTop)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.clear)
                .foregroundStyle(color.bottom)
        }
    }
}

private struct BorderSides: View {
    
    @Binding var color: BorderGradient
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                
                ZStack {
//                    Image(.backgroundSides)
//                        .resizable()
//                        .foregroundStyle(ColorScheme.recipeBackground)
//                        .frame(height: geo.size.height * 0.8)
                    
                    Image(.borderSides)
                        .resizable()
                        .background(.clear)
                        .foregroundStyle(color.top)
                        .frame(height: geo.size.height * 0.8)
                }
                Spacer()
            }
        }
    }
}
