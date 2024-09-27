//
//  RecipeBorder.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/27/24.
//

import SwiftUI

struct Border: View {
    
    var body: some View {
        
        ZStack {
            BorderSides()
            
            VStack(alignment: .leading) {
                BorderTop()
                
                Spacer()
                
                BorderBottom()
                    .rotationEffect(.degrees(180))
            }
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
}



private struct BorderTop: View {
    var body: some View {
        ZStack {
            
            Image(.backgroundTop)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(ColorScheme.recipeBackground)
            
            
            Image(.borderTop)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.clear)
                .foregroundStyle(ColorScheme.recipeBorder)
        }
    }
}

private struct BorderBottom: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            Image(.backgroundTop)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(ColorScheme.recipeBackground)
            
            
            Image(.borderTop)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.clear)
                .foregroundStyle(ColorScheme.recipeBorderFlipped)
        }
    }
}

private struct BorderSides: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                
                ZStack {
                    Image(.backgroundSides)
                        .resizable()
                        .foregroundStyle(ColorScheme.recipeBackground)
                        .frame(height: geo.size.height * 0.8)
                    
                    Image(.borderSides)
                        .resizable()
                        .foregroundStyle(ColorScheme.recipeBorder)
                        .background(.clear)
                        .frame(height: geo.size.height * 0.8)
                }
                Spacer()
            }
        }
    }
}
