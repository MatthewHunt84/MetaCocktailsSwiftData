//
//  CocktailImage.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/9/23.
//

import SwiftUI
import SwiftData

struct CocktailImage: View {

    var drinkColor = Color.teal.gradient
    
    var body: some View {
        
        VStack {
            ZStack {
                
                Image(.TestImages.testMojitoBackGlassLayer)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.brandPrimaryRed.gradient)
                
                Image(.TestImages.testMojitoBackGlassLayer)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .opacity(0.2)
                
                Image(.TestImages.testMojitoDrinkFill)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(drinkColor)
                
                Image(.TestImages.testMojitoIce)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.7)

                Image(.TestImages.testMojitoFloatingLime)
                    .resizable()
                    .scaledToFit()
                
                Image(.TestImages.testMojitoMuddledLeaves)
                    .resizable()
                    .scaledToFit()
                
                Image(.TestImages.testMojitoStraw)
                    .resizable()
                    .scaledToFit()
                
                Image(.TestImages.testMojitoDrinkFill)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(drinkColor)
                    .opacity(0.22)
                
                Image(.TestImages.testMojitoGlassWhiteInnerRim)
                    .resizable()
                    .scaledToFit()
                
                Image(.TestImages.testMojitoGlassFrontGradient)
                    .resizable()
                    .scaledToFit()
                
                Image(.TestImages.testMojitoLimeWedge)
                    .resizable()
                    .scaledToFit()
                
                Image(.TestImages.testMojitoMintGarnish)
                    .resizable()
                    .scaledToFit()
            }
            .shadow(radius: 5)
            .frame(width: 300, height: 300)
            .background(.brandPrimaryRed.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 60))
        }
        
        Spacer()
    }
}

#Preview {
    CocktailImage()
}
