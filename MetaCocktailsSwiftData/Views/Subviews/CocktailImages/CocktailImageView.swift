//
//  CocktailImage.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/9/23.
//

import SwiftUI
import SwiftData
//
@Model
class CocktailImage {
    
    var backgroundColor: Color.Resolved
    var drinkColor: Color.Resolved
    var glassBackLayer: String // we use this twice, once for background opacity
    var drinkLayer: String
    var iceLayer: String?
    var inDrinkComponents: [String]?
    var straw: String?
    // here will go another drinkLayer with opacity to cover ice / floating ingredients
    var innerRim: String
    var glassReflection: String
    var garnishes: [String]?
    
    init(backgroundColor: Color.Resolved, drinkColor: Color.Resolved, glassBackLayer: String, drinkLayer: String, iceLayer: String? = nil, inDrinkComponents: [String]? = nil, straw: String? = nil, innerRim: String, glassReflection: String, garnishes: [String]? = nil) {
        self.backgroundColor = backgroundColor
        self.drinkColor = drinkColor
        self.glassBackLayer = glassBackLayer
        self.drinkLayer = drinkLayer
        self.iceLayer = iceLayer
        self.inDrinkComponents = inDrinkComponents
        self.straw = straw
        self.innerRim = innerRim
        self.glassReflection = glassReflection
        self.garnishes = garnishes
    }
}

var MojitoCocktailImage = CocktailImage(backgroundColor: Color.pink.resolve(in: EnvironmentValues()),
                                        drinkColor: Color.teal.resolve(in: EnvironmentValues()),
                                        glassBackLayer: "Test_Mojito_BackGlassLayer",
                                        drinkLayer: "Test_Mojito_DrinkFill",
                                        iceLayer: "Test_Mojito_Ice",
                                        inDrinkComponents: ["Test_Mojito_FloatingLime", "Test_Mojito_MuddledLeaves"],
                                        straw: "Test_Mojito_Straw",
                                        innerRim: "Test_Mojito_GlassWhiteInnerRim",
                                        glassReflection: "Test_Mojito_GlassFrontGradient",
                                        garnishes: ["Test_Mojito_MintGarnish", "Test_Mojito_MuddledLeaves"])

struct CocktailImageView: View {
    
    var cocktailImage: CocktailImage
    
    
    var body: some View {
        
        VStack {
            ZStack {
                
                Image(cocktailImage.glassBackLayer)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(cocktailImage.backgroundColor)
                
                Image(cocktailImage.glassBackLayer)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .opacity(0.2)
                
                Image(cocktailImage.drinkLayer)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(color) // will change to cocktailImage.drinkColor
                
                if let iceLayer = cocktailImage.iceLayer {
                    Image(iceLayer)
                        .resizable()
                        .scaledToFit()
                        .opacity(0.7)
                }
                
                if let inDrinkComponents = cocktailImage.inDrinkComponents {
                    ForEach(inDrinkComponents,id: \.self) { item in
                        Image(item)
                            .resizable()
                            .scaledToFit()
                    }
                }
                
                if let straw = cocktailImage.straw {
                    Image(straw)
                        .resizable()
                        .scaledToFit()
                }
                
                Image(cocktailImage.drinkLayer)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(cocktailImage.drinkColor)
                    .opacity(0.22)
                
                Image(cocktailImage.innerRim)
                    .resizable()
                    .scaledToFit()
                
                Image(cocktailImage.glassReflection)
                    .resizable()
                    .scaledToFit()

                if let garnishes = cocktailImage.garnishes {
                    ForEach(garnishes, id: \.self) { garnish in
                        Image(garnish)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .shadow(radius: 5)
            .frame(width: 300, height: 300)
            .background(cocktailImage.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 60))
        }
        
        Spacer()
        
        VStack(alignment: .center) {
            ColorPicker("Select your drink's color", selection: $color)
            
            if let resolvedColor {
                Text("Red: \(resolvedColor.red, specifier: "%.2f")")
                Text("Green: \(resolvedColor.green, specifier: "%.2f")")
                Text("Blue: \(resolvedColor.blue, specifier: "%.2f")")
                Text("Opacity: \(resolvedColor.opacity, specifier: "%.2f")")
            }
        }
        .padding()
        .onChange(of: color, initial: true, getColor)
        
        Spacer()
    }
    
    func getColor() {
        resolvedColor = color.resolve(in: environment)
    }
    
    // For color picker used for testing, can be removed.
    @Environment(\.self) var environment
    @State private var color = Color.teal
    @State private var resolvedColor : Color.Resolved?
}

#Preview {
    CocktailImageView(cocktailImage: MojitoCocktailImage)
}
